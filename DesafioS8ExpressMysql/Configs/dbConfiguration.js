const mysql = require('mysql2/promise');
require('dotenv').config();
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'root',
    port: 3306,
});
module.exports = connection;