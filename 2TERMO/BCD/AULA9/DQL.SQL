-- Active: 1788267989057@@127.0.0.1@3306@smartcoffee_dml_julia

INSERT INTO cliente (nome, email, telefone, cidade) VALUES
('Julia Moraes', 'julia.moraes@email.com', '19993535574', 'São Paulo',TRUE);

-- CONSULTAS COM SELECT
-- ESTRUTURA DE CONSTRUÇÃO DO SELECT

-- SELECT coluna
-- FROM tabela


--  EX 1; SELECT PARA TODAS AS COLUNAS

-- SELECT * FROM cliente;


--  EX 2; SELECT PARA COLUNAS

-- SELECT nome, email FROM cliente;


--  EX 3;  ALIAS É UM APELIDO PARA O RESULTADO

-- SELECT nome AS Cliente,
--            telefone AS Contato
-- FROM cliente;


-- O 3 NA PRATICA

-- SELECT nome AS Cliente,
--            ativo AS Status
-- FROM cliente;


-- EX 3;  EXPRESSÕES MATEMÁTICAS

-- SELECT nome, preco, preco * 0.80 AS preco_promocao
-- FROM produto;


-- EX 4; ELIMINANDO REPETIÇÕES
-- SEM DISTINCT - APARECE VARIAS VEZES A MESMA "CIDADE" | COM DISTINCT - APARECE UMA VEZ SÓ A CIDADE, SEM REPETIÇÕES

--SELECT DISTINCT cidade 
--FROM cliente;

-- SELECT cidade FROM cliente


-- EX 5; FILTROS EM REGISTROS

SELECT nome, preco
FROM produto
WHERE preco > 10;

SELECT nome, preco
FROM produto
WHERE preco <> 10; 

SELECT nome, preco
FROM produto
WHERE ativo = TRUE;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;

-- OUTROS OPERADORES DE COMPARAÇÃO

-- = IGUAL | <> DIFERENTE | != DIFERENTE | < MENOR | > MAIOR | <= MENOR OU IGUAL | >= MAIOR OU IGUAL | + MAIS | - MENOS | * VEZES | / DIVIDIDO | % RESTO DA DIVISÃO


-- EX 6; AND, OR E NOT

-- EX COM AND
SELECT nome, preco
FROM produto
WHERE preco >= 8 AND preco <= 20;

-- EX COM OR
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';

-- EX COM NOT
SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';

-- EXEMPLO COM AND E OR JUNTOS UTILIZAR ( )
SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Americana');


-- EX 7: BETWEEN - PESQUISA POR INTERVALOS
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';

-- EX 8; IN - VARIAS POSSIBILIDADES
-- USAR PARA ELIMINAR A QUANTIDADE DE OR

SELECT nome, cidade
FROM cliente    
WHERE cidade IN ('Limeira', 'Piracicaba', 'Americana');

SELECT nome, cidade
FROM cliente    
WHERE cidade NOT IN ('Limeira', 'Piracicaba', 'Americana');


-- EX 9: LIKE - PESQUISANDO POR TEXTOS

SELECT nome
FROM produto
WHERE nome LIKE 'Café%';
-- COMEÇA COM A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate%';
-- POSSUI A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%silva';
-- UTILIZANDO % COMO CORINGA

SELECT nome
FROM produto
WHERE nome LIKE '_ilva';
-- UTILIZANDO _ COMO CORINGA


-- EX 10; NULL - AUSENCIA DE VALORES
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;


-- EX 11; ORDER BY - ORDENANDO RESULTADOS
SELECT nome, preco
FROM produto
ORDER BY preco ASC;

SELECT nome, preco
FROM produto
ORDER BY preco DESC;


SELECT nome, preco
FROM produto   
ORDER BY preco DESC, nome ASC;


-- EX 12; LIMIT - LIMITANDO RESULTADOS
SELECT nome, preco  
FROM produto
ORDER BY preco DESC
LIMIT 10;

SELECT nome, preco  
FROM produto    
ORDER BY nome
LIMIT 5 OFFSET 5;


-- EX 13; COLUNAS COM CALCULOS
SELECT nome, preco, preco * 0.80 AS preco_com_reajuste
FROM produto;

-- CALCULO COM SUBTOTAL
SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS subtotal
FROM item_pedido;


-- EX 14; FUNÇÕES UTEIS EM CONSULTAS

SELECT UPPER(nome) AS nome_maiusculo
        LOWER(email) AS Email_Minusculo
FROM cliente;
-- deixar em maiusculo e minusculo

SELECT CONCAT(nome, ' - ', email) AS cliente_cidade
FROM cliente;
-- juntar informações entre campos

SELECT nome, preco, ROUND(preco * 0.90, 2) AS preco_desconto
FROM produto;
-- arredondar valores

SELECT id_pedido, data_pedido, DATE(data_pedido) AS Data_Pedido, YEAR(data_pedido) AS Ano_Pedido, MONTH(data_pedido) AS Mes_Pedido, DAY(data_pedido) AS Dia_Pedido
FROM pedido;
-- separar informações de data em ano, mes e dia

-- substituindo null para texto desejado
SELECT nome, 
COALESCE(telefone, 'Nao Informado') AS telefone
FROM cliente;
-- FUNÇÕES DE AGREGAÇÕES


-- EX 15: FUNÇÕES DE CÁLCULOS AGREGADOS
-- COUNT() - CONTAR
-- SUM() - SOMAR
-- AVG() - MÉDIA
-- MIN() - MÍNIMO
-- MAX() - MÁXIMO

SELECT COUNT(*) AS TOTAL_CLIENTES
FROM cliente;
-- QUANTOS CLIENTES TEMOS

SELECT AVG(preco) AS PRECO_MEDIO
FROM produto;

-- CALCULE O PREÇO MÉDIO DOS PRODUTOS

SELECT MIN(preco) AS MENORES_PREÇOS,
       MAX(preco) AS MAIORES_PREÇOS,
       AVG(preco) AS MÉDIA_PREÇOS
FROM produto;

-- RESUMO DOS PREÇOS

SELECT SUM(valor_total) AS FATURAMENTO
FROM pedido
WHERE status = 'FINALIZADO';

-- TOTAL PEDIDOS FINALIZADOS

-- EX 16; AGROUP BY - AGRUPANDO DADOS

SELECT cidade,
        COUNT(*) AS quantidade_clientes
FROM cliente    
GROUP BY cidade;
-- QUANTOS CLIENTES TEMOS POR CIDADE

SELECT id_categoria,
        COUNT(*) AS quantidade_produtos
FROM produto
GROUP BY id_categoria;
-- QUANTOS PRODUTOS TEMOS POR CATEGORIA

-- EX 17; HAVING - FILTRANDO AGRUPAMENTOS
SELECT cidade,
        COUNT(*) AS quantidade_clientes 
FROM cliente
GROUP BY cidade
HAVING COUNT(*) > 5;
-- QUANTOS CLIENTES TEMOS POR CIDADE, FILTRANDO AGRUPAMENTOS


-- EX 18; RESUMO E ORDEM DE UMA CONSULTA COMPLETA

-- SELECT colunas
-- FROM tabela
-- WHERE condicao
-- GROUP BY colunas_agrupar
-- HAVING condicao_agrupar
-- ORDER BY colunas
--LIMIT quantidade;
-- EXEMPLO DE CONSULTA COMPLETA


SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
WHERE cidade = 'limeira'
GROUP BY cidade  
HAVING COUNT(*) >= 3
LIMIT 4;