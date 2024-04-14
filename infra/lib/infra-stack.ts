import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as pattern from 'aws-cdk-lib/aws-ecs-patterns';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as certs from 'aws-cdk-lib/aws-certificatemanager';
import * as ecs from 'aws-cdk-lib/aws-ecs';
import * as ecr from 'aws-cdk-lib/aws-ecr';
import * as ecrAsset from 'aws-cdk-lib/aws-ecr-assets';
import * as rds from 'aws-cdk-lib/aws-rds';
import * as logs from 'aws-cdk-lib/aws-logs';
import * as route53 from 'aws-cdk-lib/aws-route53';
import { Secret } from 'aws-cdk-lib/aws-secretsmanager';
import * as path from 'path';
import { execSync } from 'child_process';
import { version } from '../../package.json';

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
    const rewardsDockerfilePath = path.join(__dirname, '..', '..');
    // get the git sha
    const revision = getGitRevision();
    const dirty = getDirtyState();
    const branchName = getGitBranchName();

    const vpc = ec2.Vpc.fromLookup(this, 'vpc', {
      vpcId: 'vpc-0587bce4face422f4',
    });

    const registry = new ecr.Repository(this, 'rewards-registry', {
      imageTagMutability: ecr.TagMutability.IMMUTABLE,
      repositoryName: 'rewards-repo',
    });

    const rdsMasterUser = new Secret(this, 'rewards-db-user-creds', {
      secretName: 'rewards-db-user-credentials',
      description: 'Master Creds for Croe DB',
      generateSecretString: {
        secretStringTemplate: JSON.stringify({ username: 'postgres' }),
        generateStringKey: 'password',
        passwordLength: 30,
        excludePunctuation: true,
      },
    });

    const dbSg = new ec2.SecurityGroup(this, 'rewards-db-sg', {
      securityGroupName: 'rewards-db',
      vpc,
    });

    dbSg.addIngressRule(
      ec2.Peer.ipv4(vpc.vpcCidrBlock),
      ec2.Port.tcp(5432),
      `Allow port 5432 from within vpc`,
    );

    const rewardsDb = new rds.DatabaseCluster(this, 'rewards-db', {
      clusterIdentifier: 'rewardsdb',
      defaultDatabaseName: 'rewardsdb',
      engine: rds.DatabaseClusterEngine.auroraPostgres({
        version: rds.AuroraPostgresEngineVersion.VER_15_3,
      }),
      backup: {
        retention: cdk.Duration.days(14),
      },
      // @TODO: scale this for non-dev envs
      instances: 1,
      iamAuthentication: true,
      copyTagsToSnapshot: true,
      cloudwatchLogsExports: ['postgresql'],
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

    new cdk.CfnOutput(this, 'Rewards-DB-Endpoints', {
      exportName: `${rewardsDb.stack.stackName}:Endpoints`,
      value: rewardsDb.instanceEndpoints.join(','),
    });

    new cdk.CfnOutput(this, 'Rewards-DB-Cluster-Endpoint', {
      exportName: `${rewardsDb.stack.stackName}:Endpoint`,
      value: rewardsDb.clusterEndpoint.socketAddress,
    });

    const hostedZone = route53.HostedZone.fromHostedZoneAttributes(
      this,
      'alphaflashcards-hostedzone',
      {
        zoneName: 'alphaflashcards.com',
        hostedZoneId: 'Z01068543RZNP42QJ3RME',
      },
    );

    // cert for api.alphaflashcards.com
    // cert for *.alphaflashcards.com
    // we generated this via the UI because we don't want to run into a situation where a change here
    // results in a whole new SSL cert being generated for any reason.
    // We also have *.alphaflashcards.com as a SAN so we want to ensure that
    // it doesn't get changed for any other stacks.
    // Also validating the cert can take some unknown amount of time and we don't want
    // a deploy to hang because of an unexpected cert update.
    // Why didn't we put it in the infra stack?: Same reasons, but we can port it there eventually.
    const wildcardSSLCertARN =
      'arn:aws:acm:us-east-1:597610889212:certificate/65b0e636-75ab-481f-ac25-380caa1db3ea';
    const wildcardSSLCert = certs.Certificate.fromCertificateArn(
      this,
      'wildcard-ssl-cert',
      wildcardSSLCertARN,
    );
    const rewardsRestService =
      new pattern.ApplicationLoadBalancedFargateService(this, 'rewards', {
        vpc,
        memoryLimitMiB: 1024,
        // @TODO: change this count to be dynamic for prod deploys
        desiredCount: 1,
        cpu: 512,
        securityGroups: [dbSg],
        taskImageOptions: {
          image: ecs.ContainerImage.fromAsset(rewardsDockerfilePath, {
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
            REWARDS_API_KEY: process.env.REWARDS_API_KEY || '',
            REWARDS_API_URL: process.env.REWARDS_API_URL || '',
          },
          containerName: 'rewards',
          containerPort: 3000,
        },
        loadBalancerName: 'alphaedu-rewards-lb',
        domainName: 'rewards.api.alphaflashcards.com',
        domainZone: hostedZone,
        certificate: wildcardSSLCert,
        publicLoadBalancer: true,
      });

    // OK I don't like this.. the problem is that the way the hasura container
    // needs to be configured is via environment variable
    const host = rdsMasterUser.secretValueFromJson('host').unsafeUnwrap();
    const user = rdsMasterUser.secretValueFromJson('username').unsafeUnwrap();
    const pass = rdsMasterUser.secretValueFromJson('password').unsafeUnwrap();
    const dbname = rdsMasterUser.secretValueFromJson('dbname').unsafeUnwrap();

    const hasuraService = new pattern.ApplicationLoadBalancedFargateService(
      this,
      'hasura',
      {
        vpc,
        memoryLimitMiB: 1024,
        // @TODO: change this count to be dynamic for prod deploys
        desiredCount: 1,
        cpu: 512,
        securityGroups: [dbSg],
        //@TODO: temporary to force the system to wait because of the funky restart process
        healthCheckGracePeriod: cdk.Duration.minutes(3),
        taskImageOptions: {
          image: ecs.ContainerImage.fromAsset(
            path.join(__dirname, '..', '..'),
            {
              file: 'hasura-deploy.Dockerfile',
              platform: ecrAsset.Platform.LINUX_AMD64,
            },
          ),
          secrets: {
            DB: ecs.Secret.fromSecretsManager(rdsMasterUser),
          },
          environment: {
            NODE_ENV: env,
            CORE_VERSION: version,
            GIT_SHA: `${revision}:${dirty.length ? 'dirty' : 'clean'}`,
            GIT_BRANCH: branchName,
            // hasura specific env vars
            HASURA_GRAPHQL_DATABASE_URL: `postgres://${user}:${pass}@${host}:5432/${dbname}`,
            PG_DATABASE_URL: `postgres://${user}:${pass}@${host}:5432/${dbname}`,
            HASURA_GRAPHQL_ENABLE_CONSOLE: 'true',
            HASURA_GRAPHQL_DEV_MODE: 'true',
            HASURA_GRAPHQL_ENABLE_TELEMETRY: 'false',
            HASURA_GRAPHQL_ENABLED_LOG_TYPES:
              'startup, http-log, webhook-log, websocket-log, query-log',
            PORT: '8080',
          },
          containerName: 'hasura-graphql-engine',
          containerPort: 8080,
        },
        loadBalancerName: 'rewards-hasura-alb',
        domainName: 'rewards.graphql.alphaflashcards.com',
        domainZone: hostedZone,
        certificate: wildcardSSLCert,
        publicLoadBalancer: true,
      },
    );

    hasuraService.targetGroup.healthCheck = {
      path: '/healthz',
      port: '8080',
    };
  }
}
