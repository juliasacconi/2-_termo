const fs = require ('fs');

console.log("=== SISTEMA DE MONITORAMENTO INDUSTRIAL ===");

const sensores = [
    {cod: 1001, tipo: "Temperatura", leituraAtual: 45.5, status: "Operando"},
    {cod: 1002, tipo: "Pressao", leituraAtual: 4, status: "Operando"},
    {cod: 1003, tipo: "Temperatura", leituraAtual: 145.5, status: "Alerta!"}
];

const tempParaGravar = JSON.stringify(sensores, null, 2);

fs.writeFileSync('sensores.json', tempParaGravar);
console.log(`\n Gravacao concluida com sucesso.`);
