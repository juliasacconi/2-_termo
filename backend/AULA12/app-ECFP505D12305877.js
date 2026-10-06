const entrada = require ('readline-sync');
const oficina = require('./funcoesOficinas');

console.log("-------- SISTEMA DE GESTÃO 1.0 --------");

const peca = entrada.questionFloat("Preco da peca R$:  ");
const horas = entrada.questionInt("Horas de servico:  ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const total = oficina.calcularOrcamento(peca, horas);
const desconto = oficina.orcamentoComDesconto(total);

const garantia = oficina.verificarGarantia(tempoUso);

console.log("\n -------- RELATORIO DE SERVICO -------");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Orcamento com 20% OFF: ${desconto.toFixed(2)}`);
console.log(`Status de Garantia: ${garantia}`);
console.log("--------------------------------------")

