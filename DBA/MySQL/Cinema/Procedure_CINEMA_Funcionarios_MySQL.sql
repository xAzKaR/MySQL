DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_inserir_Cinemas_funcionarios`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_Cinemas_funcionarios (IN matri_funci INT, nm_func VARCHAR(255),
end_func VARCHAR(50), tel_func VARCHAR(12), cinema_cod_cine INT)
BEGIN -- COMEÇO --
	
    
	INSERT INTO funcionarios (matri_func, nm_func, end_func, tel_func, 
    cinema_cod_cine)
	VALUES(matri_funci, nm_func, end_func, tel_func, cinema_cod_cine);
    SELECT * FROM funcionarios;
    
END $$ -- FINAL DA PROCEDURE --
DELIMITER ;

SELECT * FROM funcionarios;
DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_funcionarios;
CALL cinema.prc_inserir_Cinemas_funcionarios(2,'Adelaide Mamouros Jardim',
'Lorem ipsum tempor', '(61)912-4170', 1);

#INSERT INTO cargos (cd_cargo, desc_cargo)
#VALUES(1, 'Informática');

-- TESTE COM IF EXISTS --
DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_inserir_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_Cinemas_funcionariosCI (IN nm_func VARCHAR(255),
end_func VARCHAR(50), tel_func VARCHAR(12), cinema_cod_cine INT)
BEGIN -- COMEÇO --
	DECLARE id_mat INT;

        SELECT MAX(matri_func) INTO id_mat FROM funcionarios;
		INSERT INTO funcionarios (matri_func, nm_func, end_func, tel_func, 
		cinema_cod_cine)
		VALUES(id_mat+1, nm_func, end_func, tel_func, cinema_cod_cine);
		SELECT * FROM funcionarios;

    SELECT * FROM cargos;
END $$ -- FINAL DA PROCEDURE --
DELIMITER ;

-- INSERIR CARGO --
DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_funcionariosCI;
CALL cinema.prc_inserir_Cinemas_funcionariosCI('Dina Cantanhede Bicalho',
'Lorem ipsum quisque', '(61)326-1971', 1);



DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_update_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_update_Cinema_Funcionarios (IN matri_funci INT, nm_func VARCHAR(255),
end_func VARCHAR(50), tel_func VARCHAR(12), cinema_cod_cine INT)
BEGIN -- COMEÇO --

		UPDATE funcionarios SET nm_func = nm_func, end_func = end_func,
        tel_func = tel_func, cinema_cod_cine = cinema_cod_cine
        WHERE matri_func = matri_funci;
		SELECT * from funcionarios;

END $$ -- FINAL DA PROCEDURE --
DELIMITER ;

-- UPDATE DE CARGOS --
SELECT * from funcionarios;
DROP PROCEDURE IF EXISTS prc_update_Cinema_Funcionarios;
CALL cinema.prc_update_Cinema_Funcionarios(3,'Xavier Silveira Salgado',
'Lorem ipsum risus', '(61)628-3124', 1);


DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_delete_cargos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_delete_Cinema_Funcionarios (IN matri_funci INT)
BEGIN

	DELETE FROM funcionarios
    WHERE matri_func = matri_funci;
	SELECT * from funcionarios;
    
END $$
DELIMITER ;

-- Executar a Procedure --
	SELECT * FROM DEPENDENTES;
	SELECT * FROM funcionarios;
	SELECT * from cargos;
CALL cinema.prc_delete_Cinema_Funcionarios(2);

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
