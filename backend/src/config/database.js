const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL || 'postgresql://arec_user:arec_password@localhost:5432/arec_db'
});

module.exports = pool;
