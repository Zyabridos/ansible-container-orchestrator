import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const ssl =
  process.env.DB_SSL === 'true'
    ? { rejectUnauthorized: false }
    : false;

const pool = new pg.Pool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  ssl,
});

export default pool;
