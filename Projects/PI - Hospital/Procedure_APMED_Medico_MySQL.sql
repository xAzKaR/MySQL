# Insert de médico sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_medico_apmedNI (IN id_medi INT, crm_medi VARCHAR(15), cpf_medi VARCHAR(20), nome_medi VARCHAR(150), nasc_medi DATE, 
nac_medi VARCHAR(45), sexo_medi ENUM('M','F','O'), end_medi VARCHAR(150), espec_medi VARCHAR(45), tel_medi VARCHAR(20),
email_medi VARCHAR(100), setor_id_setor INT, setor_hospital_id_hosp INT)
BEGIN
	
		INSERT INTO medico (id_med, crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, end_med, espec_med, tel_med,
        email_med, setor_id_setor, setor_hospital_id_hosp)
		VALUES (id_medi, crm_medi, cpf_medi, nome_medi, nasc_medi, nac_medi, sexo_medi, end_medi, espec_medi, tel_medi,
		email_medi, setor_id_setor, setor_hospital_id_hosp);
        SELECT * FROM medico;

END $$
DELIMITER ;

# Script responsável por remover uma procedure
DROP PROCEDURE IF EXISTS prc_inserir_medico_apmedNI;
# Script responsável por chamar a procedure
CALL apmed2.prc_inserir_medico_apmedNI(1 ,'1234', '000.998.727-89', 'Leonardo De Amaral', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);




/* BACKUP de inserção de médicos
INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, 
end_med, espec_med, tel_med, email_med, setor_id_setor, setor_hospital_id_hosp)
VALUES ('1234', '000.998.727-89', 'Leonardo De Amaral', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);
*/



# Procedure para inserção de Médico APMED com autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_medico_apmed (IN crm_medi VARCHAR(15), cpf_medi VARCHAR(20), nome_medi VARCHAR(150), nasc_medi DATE, 
nac_medi VARCHAR(45), sexo_medi ENUM('M','F','O'), end_medi VARCHAR(150), espec_medi VARCHAR(45), tel_medi VARCHAR(20),
email_medi VARCHAR(100), setor_id_setor INT, setor_hospital_id_hosp INT)
BEGIN

		INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, end_med, espec_med, tel_med,
        email_med, setor_id_setor, setor_hospital_id_hosp)
		VALUES (crm_medi, cpf_medi, nome_medi, nasc_medi, nac_medi, sexo_medi, end_medi, espec_medi, tel_medi,
		email_medi, setor_id_setor, setor_hospital_id_hosp);
        SELECT * FROM medico;

END $$
DELIMITER ;



# Script responsável por dropar a procedure
DROP PROCEDURE IF EXISTS prc_inserir_medico_apmed;
# Script responsável por chamar a procedure de inserção
CALL apmed2.prc_inserir_medico_apmed('1234', '000.998.727-89', 'Leonardo De Amaral', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);



#Procedure responsável por fazer o update de médico
DELIMITER $$
CREATE PROCEDURE 
prc_update_medico_apmed (IN id_medi INT, crm_medi VARCHAR(15), cpf_medi VARCHAR(20), nome_medi VARCHAR(150), nasc_medi DATE, 
nac_medi VARCHAR(45), sexo_medi ENUM('M','F','O'), end_medi VARCHAR(150), espec_medi VARCHAR(45), tel_medi VARCHAR(20),
email_medi VARCHAR(100), setor_id_setor INT, setor_hospital_id_hosp INT)
BEGIN

		UPDATE medico SET crm_med = crm_medi, cpf_med = cpf_medi, nome_med = nome_medi, nasc_med = nasc_medi, nac_med = nac_medi,
        sexo_med = sexo_medi, end_med = end_medi, espec_med = espec_medi, tel_med = tel_medi, email_med = email_medi,
        setor_id_setor = setor_id_setor, setor_hospital_id_hosp = setor_hospital_id_hosp
		WHERE  id_med = id_medi;
        SELECT * FROM medico;
        
END $$
DELIMITER ;


SELECT * from medico;
DROP PROCEDURE prc_update_medico_apmed;
CALL apmed2.prc_update_medico_apmed(6 ,'1234', '000.998.727-89', 'Alacharabasuia', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);



#Procedure responsável pela deleção de Médicos
DELIMITER $$
CREATE PROCEDURE
prc_delete_medico_apmed (IN id_medi INT)
BEGIN
	/*Atendimento */
    DELETE FROM medico WHERE id_med = id_medi;
	SELECT * from medico;
END $$
DELIMITER ;

# Script responsável por dropar a procedure
DROP PROCEDURE prc_delete_medico_apmed;
# Script responsável por chamar a procedure para deleção de médico
CALL apmed2.prc_delete_medico_apmed(5);

