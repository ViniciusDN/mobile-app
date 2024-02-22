const express = require('express');
const router = express.Router();
const produtosController = require('../Controllers/produtosController');
const precoMiddleware = require('../Middlewares/Preco');
const produtosNome = require('../Middlewares/ProdutoNome.js');
/* GET clientes*/
router.get('/', produtosController.findAll);
/* POST clientes*/
router.post('/', //precoMiddleware.validaPreco,
    //produtosNome.validateName,
    produtosController.save);
module.exports = router;
/* PUT clientes*/
router.put('/', //precoMiddleware.validaPreco,
    //produtosNome.validateName,
    produtosController.update);
/* DELETE clientes*/
router.delete('/:id', produtosController.remove);
