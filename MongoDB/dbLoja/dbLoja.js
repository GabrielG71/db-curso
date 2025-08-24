// Criar banco
use dbLoja;

// Coleções e inserts
db.produtos.insertMany([
    { nome: "Notebook", preco: 3500, estoque: 10 },
    { nome: "Mouse", preco: 80, estoque: 100 },
    { nome: "Teclado", preco: 150, estoque: 50 }
]);

db.clientes.insertMany([
    { nome: "Gabriel", email: "gabriel@email.com" },
    { nome: "Isabella", email: "isa@email.com" }
]);

db.pedidos.insertMany([
    { cliente: "Gabriel", produtos: ["Notebook", "Mouse"], total: 3580 },
    { cliente: "Isabella", produtos: ["Teclado"], total: 150 }
]);

// Consultas
db.produtos.find();
db.clientes.find();
db.pedidos.find({ cliente: "Gabriel" });