// Criar banco
use dbFaculdade;

// Coleções e inserts
db.alunos.insertMany([
    { nome: "Lucas", idade: 20, curso: "ADS" },
    { nome: "Mariana", idade: 22, curso: "Engenharia" }
]);

db.cursos.insertMany([
    { nome: "ADS", duracao: 3 },
    { nome: "Engenharia", duracao: 5 }
]);

db.matriculas.insertMany([
    { aluno: "Lucas", curso: "ADS", semestre: 1 },
    { aluno: "Mariana", curso: "Engenharia", semestre: 3 }
]);

// Consultas
db.alunos.find();
db.cursos.find();
db.matriculas.find({ curso: "ADS" });