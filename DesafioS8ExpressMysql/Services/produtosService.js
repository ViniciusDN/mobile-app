// find all
const connection = require('../Configs/dbConfiguration');
const findAll = async () => {
    const produto = await (await connection).execute('SELECT * FROM produtos');
    return produto[0];
};
// update
const update = async (produto) => {
    const query ='UPDATE produtos SET Nome = ?, descricao = ?, preco = ? , data_atualizado = ? where id = ?';
    const isOk = await (await connection).execute(query, [produto.Nome, produto.Descricao, produto.Preco, produto.data_atualizado, produto.id]);
    return isOk[0].affectedRows === 1;
};

// save
const save = async (produto) => {
    const query ='INSERT INTO produtos (Nome, Descricao, Preco, data_atualizado)VALUES (?, ?, ?,?)';
    const isOk =await(await connection).execute(query, [produto.Nome, produto.Descricao, produto.Preco, produto.data_atualizado]);
    return isOk[0].affectedRows === 1;
};

// remove

const remove = async (id) => {
    const query = 'DELETE FROM produtos WHERE id = ?';
    const isOk = await (await connection).execute(query, [id]);
    return isOk[0].affectedRows === 1;
};
//   exportacao modulo

module.exports = {
    findAll,
    save,
    remove,
    update,
};
