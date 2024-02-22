const validaPreco = (request, response, next) => {
    const { body } = request;
    if (body.Preco == undefined) {
        return response.status(400)
            .json({ message: 'O campo "Preco" é obrigatório' });
    }
    if (body.Preco === '') {
        return response.status(400)
            .json({ message: 'O campo "Preco" não pode ser vazio' });
    }
    next();
};
module.exports = { validaPreco };
