const imc = require('readline-sync');

console.log(' ----  CALCULADORA | IMC  ---- ')

const peso = imc.questionFloat("Qual seu peso? ");
const altura = imc.questionFloat("Qual sua altura? ");

const imcTotal = peso / (altura * altura)

console.log("\n----  RESULTADO | IMC  ----");
console.log(`Seu imc: ${imcTotal.toFixed(2)}`);