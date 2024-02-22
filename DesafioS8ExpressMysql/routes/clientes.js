const express = require('express');
const router = express.Router();
const clienteController = require('../Controllers/clienteController');
const nomeMiddleware = require('../Middlewares/nomeMiddleware');
const sobrenomeMiddleware = require('../Middlewares/sobrenomeMiddleware');
const idadeMiddleware = require('../Middlewares/idadeMiddleware');


/* GET clientes*/
router.get('/', clienteController.findAll);
/* POST clientes*/

router.post('/', //nomeMiddleware.validateName,
    //sobrenomeMiddleware.validateFamilyName,
    //idadeMiddleware.validateAge,
    clienteController.save,
);
module.exports = router;
/* PUT clientes*/
router.put('/', //nomeMiddleware.validateName,
    //sobrenomeMiddleware.validateFamilyName,
    //idadeMiddleware.validateAge,
    clienteController.update);
/* DELETE clientes*/
router.delete('/:id', clienteController.remove);
