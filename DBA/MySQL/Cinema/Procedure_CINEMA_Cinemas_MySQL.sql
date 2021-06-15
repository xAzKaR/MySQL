# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_cinemas_cinemaNI (IN codd_cine INT, cnpj_cine VARCHAR(32),
local_cine VARCHAR(150), capac_cine INT)
BEGIN
	
		INSERT INTO cinemas (cod_cine, cnpj_cine, local_cine, capac_cine)
		VALUES (codd_cine, cnpj_cine, local_cine, capac_cine);
        SELECT * FROM cinemas;

END $$
DELIMITER ;

#DROP PROCEDURE IF EXISTS prc_inserir_cinemas_cinemaNI;
CALL cinema.prc_inserir_cinemas_cinemaNI(1, '25.763.621/0001-58',
'Area Especial 01 QNM 34 - Taguatinga, Brasília - DF, 72145-450', 255);

/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_cinema_cinemasAI (IN cnpj_cine VARCHAR(32),
local_cine VARCHAR(150), capac_cine INT)
BEGIN
	DECLARE id_cinema INT;

		SELECT MAX(cod_cine) INTO id_cinema FROM cinemas;
		INSERT INTO cinemas (cod_cine, cnpj_cine, local_cine, capac_cine)
		VALUES (id_cinema+1, cnpj_cine, local_cine, capac_cine);
        SELECT * FROM cinemas;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_cinema_cinemasAI;
CALL cinema.prc_inserir_cinema_cinemasAI('14.354.498/0001-03',
'Area Especial 01 QNM 34 - Taguatinga, Brasília - DF, 72145-450', 255);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_cinemas (IN cod_ciner INT, cnpj_cine VARCHAR(32),
local_cine VARCHAR(150), capac_cine INT)
BEGIN

		UPDATE cinemas SET cnpj_cine = cnpj_cine, local_cine = local_cine,
        capac_cine = capac_cine
		WHERE  cod_cine = cod_ciner;
        SELECT * FROM cinemas;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from cinemas;
DROP PROCEDURE prc_update_Cinema_cinemas;
CALL cinema.prc_update_Cinema_cinemas (1102 ,'14.354.498/0001-03',
'Teste 04 QNM 34 - Taguatinga, Brasília - DF, 72145-450', 255);


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Cinemas (IN cod_ciner INT)
BEGIN
	/*Atendimento */
    DELETE FROM cinemas WHERE cod_cine = cod_ciner;
	SELECT * from cinemas;
END $$
DELIMITER ;

CALL cinema.prc_delete_Cinema_Cinemas(102);

