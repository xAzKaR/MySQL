# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_setor_apmedNI (IN id_do_setor INT, especialidade_setor VARCHAR (45), categ_setor VARCHAR(45), capac_setor INT, hosp_id_hosp INT)
BEGIN
	
		INSERT INTO setor (id_setor, espec_setor, cat_setor, cap_setor, hospital_id_hosp)
		VALUES (id_do_setor, especialidade_setor, categ_setor, capac_setor, hosp_id_hosp);
        SELECT * FROM setor;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_setor_apmedNI;
CALL apmed2.prc_inserir_setor_apmedNI(11, 'Ortopedia', 'Gesso', 20, 1);



# Procedure para inserção de Setor #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_setor_apmed (IN especialidade_setor VARCHAR (45), categ_setor VARCHAR(45), capac_setor INT, hosp_id_hosp INT )
BEGIN

		INSERT INTO setor (espec_setor, cat_setor, cap_setor, hospital_id_hosp)
		VALUES (especialidade_setor, categ_setor, capac_setor, hosp_id_hosp);
        SELECT * FROM setor;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_setor_apmed;
CALL apmed2.prc_inserir_setor_apmed('Ortopedia', 'Gesso', 20, 1);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



#Procedure responsável pelo UPDATE de Setor
DELIMITER $$
CREATE PROCEDURE 
prc_update_setor_apmed (IN id_do_setor INT, especialidade_setor VARCHAR (45), categ_setor VARCHAR(45), capac_setor INT, hosp_id_hosp INT)
BEGIN

		UPDATE setor SET espec_setor = especialidade_setor, cat_setor = categ_setor, cap_setor = capac_setor, hospital_id_hosp = hosp_id_hosp
		WHERE  id_setor = id_do_setor;
        SELECT * FROM setor;
        
END $$
DELIMITER ;

-- UPDATE DE SETOR --
SELECT * from setor;
DROP PROCEDURE prc_update_setor_apmed;
CALL apmed2.prc_update_setor_apmed(11, 'Ortopedia', 'Ortopedia', 20, 1);



#Procedure responsável pela deleção de SETOR
DELIMITER $$
CREATE PROCEDURE
prc_delete_setor_apmed (IN id_do_setor INT)
BEGIN
	/*Atendimento */
    DELETE FROM setor WHERE id_setor = id_do_setor;
	SELECT * from setor;
END $$
DELIMITER ;

CALL apmed2.prc_delete_setor_apmed(11);

