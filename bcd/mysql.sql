 create database if not exists oficina_ware;
use oficina_ware;

create table clientes (
    id_clientes int auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(14) not null,
    datanasc date not null,
    telefone varchar(15) not null,
    divida decimal not null

);

create table veiculos (
    id_veiculos int auto_increment primary key,
    marca varchar(50) not null,
	placa varchar(8) not null,
    valor decimal not null,
    cor varchar(30) not null,
    taxas decimal not null
    
);

create table marcas (
    id_marcas int auto_increment primary key,
    nome_marca varchar(50) not null,
    pais_origem varchar(50) not null,
    data_cadastro date not null,
    quantidade int not null,
    status varchar(20)
    
);

create table modelos (
    id_modelos int auto_increment primary key,
    tipo varchar(50) not null,
    nome varchar(100) not null,
    lote varchar(20) not null,
    cor varchar(30) not null,
    ano_lancamento int not null
    
);

create table funcionarios (
    id_funcionarios int auto_increment primary key,
    nome varchar(100) not null,
    funcao varchar(50) not null,
    salario decimal not null,
    turno varchar(20) not null,
    meta decimal not null
    
);

create table servicos (
    id_servicos int auto_increment primary key,
    nome_setor varchar(50) not null,
    descricao_servico text not null,
    comissao_atendente decimal not null,
    horario_consumo time not null,
    codigo_servicousado varchar(20) not null
    
);

create table fornecedor (
    id_fornecedor int auto_increment primary key,
    lugar varchar(100) not null,
    quantidade int not null,
    estoque int not null,
    reparos varchar(100) not null,
    garantia varchar(40) not null
    
);

create table pecas (
    id_pecas int auto_increment primary key,
    tipo varchar(30) not null,
    nome varchar(60) not null,
    tamanho varchar(10),
    lote varchar(20) not null,
    garantia varchar(30) not null
    
);

create table ordensservicos (
    id_ordemservico int auto_increment primary key,
    data_retirada date not null,
    consultor varchar(60) not null,
    descontos decimal,
    status_produtoentregue varchar(20) not null,
    garantia varchar(30) not null
    
);

create table pagamento (
    id_pagamento int auto_increment primary key,
    valor decimal not null,
    taxa decimal not null,
    metodo varchar(30) not null,
    dataprevista_pagamento date not null,
    status_pedido varchar(20) not null
    
);

# ADICIONANDO

alter table clientes add column email varchar(100);
alter table veiculos add column ano int;
alter table marcas add column ativo varchar(10);
alter table modelos add column observacao text;
alter table funcionarios add column data_admissao date;
alter table servicos add column valor_base decimal(10,2);
alter table fornecedor add column cnpj varchar(18);
alter table pecas add column preco decimal(10,2);
alter table ordensservicos add column observacoes text;
alter table pagamento add column data_pagamento date;

# REMOVENDO

alter table clientes drop column email;
alter table veiculos drop column ano;
alter table marcas drop column ativo;
alter table modelos drop column observacao;
alter table funcionarios drop column data_admissao;
alter table servicos drop column valor_base;
alter table fornecedor drop column cnpj;
alter table pecas drop column preco;
alter table ordensservicos drop column observacoes;
alter table pagamento drop column data_pagamento;

# RENOMEANDO

rename table modelos to modelos_fab;