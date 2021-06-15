DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_inserir_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_cargos (IN nome_cargo VARCHAR(100) )
BEGIN -- COMEÇO --
	DECLARE id INT;
	SELECT MAX(cd_cargo) INTO id FROM cargos;
	INSERT INTO cargos (cd_cargo, desc_cargo)
	VALUES(id+1, nome_cargo);
END $$ -- FINAL DA PROCEDURE --
DELIMITER ;

SELECT * FROM cargos;
CALL funcionarios.prc_inserir_cargos('Relações Públicas');

#INSERT INTO cargos (cd_cargo, desc_cargo)
#VALUES(1, 'Informática');

-- TESTE COM IF EXISTS --
DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_inserir_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_cargos (IN nome_cargo VARCHAR(100) )
BEGIN -- COMEÇO --
	DECLARE id INT;
	IF EXISTS (SELECT desc_cargo FROM cargos WHERE desc_cargo = nome_cargo)
	THEN
		SELECT 'O cargo já existe!' AS Mensagem;
	ELSE
		SELECT MAX(cd_cargo) INTO id FROM cargos;
		INSERT INTO cargos (cd_cargo, desc_cargo)
		VALUES(id+1 , nome_cargo);
	END IF;
    SELECT * FROM cargos;
END $$ -- FINAL DA PROCEDURE --
DELIMITER ;

-- INSERIR CARGO --
CALL funcionarios.prc_inserir_cargos('Forrozeiro');



DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_update_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_update_cargos (IN nome_cargo VARCHAR(100), IN codigo_cargo INT)
BEGIN -- COMEÇO --

		UPDATE cargos SET desc_cargo = nome_cargo 
        WHERE cd_cargo = codigo_cargo;
        
		SELECT desc_cargo from cargos;
END $$ -- FINAL DA PROCEDURE --
DELIMITER ;

-- UPDATE DE CARGOS --
SELECT * from cargos;
CALL funcionarios.prc_update_cargos('Informática' , '1');


DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_delete_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_delete_cargos (IN cod_cargo INT, matricula INT)
BEGIN
	DELETE FROM dependentes WHERE mat_func = matricula;
	DELETE FROM funcionarios WHERE cd_cargo = cod_cargo;
	DELETE FROM cargos WHERE cd_cargo = cod_cargo;
	SELECT * from cargos;
END $$
DELIMITER ;

-- Executar a Procedure --
	SELECT * FROM DEPENDENTES;
	SELECT * FROM funcionarios;
	SELECT * from cargos;
CALL funcionarios.prc_delete_cargos(1, 1005);

-- TESTE VINCULAR ALGUÉM AO CARGO --
SELECT * FROM funcionarios;
INSERT INTO funcionarios (mat_func, nm_func, dt_nasc, sexo, est_civil, rg, nac_func, sal_func, cd_dep, cd_cargo, cd_depto)
VALUES (1006, 'Betina Mariane Baptista', '1992-10-05', 'F', 'Casada', '36.107.888-2', 'Brasileira', '9323', NULL, '6', '105' );

-- IN , OUT, IN OUT
IN ENTRADA
OUT Saída
INOUT Entrada/Saída

-- TESTE OUT --
DELIMITER $$
#DROP PROCEDURE prc_saida_cargos_teste;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_saida_cargos_teste (OUT saida_funcionarios INT, IN matricula INT)
BEGIN
	IF EXISTS (SELECT mat_func FROM dependentes WHERE mat_func = matricula)
    THEN
        
        SELECT nm_func 'Funcionário', cd_dep 'Código', nm_dep 'Dependente' 
        FROM funcionarios AS f JOIN dependentes AS d ON f.mat_func = d.mat_func;
        
        SELECT COUNT(mat_func) INTO saida_funcionarios FROM funcionarios
        WHERE mat_func = matricula;
        
    ELSE
		SELECT 'Esse funcionário não possui dependentes' AS Mensagem;
	END IF;
END $$
DELIMITER ;

SELECT * FROM funcionarios;
SELECT * FROM dependentes;
CALL funcionarios.prc_saida_cargos_teste(@saida_dependentes, 1004);
SELECT @saida_dependentes;

DROP PROCEDURE prc_saida_cargos_teste;


-- EXECUTAR SEMPRE AQUI PRIMEIRO --
#DROP PROCEDURE IF EXISTS prc_inserir_cargos_teste;
DELIMITER $$
CREATE PROCEDURE 
prc_inserir_cargos_teste (INOUT codigo_cargo INT, IN nome_cargo VARCHAR(100))
BEGIN
	
    INSERT INTO cargos (cd_cargo, desc_cargo)
    VALUE (codigo_cargo, nome_cargo);

END $$
DELIMITER ;

CALL funcionarios.prc_inserir_cargos_teste(10, 'Teste');
SELECT @codigo_cargo;

SELECT * FROM cargos;

DROP PROCEDURE IF EXISTS prc_inserir_cargos_teste;

DELIMITER $$
DROP PROCEDURE IF EXISTS `prc_inserir_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_cargos (IN nome_cargo VARCHAR(100) )
BEGIN
	DECLARE id INT;
	SELECT MAX(cd_cargo) INTO id FROM cargos;
	INSERT INTO cargos (cd_cargo,desc_cargo)
	VALUES(id+1 , nome_cargo);
END $$
DELIMITER ;


DELIMITER $$
#DROP PROCEDURE IF EXISTS prc_inserir_cargos_teste;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_cargos_teste (OUT codigo_cargo INT, IN nome_cargo VARCHAR(100))
BEGIN
	
    INSERT INTO cargos (cd_cargo, desc_cargo)
    VALUE (codigo_cargo, nome_cargo);

END $$
DELIMITER ;



-- TESTE OUT --
DELIMITER $$
#DROP PROCEDURE prc_saida_cargos_teste;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_saida_cargos_teste (OUT saida_funcionarios INT, IN matricula INT)
BEGIN
    
    IF EXISTS (SELECT mat_func FROM dependentes WHERE mat_func = matricula)
    THEN
    
		SELECT f.mat_func 'Matrícula', f.nm_func 'Funcionário', d.cd_dep 'Código',
		d.nome_dep 'Dependente'
		FROM funcionarios f,
	(SELECT cd_dep, COUNT(cd_dep) Quantidade FROM dependentes d);

        SELECT nm_func 'Funcionário', cd_dep 'Código', nm_dep 'Dependente' 
        FROM funcionarios AS f JOIN dependentes AS d ON f.mat_func = d.mat_func;

        SELECT COUNT(cd_dep) FROM dependentes
		WHERE mat_func = saida_funcionarios;
	
    ELSE
		SELECT 'Esse funcionário não possui dependentes' AS Mensagem;
	END IF;
END $$
DELIMITER ;

SELECT * FROM funcionarios;
SELECT * FROM dependentes;
CALL funcionarios.prc_saida_cargos_teste(@saida_dependentes, 1004);
SELECT @saida_dependentes;

DROP PROCEDURE prc_saida_cargos_teste;

SELECT COUNT(cd_dep) FROM dependentes WHERE mat_func = 1002;
