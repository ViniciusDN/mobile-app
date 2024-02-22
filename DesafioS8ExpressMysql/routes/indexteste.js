var express = require('express');
const router = express.Router();
const mysql = require('mysql2/promise');
/* GET home page. */
router.get('/clientes', function (req, res, next) {
    mysql.createConnection({
        host: 'localhost', user: 'root', password: '',
        database: 'backend', port: 3306
    }).then((connection) => {
        connection.query('SELECT * FROM clientes;')
        .then((result) => { res.send(result[0]); });
    });
});

router.get('/produtos', function (req, res, next) {
    mysql.createConnection({
        host: 'localhost', user: 'root', password: '',
        database: 'crud-app', port: 3306
    }).then((connection) => {
        connection.query('SELECT * FROM produtos;')
        .then((result) => { res.send(result[0]); });
    });
});
module.exports = router;