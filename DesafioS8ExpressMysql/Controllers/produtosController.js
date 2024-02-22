// find all
const produtosService = require('../Services/produtosService');
const findAll = async (request, response) => {
    const produtos = await produtosService.findAll();
    return response.status(200).json(produtos);
};

// save
const save = async (request, response) => {
    console.log(request.body);
    const result = await produtosService.save(request.body);
    return result ?
        response.status(200).json() :
        response.status(400).json({ '[ERROR/SERVER]': 'Falha   ao salvar cliente' });
};

// update
const update = async (request, response) => {
    const result = await produtosService.update(request.body);
    return result ?
        response.status(200).json() :
        response.status(400).json({ '[ERROR/SERVER]': 'Falha ao  atualizar cliente' });
};

// remove
const remove = async (request, response) => {
    const { id } = request.params;
    const result = await produtosService.remove(id);
    return result ?
        response.status(200).json() :
        response.status(400).json({ '[ERROR/SERVER]': 'Falha ao  remover cliente'});
};

module.exports = {
    save,
    update,
    remove,
    findAll,
};
