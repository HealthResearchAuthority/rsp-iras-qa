// import * as dotenv from 'dotenv';
import sql from 'mssql';

const server = 'rspsqlserverautomationtest.database.windows.net';
const database = 'applicationservice';
const port = 1433;
// const type = 'azure-active-directory-default';
const user = 'rspsqladmin';
const password = process.env.DB_PASS;

export const passwordConfig = {
  server,
  port,
  database,
  user,
  password,
  options: {
    encrypt: true,
  },
};

export async function connect(): Promise<sql.ConnectionPool | undefined> {
  try {
    const poolconnection = await sql.connect(passwordConfig);
    this.connected = true;
    console.log('Database connected successfully.');
    return poolconnection;
  } catch (error) {
    console.error('Error connecting to the database:', error);
    this.connected = false;
  }
}
