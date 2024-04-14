// Update with your config settings.
import 'dotenv/config';
import { getConfigVar } from './lib/config';

type DB_CONFIG = {
  dbClusterIdentifier: string;
  engine: 'postgres';
  host: string;
  password: string;
  port: number;
  username: string;
};

const rawDbSecret = getConfigVar('DB');
const DB_CONFIG: DB_CONFIG = rawDbSecret ? JSON.parse(rawDbSecret) : {};

// in AWS the parts are stored in Secret Manager and so we have to
// build the connection string ourselves.
// locally, we set DATABASE_URL so if it is, we default to that,
// otherwise we expect the AWS one to be set. If neither are set
// then everything will break
const AWS_DB_URL = `postgres://${DB_CONFIG.username}:${DB_CONFIG.password}@${DB_CONFIG.host}/core`;
const DATABASE_URL_ENV = getConfigVar('DATABASE_URL');

const DATABASE_URL = DB_CONFIG.username ? AWS_DB_URL : DATABASE_URL_ENV;

if (DATABASE_URL !== AWS_DB_URL) {
  console.log('Utilizing DATABASE_URL_ENV instead of AWS_DB_URL');
}

module.exports = {
  development: {
    client: 'pg',
    connection: DATABASE_URL,
  },

  test: {
    client: 'pg',
    connection: DATABASE_URL.replace(
      '/core?schema=public',
      '/coretest?schema=public',
    ),
  },

  staging: {
    client: 'pg',
    connection: DATABASE_URL,
  },

  production: {
    client: 'pg',
    connection: DATABASE_URL,
  },
};