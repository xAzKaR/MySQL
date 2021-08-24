# Insert de médico sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Consulta_apmedNI (IN id_conss INT, paciente_id_pac INT, medico_id_med INT, documentacao_id_doc INT, paciente_setor_id_setor INT, paciente_setor_hospital_id_hosp INT)
BEGIN
	
		INSERT INTO consulta (id_cons, paciente_id_pac, medico_id_med, documentacao_id_doc, paciente_setor_id_setor, paciente_setor_hospital_id_hosp)
        VALUES (id_conss, paciente_id_pac, medico_id_med, documentacao_id_doc, paciente_setor_id_setor, paciente_setor_hospital_id_hosp);

END $$
DELIMITER ;

# Script responsável por remover uma procedure
DROP PROCEDURE IF EXISTS prc_inserir_Consulta_apmedNI;
# Script responsável por chamar a procedure
# ID Consulta, Paciente, Medico, Documentacao, Paciente Setor ID Setor, Paciente Hospital ID Hosp
CALL apmed2.prc_inserir_Consulta_apmedNI (2, 1, 5, 1, 1 , 1);
SELECT * FROM paciente;
SELECT * FROM consulta;
SELECT * FROM setor;
SELECT * FROM hospital;

SELECT * FROM `apmed2`.`consulta`;
SELECT * FROM `apmed_bk`.`consulta_bk`;

DELETE FROM `apmed_bk`.`consulta_bk` WHERE id_cons = 2;

/* BACKUP de inserção de médicos
INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, 
end_med, espec_med, tel_med, email_med, setor_id_setor, setor_hospital_id_hosp)
VALUES ('1234', '000.998.727-89', 'Leonardo De Amaral', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);
*/



# Procedure para inserção de Médico APMED com autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Consulta_apmed (IN paciente_id_pac INT, medico_id_med INT, documentacao_id_doc INT, paciente_setor_id_setor INT, paciente_setor_hospital_id_hosp INT)
BEGIN

		INSERT INTO consulta (paciente_id_pac, medico_id_med, documentacao_id_doc, paciente_setor_id_setor, paciente_setor_hospital_id_hosp)
		VALUES (paciente_id_pac, medico_id_med, documentacao_id_doc, paciente_setor_id_setor, paciente_setor_hospital_id_hosp);
        SELECT * FROM consulta;

END $$
DELIMITER ;



# Script responsável por dropar a procedure
DROP PROCEDURE IF EXISTS prc_inserir_Consulta_apmed;
# Script responsável por chamar a procedure de inserção
CALL apmed2.prc_inserir_Consulta_apmed (2, 7, 1, 1 , 1);



#Procedure responsável por fazer o update de médico
DELIMITER $$
CREATE PROCEDURE 
prc_update_Consulta_apmed (IN id_conss INT, paciente_id_pac INT, medico_id_med INT, documentacao_id_doc INT, paciente_setor_id_setor INT, paciente_setor_hospital_id_hosp INT)
BEGIN

		UPDATE Consulta SET paciente_id_pac = paciente_id_pac, medico_id_med = medico_id_med, documentacao_id_doc = documentacao_id_doc, paciente_setor_id_setor = paciente_setor_id_setor,
        paciente_setor_hospital_id_hosp = paciente_setor_hospital_id_hosp
		WHERE  id_cons = id_conss;
        SELECT * FROM Consulta;
        
END $$
DELIMITER ;


SELECT * from Consulta;
DROP PROCEDURE prc_update_Consulta_apmed;
CALL apmed2.prc_update_Consulta_apmed (2, 1, 5, 1, 1 , 1);



#Procedure responsável pela deleção de Médicos
DELIMITER $$
CREATE PROCEDURE
prc_delete_Consulta_apmed (IN id_conss INT)
BEGIN
	/*Atendimento */
    DELETE FROM Consulta WHERE id_cons = id_conss;
	SELECT * from Consulta;
END $$
DELIMITER ;

# Script responsável por dropar a procedure
DROP PROCEDURE prc_delete_Consulta_apmed;
# Script responsável por chamar a procedure para deleção de médico
CALL apmed2.prc_delete_Consulta_apmed(11);

