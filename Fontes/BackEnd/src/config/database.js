import mysql from 'mysql';

// Conexao com o banco
const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "imp%01%bck",
    database: "meu_mercado"
});


export default db;