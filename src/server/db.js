// server/db.js
import mysql from "mysql2"

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root123', // replace this
  database: 'training_platform', // replace this
});

db.connect((err) => {
  if (err) {
    console.error('DB connection failed:', err.message);
    process.exit(1);
  }
  console.log('✅ Connected to MySQL DB');
});

export default db;
