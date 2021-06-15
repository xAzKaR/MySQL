DELIMITER $$
CREATE PROCEDURE
prc_inserir_cargos (IN nome_cargo VARCHAR(100) )
BEGIN
	DECLARE id INT;
	SELECT MAX(cd_cargo) INTO id FROM cargos;
	INSERT INTO cargos (cd_cargo,desc_cargo)
	VALUES(id+1 , nome_cargo);
END $$
DELIMITER ;

CALL funcionarios.prc_inserir_cargos('Analista');
SELECT * FROM cargos;


-- TESTE COM IF EXISTS --
DELIMITER $$
CREATE PROCEDURE
prc_inserir_cargos (IN nome_cargo VARCHAR(100) )
BEGIN
		DECLARE id INT;
	IF EXISTS (SELECT desc_cargo FROM cargos WHERE desc_cargo = nome_cargo)
	THEN
		SELECT 'O cargo já existe!' AS Mensagem;
	ELSE
		SELECT MAX(cd_cargo) INTO id FROM cargos;
		INSERT INTO cargos (cd_cargo,desc_cargo)
		VALUES(id+1 , nome_cargo);
	END IF;
END $$
DELIMITER ;



DELIMITER $$
DROP PROCEDURE IF EXISTS `prc_update_cargos`;
CREATE PROCEDURE
prc_update_cargos (IN nome_cargo VARCHAR(100), IN cod_cargo INT)
BEGIN
	IF EXISTS (SELECT desc_cargo FROM cargos WHERE desc_cargo = nome_cargo)
	THEN
		SELECT 'Esse cargo já existe!' AS Mensagem;
	ELSE
		UPDATE cargos SET desc_cargo = nome_cargo WHERE cd_cargo = cod_cargo;
		SELECT desc_cargo from cargos;
	END IF;
END $$
DELIMITER ;

CALL funcionarios.prc_update_cargos('Juvenal' , '7');


DELIMITER $$
DROP PROCEDURE IF EXISTS `prc_delete_cargos`;
CREATE PROCEDURE
prc_delete_cargos (IN cod_cargo INT)
BEGIN
	DELETE FROM funcionarios WHERE cd_cargo = cod_cargo;
	DELETE FROM cargos WHERE cd_cargo = cod_cargo;
	SELECT * from cargos;
END $$
DELIMITER ;


CALL funcionarios.prc_delete_cargos(6);

SELECT * FROM cargos;
UPDATE cargos SET NOME_CURSO = 'ENGENHARIA DE PRODUÇÃO' , VLCURSO = 1800.00 WHERE CDCURSO = 107; 

