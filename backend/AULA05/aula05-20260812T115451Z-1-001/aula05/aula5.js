const readline = require("readline-sync"); 

const nome = readline.question("Digite o nome do aluno: "); 
const idade = Number(readline.question("Qual a idade do aluno: "));
const cidade = readline.question("Digite a cidade: ");
const escola = readline.question("Digite o nome da Escola: ");
const anoLetivo = Number(readline.question("Digite o ano letivo: "));
const turma = readline.question("Digite a a turma do aluno: ")
const periodo = readline.question("Digite o periodo do aluno: ");
const disciplina = readline.question("Digite a disciplina: "); 
const cargaHoraria = Number(readline.question("Qual é a carga horaria da diciplina:"));
const nota1 = Number(readline.question("Digite a primeira nota: "));
const nota2 = Number(readline.question("Digite a segunda nota: ")); 
const faltas = Number(readline.question("Digite a quantidade de faltas: ")); 
const media = (nota1 + nota2) / 2; 

console.log("\n--- RELATÓRIO DO ALUNO ---"); 
console.log("Aluno:", nome); 
console.log("Idade:", idade);
console.log("Cidade:", cidade);
console.log("Escola:", escola);
console.log("Ano Letivo:", anoLetivo ,"Ano");
console.log("turma:",turma);
console.log("Período:", periodo);
console.log("Disciplina:", disciplina);
console.log("Carga Horaria:", cargaHoraria , "Horas"); 
console.log("Nota 1:", nota1); 
console.log("Nota 2:", nota2); 
console.log("Média:", media); 
console.log("Faltas:", faltas); 
