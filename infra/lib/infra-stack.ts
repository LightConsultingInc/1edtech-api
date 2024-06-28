import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as pattern from 'aws-cdk-lib/aws-ecs-patterns';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as certs from 'aws-cdk-lib/aws-certificatemanager';
import * as ecs from 'aws-cdk-lib/aws-ecs';
import * as ecr from 'aws-cdk-lib/aws-ecr';
import * as ecrAsset from 'aws-cdk-lib/aws-ecr-assets';
import * as iam from 'aws-cdk-lib/aws-iam';
import * as rds from 'aws-cdk-lib/aws-rds';
import * as logs from 'aws-cdk-lib/aws-logs';
import * as route53 from 'aws-cdk-lib/aws-route53';
import { Secret } from 'aws-cdk-lib/aws-secretsmanager';
import * as path from 'path';
import { execSync } from 'child_process';
import { version } from '../../package.json';
import 'dotenv';

const env = process.env.NODE_ENV || 'production';

function getGitRevision() {
  try {
    return execSync('git rev-parse HEAD').toString().trim();
  } catch (e) {
    return process.env.GITHUB_SHA || 'unset';
  }
}

function getDirtyState() {
  try {
    return execSync('git status -s').toString().trim();
  } catch (e) {
    return 'clean';
  }
}

function getGitBranchName() {
  try {
    return execSync('git branch --show-current').toString().trim();
  } catch (e) {
    return process.env.GITHUB_HEAD_REF || 'unset';
  }
}

export class InfraStack extends cdk.Stack {
  prefix: string;
  constructor(scope: Construct, id: string, props: cdk.StackProps) {
    super(scope, id, props);

    // jump back to the `rewards` directory
    const InceptDockerFilePath = path.join(__dirname, '..', '..');
    // get the git sha
    const revision = getGitRevision();
    const dirty = getDirtyState();
    const branchName = getGitBranchName();

    const vpc = ec2.Vpc.fromLookup(this, 'vpc', {
      vpcId: 'vpc-0587bce4face422f4',
    });

    const registry = new ecr.Repository(this, 'incept-registry', {
      imageTagMutability: ecr.TagMutability.IMMUTABLE,
      repositoryName: '1edtech-repo',
    });

    const rdsMasterUser = new Secret(this, 'incept-core-db-user-creds', {
      secretName: '1edtech-core-db-user-credentials',
      description: 'Master Creds for Croe DB',
      generateSecretString: {
        secretStringTemplate: JSON.stringify({ username: 'postgres' }),
        generateStringKey: 'password',
        passwordLength: 30,
        excludePunctuation: true,
      },
    });

    const dbSg = new ec2.SecurityGroup(this, 'incept-core-db-sg', {
      securityGroupName: '1edtech-core-db',
      vpc,
    });

    dbSg.addIngressRule(
      ec2.Peer.ipv4(vpc.vpcCidrBlock),
      ec2.Port.tcp(5432),
      `Allow port 5432 from within vpc`,
    );

    const coreDb = new rds.DatabaseCluster(this, 'incept-core-db', {
      clusterIdentifier: 'edtechcore',
      defaultDatabaseName: 'core',
      engine: rds.DatabaseClusterEngine.auroraMysql({
        version: rds.AuroraMysqlEngineVersion.VER_3_04_0,
      }),
      backup: {
        retention: cdk.Duration.days(14),
      },
      // @TODO: scale this for non-dev envs
      instances: 1,
      iamAuthentication: true,
      copyTagsToSnapshot: true,
      cloudwatchLogsRetention: logs.RetentionDays.ONE_MONTH,
      instanceProps: {
        vpc,
        vpcSubnets: {
          subnets: vpc.privateSubnets,
        },
        securityGroups: [dbSg],
        instanceType: ec2.InstanceType.of(
          ec2.InstanceClass.T3,
          ec2.InstanceSize.MEDIUM,
        ),
      },
      credentials: rds.Credentials.fromSecret(rdsMasterUser),
    });

    new cdk.CfnOutput(this, 'incept-core-db-Endpoints', {
      exportName: `${coreDb.stack.stackName}:Endpoints`,
      value: coreDb.instanceEndpoints.join(','),
    });

    new cdk.CfnOutput(this, 'incept-core-db-Cluster-Endpoint', {
      exportName: `${coreDb.stack.stackName}:Endpoint`,
      value: coreDb.clusterEndpoint.socketAddress,
    });

    const hostedZone = route53.HostedZone.fromHostedZoneAttributes(
      this,
      'incept-hostedzone',
      {
        zoneName: 'alpha1edtech.com',
        hostedZoneId: 'Z07100071SI52GQ72WJ93',
      },
    );

    const wildcardSSLCertARN =
      'arn:aws:acm:us-east-1:597610889212:certificate/6bf5292b-e47e-4885-bd9a-6c84c40bb8ee';
    const wildcardSSLCert = certs.Certificate.fromCertificateArn(
      this,
      'wildcard-ssl-cert',
      wildcardSSLCertARN,
    );

    const inceptRestService = new pattern.ApplicationLoadBalancedFargateService(
      this,
      'incept-core-service',
      {
        vpc,
        memoryLimitMiB: 1024,
        // @TODO: change this count to be dynamic for prod deploys
        desiredCount: 1,
        cpu: 512,
        securityGroups: [dbSg],
        taskImageOptions: {
          image: ecs.ContainerImage.fromAsset(InceptDockerFilePath, {
            //@TODO: for some reason this is NOT building the production target, but they are the same functionally
            target: 'dev',
            platform: ecrAsset.Platform.LINUX_AMD64,
          }),
          secrets: {
            DB: ecs.Secret.fromSecretsManager(rdsMasterUser),
          },
          environment: {
            NODE_ENV: env,
            CORE_VERSION: version,
            GIT_SHA: `${revision}:${dirty.length ? 'dirty' : 'clean'}`,
            GIT_BRANCH: branchName,
          },
          containerName: '1edtech',
          containerPort: 3010,
        },
        loadBalancerName: '1edtech-lb',
        domainName: 'core.alpha1edtech.com',
        domainZone: hostedZone,
        certificate: wildcardSSLCert,
        publicLoadBalancer: true,
      },
    );

    inceptRestService.taskDefinition.taskRole.attachInlinePolicy(
      new iam.Policy(this, 's3-access-policy', {
        statements: [
          new iam.PolicyStatement({
            actions: ['s3:*'],
            effect: iam.Effect.ALLOW,
            resources: ['*'],
          }),
        ],
      }),
    );
  }
}
