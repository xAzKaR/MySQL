# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_departamento_apmedNI (IN id_depart INT, cat_depart VARCHAR(45), cap_depart INT, ramal_depart VARCHAR(20), hosp_id_hosp int)
BEGIN
	
		INSERT INTO departamento (id_dep, cat_dep, cap_dep, ramal_dep, hospital_id_hosp)
		VALUES (id_depart, cat_depart, cap_depart, ramal_depart, hosp_id_hosp);
        SELECT * FROM departamento;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_departamento_apmedNI;
CALL apmed2.prc_inserir_departamento_apmedNI(1 ,'RH', 12, '8880', 3);

INSERT INTO departamento (cat_dep, cap_dep, ramal_dep, hospital_id_hosp)
VALUES ('RH', 12, '8880', 3);



# Procedure para inserção de Departamento #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_departamento_apmed (IN cat_depart VARCHAR(45), cap_depart INT, ramal_depart VARCHAR(20), hosp_id_hosp int)
BEGIN

		INSERT INTO departamento (cat_dep, cap_dep, ramal_dep, hospital_id_hosp)
		VALUES (cat_depart, cap_depart, ramal_depart, hosp_id_hosp);
        SELECT * FROM departamento;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_departamento_apmed;
CALL apmed2.prc_inserir_departamento_apmed('RH', 12, '8880', 3);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/


# Procedure responsável pelo UPDATE de Departamento
DELIMITER $$
CREATE PROCEDURE 
prc_update_departamento_apmed (IN id_depart INT, cat_depart VARCHAR(45), cap_depart INT, ramal_depart VARCHAR(20), hosp_id_hosp int)
BEGIN

		UPDATE departamento SET cat_dep = cat_depart, cap_dep = cap_depart, ramal_dep = ramal_depart, hospital_id_hosp = hosp_id_hosp
		WHERE  id_dep = id_depart;
        SELECT * FROM departamento;
        
END $$
DELIMITER ;

-- UPDATE DE Departamento --
SELECT * from setor;
DROP PROCEDURE prc_update_departamento_apmed;
CALL apmed2.prc_update_departamento_apmed(10, 'Recursos Humanos', 12, '8880', 3);


# Procedure responsável pela deleção de Departamento
DELIMITER $$
CREATE PROCEDURE
prc_delete_departamento_apmed (IN id_depart INT)
BEGIN
	/*Atendimento */
    DELETE FROM departamento WHERE id_dep = id_depart;
	SELECT * from departamento;
END $$
DELIMITER ;

CALL apmed2.prc_delete_departamento_apmed(10);

