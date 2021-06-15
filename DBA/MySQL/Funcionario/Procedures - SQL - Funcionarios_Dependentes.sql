-- TESTE COM IF EXISTS --
DELIMITER $$
DROP PROCEDURE IF EXISTS `prc_inserir_departamentos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_departamentos (IN nome_departamento VARCHAR(100) )
BEGIN
	DECLARE id INT;
	IF EXISTS (SELECT desc_depto FROM departamentos WHERE desc_depto = nome_departamento)
	THEN
		SELECT 'O departamento já existe!' AS Mensagem;
	ELSE
		SELECT MAX(cd_depto) INTO id FROM departamentos;
		INSERT INTO departamentos (cd_depto, desc_depto)
		VALUES(id+1 , nome_departamento);
	END IF;
    SELECT * FROM departamentos;
END $$
DELIMITER ;

SELECT * FROM departamentos;

-- INSERIR DEPARTAMENTO --
CALL funcionarios.prc_inserir_departamentos('Recursos Humanos');



DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_update_departamentos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_update_departamentos (IN nome_departamentos VARCHAR(100), IN cod_depto INT)
BEGIN
	IF EXISTS (SELECT desc_depto FROM departamentos WHERE desc_depto = nome_departamentos)
	THEN
		SELECT 'Esse cargo já existe!' AS Mensagem;
		ELSE
		UPDATE departamentos SET desc_depto = nome_departamentos WHERE cd_depto = cod_depto;
		SELECT desc_depto from departamentos;
	END IF;
END $$
DELIMITER ;


-- UPDATE DE DEPARTAMENTO --
CALL funcionarios.prc_update_departamentos('Recursos Humanos' , '106');
SELECT * FROM departamentos;

DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_delete_departamentos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_delete_departamentos (IN cod_departamentos INT)
BEGIN
	DELETE FROM funcionarios WHERE cd_depto = cod_departamentos;
	DELETE FROM departamentos WHERE cd_depto = cod_departamentos;
	SELECT * from departamentos;
END $$
DELIMITER ;


-- DELETAR departamentos --
SELECT * from departamentos;
CALL funcionarios.prc_delete_departamentos(106);

