const Pool = require("pg").Pool

const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    connectionTimeoutMillis: 5000
})

module.exports = pool
