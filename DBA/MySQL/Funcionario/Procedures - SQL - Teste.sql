/*Criar uma procedure chamada PRC_MENSAGEM*/

DELIMITER $$
CREATE PROCEDURE prc_mensagem ( )
BEGIN -- Começo --
SELECT 'BEM VINDO AO MYSQL';
END $$ -- Final da procedure --
DELIMITER ;



/*Criar stored procedure que apresente os cargos*/

DELIMITER $$
CREATE PROCEDURE prc_tipos_cargos ( )
BEGIN -- Começo --
SELECT * FROM cargos;
END $$ -- Final da procedure --
DELIMITER ;



/*Criar stored procedure que apresente os departamentos*/

DELIMITER $$
CREATE PROCEDURE prc_tipos_departamentos ( )
BEGIN
SELECT * FROM departamentos;
END $$
DELIMITER ;




/*Criar stored procedure que apresente os dependentes*/

DELIMITER $$
CREATE PROCEDURE prc_dependentes ( )
BEGIN
SELECT * FROM dependentes;
END $$
DELIMITER ;



/*Criar stored procedure que apresente os funcionarios*/

DELIMITER $$
CREATE PROCEDURE prc_funcionarios ( )
BEGIN
SELECT * FROM funcionarios;
END $$
DELIMITER ;



/* Comando de SELECIONAR Exibindo o codigo do CARGOS
que inciam com A ou termina com S */

DELIMITER $$
CREATE PROCEDURE prc_cargo_a ( )
BEGIN
SELECT cd_cargo , desc_cargo
FROM cargos
WHERE desc_cargo LIKE 'a%';
END $$
DELIMITER ;

CALL FUNCIONARIOS.prc_cargo_a;

/*Criar uma procedure chamada PRC_EXIBE_DEPTOS
Temos três tipos de parâmetros:
IN – entrada
OUT – saída
IN OUT – entrada e saída*/

DELIMITER $$
CREATE PROCEDURE
prc_exibe_deptos (IN nome_departamento VARCHAR(100) )
BEGIN
DECLARE id INT;
SELECT MAX(cd_depto) INTO id FROM departamentos;
INSERT INTO departamentos (cd_depto,desc_depto)
VALUES(id+1 , nome_departamento);
END $$
DELIMITER ;

CALL funcionarios.prc_exibe_deptos('MEDICINA');

 /*
&& representa OU;
IF representa SE e ELSE senão.
Este comando coloca uma regra de negócio e é finalizado com END IF
*/

/*Incrementar uma regra de negócio, por exemplo, o usuário é obrigado a passar
o nome do departamnento , caso contrário é exibido uma mensagem*/
DELIMITER $$
CREATE PROCEDURE
prc_insere_deptos (IN nome_departamento VARCHAR(100))
BEGIN
DECLARE id INT;
IF /*SE*/ ( (nome_departamento != ' ') OR /*OU*/ (nome_departamento != NULL) )
THEN /*ENTÃO*/
SELECT max(cd_depto) INTO id FROM departamentos;
INSERT INTO departamentos(cd_depto,desc_depto)
VALUES(id+1, nome_departamento);
ELSE /*SE NÃO*/
SELECT 'O Departamento dever ser informado!'AS Mensagem;
END IF;
END $$;
DELIMITER ;

CALL funcionarios.prc_insere_deptos(NULL);


DELIMITER $$
CREATE PROCEDURE prc_inserir_cargos_teste (IN nome_variavel INT,
IN nome_variavel2 VARCHAR(100))
BEGIN -- Começo --
INSERT INTO cargos (cd_cargo, desc_cargo) VALUES (nome_variavel, nome_variavel2);
END $$ -- Final da procedure --
DELIMITER ;
SELECT * FROM cargos;

CALL funcionarios.prc_inserir_cargos_teste(7, 'Medicina');

INSERT INTO cargos (cd_cargo, desc_cargo) VALUES (nome_variavel, nome_variavel2);
INSERT INTO cargos (cd_cargo, desc_cargo) VALUES (105,'Consultor');
