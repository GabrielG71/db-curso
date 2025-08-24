// Criar banco
use dbBiblioteca;

// Coleções e inserts
db.livros.insertMany([
    { titulo: "Dom Casmurro", autor: "Machado de Assis", ano: 1899 },
    { titulo: "O Alienista", autor: "Machado de Assis", ano: 1882 }
]);

db.usuarios.insertMany([
    { nome: "Carlos", idade: 25 },
    { nome: "Ana", idade: 30 }
]);

db.emprestimos.insertMany([
    { usuario: "Carlos", livro: "Dom Casmurro", data: "2024-01-10" },
    { usuario: "Ana", livro: "O Alienista", data: "2024-02-05" }
]);

// Consultas
db.livros.find();
db.usuarios.find();
db.emprestimos.find({ usuario: "Carlos" });