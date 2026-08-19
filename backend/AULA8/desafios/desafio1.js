const entrada = require("readline-sync");

console.log("-----------------------------------");
console.log(" SISTEMA DE VERIFICAÇÃO: ACESSO AO LABORATÓRIO ");
console.log("-----------------------------------");

const nome = entrada.question("Nome do aluno: ");
const idade = entrada.questionInt("Idade do aluno: ");
const autorizacao = entrada.question("Possui autorizacao? (S/N): ");
const acompanhado = entrada.question("Possui acompanhamento profissional? S/N: ");
const suspenso = entrada.question("O aluno está suspenso? (S/N): ");

console.log(`\nAluno: ${nome}`);

if (suspenso === "S") {
    console.log("ACESSO NEGADO: Aluno está suspenso do laboratório.");
} 
else if (idade >= 16 && (autorizacao === "S" || acompanhado === "S")) {
    console.log("ACESSO LIBERADO: Você possui os requisitos necessários!");
} 
else if (idade < 16 && acompanhado === "S") {
    console.log("ACESSO LIBERADO: Você possui acompanhamento profissional!");
} 
else if (idade < 16 && autorizacao === "S" && acompanhado === "N") {
    console.log("ACESSO NEGADO: Menores de 16 anos precisam de acompanhamento profissional.");
} 
else {
    console.log("ACESSO NEGADO: Você não possui os requisitos necessários.");
}