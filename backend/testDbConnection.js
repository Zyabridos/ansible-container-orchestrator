import pool from './db.js';
import { existsSync } from 'fs';

(async () => {
  console.log('.env exists:', existsSync('.env'));
  try {
    const res = await pool.query('SELECT NOW()');
    console.log('DB Connected:', res.rows[0]);
    process.exit(0);
  } catch (err) {
    console.error('DB Connection failed:', err.message);
    process.exit(1);
  }
})();
