// find all
const clienteService = require('../Services/clienteService');
const findAll = async (request, response) => {
    const clientes = await clienteService.findAll();
    return response.status(200).json(clientes);
};

// save
const save = async (request, response) => {
    const result = await clienteService.save(request.body);
    return result ?
        response.status(200).json() :
        response.status(400).json({ '[ERROR/SERVER]': 'Falha   ao salvar cliente' });
};

// update
const update = async (request, response) => {
    const result = await clienteService.update(request.body);
    return result ?
        response.status(200).json() :
        response.status(400).json({ '[ERROR/SERVER]': 'Falha ao  atualizar cliente' });
};

// remove
const remove = async (request, response) => {
    const { id } = request.params;
    const result = await clienteService.remove(id);
    return result ?
        response.status(200).json() :
        response.status(400).json({ '[ERROR/SERVER]': 'Falha ao  remover cliente' });
};

module.exports = {
    save,
    update,
    remove,
    findAll,
};
