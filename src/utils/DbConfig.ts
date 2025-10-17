import sql from 'mssql';
import { getDecryptedValue, resolveEnvExpression } from './UtilFunctions';
import * as loginPageTestData from '../resources/test_data/common/login_page_data.json';

const server = 'rspsqlserverautomationtest.database.windows.net';
const database = 'applicationservice';
const port = 1433;
const user = loginPageTestData.DB_User.username;
const secretKey = process.env.DB_USER_SECRET_KEY;
const authTag = process.env.DB_USER_AUTH_TAG;
const password = getDecryptedValue(resolveEnvExpression(loginPageTestData.DB_User.password), secretKey, authTag);

export const passwordConfig = {
  server,
  port,
  database,
  user,
  password,
  options: {
    encrypt: true,
    trustServerCertificate: true,
  },
};

export async function connect(): Promise<sql.ConnectionPool | undefined> {
  try {
    const poolconnection = await sql.connect(passwordConfig);
    return poolconnection;
  } catch (error) {
    console.error(error);
    throw new Error('Error connecting to the database. See logs');
  }
}
