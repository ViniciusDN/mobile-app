// find all
const connection = require('../Configs/dbConfiguration');
const findAll = async () => {
    const clientes = await (await connection).execute('SELECT * FROM clientes');
    return clientes[0];
};
// update
const update = async (cliente) => {
    const query = 'UPDATE clientes SET Nome = ?, sobrenome = ?, email = ?, avatarUrl = ? where id = ?';
    const isOk =
    await (await connection).execute(query,
        [cliente.nome, cliente.sobrenome, cliente.email, cliente.avatarUrl, cliente.id]);
    return isOk[0].affectedRows === 1;
};

// save
const save = async (cliente) => {
    console.log(cliente);
    console.log(cliente.toString());
    const query ='INSERT INTO clientes(nome, sobrenome, email, avatarUrl) VALUES (?, ?, ?, ?)';
    const isOk = await (await connection).execute(query,[cliente.nome, cliente.sobrenome, cliente.email, cliente.avatarUrl]);
    return isOk[0].affectedRows === 1;
};

// remove

const remove = async (id) => {
    const query = 'DELETE FROM clientes WHERE id = ?';
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
