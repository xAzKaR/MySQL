#APAGANDO UM BANCO DE DADOS#
#DROP DATABASE cinema;
#DROP DATABASE IF EXISTS cinemas;


#CRIANDO UM BANCO DE DADOS#
CREATE DATABASE IF NOT EXISTS cinema;
#CREATE DATABASE IF NOT EXISTS cinema;


#Utilizando/Selecionando um banco de dados criado#
USE cinema;



#Tabela Cinema#
CREATE TABLE IF NOT EXISTS `cinema`.`cinemas`
(
cod_cine INT NOT NULL,
cnpj_cine VARCHAR(32),
local_cine VARCHAR(150),
capac_cine int,
-- Chave primária --
	PRIMARY KEY (`cod_cine`)
);



#Tabela funcionarios#
CREATE TABLE IF NOT EXISTS `cinema`.`funcionarios`
(
matri_func INT,
nm_func VARCHAR(255),
end_func VARCHAR(50),
tel_func VARCHAR(12),
-- RELACIONAMENTOS --
cinema_cod_cine INT,
-- Chaves primárias --
	PRIMARY KEY (`matri_func`, `cinema_cod_cine`),
-- RELACIOMANETOS FK --
    CONSTRAINT `cinema_cod-cine` 
    FOREIGN KEY (`cinema_cod_cine`) REFERENCES `funcionarios`.`cinemas` (`cod_cine`)
    ON UPDATE CASCADE ON DELETE CASCADE
);



#Tabela Clientes#
CREATE TABLE IF NOT EXISTS `cinema`.`clientes` 
(
cod_cli INT,
nm_cli VARCHAR(100),
end_cli VARCHAR(100),
rg VARCHAR(15),
email_cli VARCHAR(45),
tel_cli VARCHAR(45),
cpf VARCHAR(14),
-- Relacionamentos --
-- CHAVES PRIMÁRIAS --
	PRIMARY KEY (`cod_cli`),
    UNIQUE (`rg`, `cpf`)
-- RELACIONAMENTOS FK --
);



#Tabela Sessão#
CREATE TABLE IF NOT EXISTS `cinema`.`sessao`
(
cod_sessao INT,
data_sessao DATE,
hora_sessao TIME,
-- -- Chaves primárias --
	PRIMARY KEY (`cod_sessao`)
);



#Tabela Filmes#
CREATE TABLE IF NOT EXISTS `cinema`.`filmes`
(
cod_filme INT,
tit_filme VARCHAR(100),
dur_filme VARCHAR(32),
gen_filme VARCHAR(50),
-- RELACIONAMENTOS
-- Chaves primárias --
	PRIMARY KEY (`cod_filme`)
-- RELACIONAMENTOS --
);



#Tabela Produtos#
CREATE TABLE IF NOT EXISTS `cinema`.`produtos`
(
cod_prod INT,
nm_prod VARCHAR(100),
cat_prod VARCHAR(100),
desc_prod VARCHAR(100),
vlr_prod VARCHAR(32),
	PRIMARY KEY (`cod_prod`)
);



#Tabela Salas#
CREATE TABLE IF NOT EXISTS `cinema`.`salas`
(
cod_sala INT,
local_sala INT,
capac_sala INT,
tipo_sala VARCHAR(50),
reserv_sala BIT(1),
vlr_sala VARCHAR(32),
-- RELACIONAMENTOS --
sessao_cod_sessao INT,
filmes_cod_filme INT,
-- Chaves primárias --
	PRIMARY KEY (`cod_sala`, `sessao_cod_sessao`),/*possibilidade de adicionar dados de outro banco `nomedobanco`.`nomedatabela`*/
    UNIQUE (`local_sala`),
-- RELACIONAMENTOS --
	CONSTRAINT `Sessao_Salas`
    FOREIGN KEY (`sessao_cod_sessao`)  REFERENCES `cinema`.`sessao` (`cod_sessao`)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `Filmes_Salas`
    FOREIGN KEY (`filmes_cod_filme`)  REFERENCES `cinema`.`filmes` (`cod_filmne`)
    ON UPDATE CASCADE ON DELETE CASCADE
);


#Tabela Ingressos#
CREATE TABLE IF NOT EXISTS `cinema`.`ingressos`
(
cod_ingr INT,
tipo_ingr VARCHAR(100),
vlr_ingr DECIMAL(10,2),
#-- Relacionamentos --
filmes_cod_filme INT,
sessao_cod_sessao INT,
sala_cod_sala INT,
#-- Chaves primárias --
	PRIMARY KEY (`cod_ingr`),
-- RELACIONAMENTOS FK--
	CONSTRAINT `Filmes_Ingressos`
	FOREIGN KEY (`filmes_cod_filme`) REFERENCES `cinema`.`filmes` (`cod_filme`)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `Sessao_Ingressos`
	FOREIGN KEY (`sessao_cod_sessao`) REFERENCES `cinema`.`sessao` (`cod_sessao`)
	ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `Salas_Ingressos` 
	FOREIGN KEY (`salas_cod_sala`) REFERENCES `cinema`.`salas` (`cod_sala`) 
	ON UPDATE CASCADE ON DELETE CASCADE

);



#Tabela Serviços#
CREATE TABLE IF NOT EXISTS `cinema`.`servicos`
(
cod_serv INT NOT NULL,
tipo_serv VARCHAR(100),
vlr_serv DECIMAL(10,2),
desc_serv VARCHAR(32),
-- RELACIONAMENTOS --
filmes_cod_filme INT,
ingressos_cod_ingr INT,
sessao_cod_sessao INT,
salas_cod_sala INT,
produtos_cod_prod INT,
-- CHAVES PRIMÁRIAS --
	PRIMARY KEY (`cod_serv`),
-- RELACIONAMENTOS FK --
	CONSTRAINT `fk_Servicos_Filmes` FOREIGN KEY (`filmes_cod_filme`) REFERENCES `cinema`.`filmes` (`cod_filme`)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `fk_Servicos_Ingressos` FOREIGN KEY (`ingressos_cod_ingr`) REFERENCES `cinema`.`ingressos` (`cod_ingr`)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `fk_Servicos_Sessao` FOREIGN KEY (`sessao_cod_sessao`) REFERENCES `cinema`.`sessao` (`cod_sessao`)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `fk_Servicos_Salas` FOREIGN KEY (`salas_cod_sala`) REFERENCES `cinema`.`salas` (`cod_sala`)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `fk_Servicos_Produtos` FOREIGN KEY (`produtos_cod_prod`) REFERENCES `cinema`.`produtos` (`cod_prod`)
	ON UPDATE CASCADE ON DELETE CASCADE
);



#Tabela Pedidos#
CREATE TABLE IF NOT EXISTS `cinema`.`pedidos`
(
cod_ped INT,
clientes_cod_cli INT,
servicos_cod_serv INT,
-- Chaves primárias --
	PRIMARY KEY (`cod_ped`),
-- RELACIONAMENTO FK --
    CONSTRAINT `Clientes_Pedidos`
    FOREIGN KEY (`clientes_cod_cli`)  REFERENCES `cinema`.`clientes` (`cod_cli`)
    ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `Servicos_Pedidos`
    FOREIGN KEY (`servicos_cod_serv`)  REFERENCES `cinema`.`servicos` (`cod_serv`)
    ON UPDATE CASCADE ON DELETE CASCADE
);



#Tabela Pagamentos#
CREATE TABLE IF NOT EXISTS `cinema`.`pagamentos`
(
cod_pag INT,
data_pag DATE,
vlr_pag INT,
tipo_pag VARCHAR(32),
cpf VARCHAR(14),
-- RELACIONAMENTOS --
clientes_cod_ped INT,
-- CHAVES PRIMÁRIAS --
	PRIMARY KEY (`cod_pag`),
-- RELACIOMENTOS FK --
	CONSTRAINT `fk_pagamentos_pedidos`
    FOREIGN KEY (`clientes_cod_ped`)  REFERENCES `cinema`.`pedidos` (`cod_ped`)
    ON UPDATE CASCADE ON DELETE CASCADE
);