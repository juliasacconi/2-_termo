const entrada = require('readline-sync');

console.log("----  SISTEMA DE VENDAS | PADARIA  ----");

const nomeProduto = entrada.question("Qual o nome do produto? ");
const precoUnitario = entrada.questionFloat("Qual o preco unitario? ");
const quantidade = entrada.questionInt("Quantas unidades foram vendidas? ");

const total = precoUnitario * quantidade;

console.log("\n----  RECIBO DE VENDA  ----");
console.log(`Produto: ${nomeProduto}`);
console.log(`Total a pagar: R$ ${total.toFixed(2)}`);

