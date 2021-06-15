-- TESTE COM IF EXISTS --
DELIMITER $$
#DROP PROCEDURE IF EXISTS prc_inserir_dependentes;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_dependentes (IN nome_dependentes VARCHAR(100), IN data_nasc date, IN mat_func_dep INT)
BEGIN
	DECLARE id INT;
	IF EXISTS (SELECT cd_dep FROM dependentes WHERE nm_dep = nome_dependentes)
	THEN
		SELECT 'O dependente já existe!' AS Mensagem;
	ELSE
		SELECT MAX(cd_dep) INTO id FROM dependentes;
		INSERT INTO dependentes (cd_dep, nm_dep, dt_nac_dep, mat_func)
		VALUES(id+1 , nome_dependentes, data_nasc, mat_func_dep);
	END IF;
    SELECT * FROM dependentes;
END $$
DELIMITER ;

SELECT * FROM dependentes;
SELECT * FROM funcionarios;

-- INSERIR DEPARTAMENTO --
CALL funcionarios.prc_inserir_dependentes('Joana Dark', '2002-01-17', 1005);


DELIMITER $$
#DROP PROCEDURE prc_update_dependentes;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_update_dependentes (IN nome_dependentes VARCHAR(100), IN cod_dep INT, IN data_nasc date, IN mat_func_dep INT)
BEGIN
		UPDATE dependentes SET nm_dep = nome_dependentes, dt_nac_dep = data_nasc, mat_func = mat_func_dep 
        WHERE cd_dep = cod_dep;
		SELECT * from dependentes;
	#END IF;
END $$
DELIMITER ;

SELECT * FROM funcionarios;

-- UPDATE DE DEPARTAMENTO --
CALL funcionarios.prc_update_dependentes('Joana Dark' , 2006, '2002-01-17', 1004);
SELECT * FROM dependentes;

DELIMITER $$
#DROP PROCEDURE prc_delete_dependentes;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_delete_dependentes (IN cod_dependentes INT)
BEGIN
	DELETE FROM dependentes WHERE cd_dep = cod_dependentes;
	SELECT * from dependentes;
END $$
DELIMITER ;


-- DELETAR departamentos --
SELECT * from dependentes;
CALL funcionarios.prc_delete_dependentes(2006);

