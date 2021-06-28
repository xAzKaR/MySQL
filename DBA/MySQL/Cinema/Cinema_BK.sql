#APAGANDO UM BANCO DE DADOS#
#DROP DATABASE cinema;
#DROP DATABASE IF EXISTS cinemas;


#CRIANDO UM BANCO DE DADOS#
CREATE DATABASE IF NOT EXISTS cinema_bk;
#CREATE DATABASE IF NOT EXISTS cinema;


#Utilizando/Selecionando um banco de dados criado#
USE cinema_bk;



#Tabela funcionarios#
CREATE TABLE IF NOT EXISTS `cinema_bk`.`funcionarios_bk`
(
matri_func INT,
nm_func VARCHAR(255),
end_func VARCHAR(50),
tel_func VARCHAR(12),
-- RELACIONAMENTOS --
cinema_cod_cine INT,
evento ENUM('D','U'),
-- Chaves primárias --
	PRIMARY KEY (`matri_func`, `cinema_cod_cine`)
-- RELACIOMANETOS FK --
);

ALTER TABLE `cinema_bk`.`clientes_bk`
ADD evento ENUM('D','U');

#Tabela Clientes#
CREATE TABLE IF NOT EXISTS `cinema_bk`.`clientes_bk` 
(
cod_cli INT,
nm_cli VARCHAR(100),
end_cli VARCHAR(100),
rg VARCHAR(15),
email_cli VARCHAR(45),
tel_cli VARCHAR(45),
cpf VARCHAR(14),
evento ENUM('D','U'),
-- Relacionamentos --
-- CHAVES PRIMÁRIAS --
	PRIMARY KEY (`cod_cli`),
    UNIQUE (`rg`, `cpf`)
-- RELACIONAMENTOS FK --
);