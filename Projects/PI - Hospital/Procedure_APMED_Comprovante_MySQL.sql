# Insert de Comprovante sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Comprovante_apmedNI (id_compp INT, desc_comp VARCHAR(100), data_comp DATE, hora_comp TIME, funcionario_id_func INT, pagamento_id_pgto INT, consulta_id_cons INT,
paciente_convenio_id_conv INT, consulta_paciente_id_pac INT, consulta_medico_id_med INT, consulta_paciente_setor_id_setor INT, consulta_paciente_setor_hospital_id_hosp INT)
BEGIN
	
		INSERT INTO comprovante (id_comp, desc_comp, data_comp, hora_comp, funcionario_id_func, pagamento_id_pgto, 
        consulta_id_cons, paciente_convenio_id_conv, consulta_paciente_id_pac, consulta_medico_id_med, consulta_paciente_setor_id_setor, consulta_paciente_setor_hospital_id_hosp)
		VALUES (id_compp, desc_comp, data_comp, hora_comp, funcionario_id_func, pagamento_id_pgto, 
        consulta_id_cons, paciente_convenio_id_conv, consulta_paciente_id_pac, consulta_medico_id_med, consulta_paciente_setor_id_setor, consulta_paciente_setor_hospital_id_hosp);
        SELECT * FROM comprovante;

END $$
DELIMITER ;

# Script responsável por remover uma procedure
DROP PROCEDURE IF EXISTS prc_inserir_Comprovante_apmedNI;
# Script responsável por chamar a procedure
# ID COMPROVANTE / DESCRIÇÃO / Data compra / Hora Compra / Funcionário / 
CALL apmed2.prc_inserir_Comprovante_apmedNI (1, 'Compra de algo', NOW(), NOW(), 1, 1, 1, 1, 1, 2, 1, 1);

        SELECT * FROM comprovante;
		SELECT * FROM pagamento;
        SELECT * FROM convenio;
        SELECT * FROM funcionario;
        SELECT * FROM consulta;
        SELECT * FROM medico;

/* BACKUP de inserção de médicos
INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, 
end_med, espec_med, tel_med, email_med, setor_id_setor, setor_hospital_id_hosp)
VALUES ('1234', '000.998.727-89', 'Leonardo De Amaral', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);
*/



# Procedure para inserção de Comprovante APMED com autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Comprovante_apmed (IN desc_comp VARCHAR(100), data_comp DATE, hora_comp TIME, funcionario_id_func INT, pagamento_id_pgto INT, consulta_id_cons INT,
paciente_convenio_id_conv INT, consulta_paciente_id_pac INT, consulta_medico_id_med INT, consulta_paciente_setor_id_setor INT, consulta_paciente_setor_hospital_id_hosp INT)
BEGIN

		INSERT INTO comprovante (desc_comp, data_comp, hora_comp, funcionario_id_func, pagamento_id_pgto, 
        consulta_id_cons, paciente_convenio_id_conv, consulta_paciente_id_pac, consulta_medico_id_med, consulta_paciente_setor_id_setor, consulta_paciente_setor_hospital_id_hosp)
		VALUES (desc_comp, data_comp, hora_comp, funcionario_id_func, pagamento_id_pgto, 
        consulta_id_cons, paciente_convenio_id_conv, consulta_paciente_id_pac, consulta_medico_id_med, consulta_paciente_setor_id_setor, consulta_paciente_setor_hospital_id_hosp);
        SELECT * FROM comprovante;


END $$
DELIMITER ;



# Script responsável por dropar a procedure
DROP PROCEDURE IF EXISTS prc_inserir_Comprovante_apmed;
# Script responsável por chamar a procedure de inserção
CALL apmed2.prc_inserir_Comprovante_apmed ('Compra de algo', NOW(), NOW(), 1, 1, 1, 1, 1, 2, 1, 1);



#Procedure responsável por fazer o update de Comprovante
DELIMITER $$
CREATE PROCEDURE 
prc_update_Comprovante_apmed (IN id_compp INT, desc_comp VARCHAR(100), data_comp DATE, hora_comp TIME, funcionario_id_func INT, pagamento_id_pgto INT, consulta_id_cons INT,
paciente_convenio_id_conv INT, consulta_paciente_id_pac INT, consulta_medico_id_med INT, consulta_paciente_setor_id_setor INT, consulta_paciente_setor_hospital_id_hosp INT)
BEGIN

		UPDATE comprovante SET desc_comp = desc_comp, data_comp = data_comp, hora_comp = hora_comp, funcionario_id_func = funcionario_id_func, pagamento_id_pgto = pagamento_id_pgto, 
        consulta_id_cons = consulta_id_cons, paciente_convenio_id_conv = paciente_convenio_id_conv, consulta_paciente_id_pac = consulta_paciente_id_pac,
        consulta_medico_id_med = consulta_medico_id_med, consulta_paciente_setor_id_setor = consulta_paciente_setor_id_setor, 
        consulta_paciente_setor_hospital_id_hosp = consulta_paciente_setor_hospital_id_hosp
		WHERE id_comp = id_compp;
        SELECT * FROM comprovante;
        
END $$
DELIMITER ;


SELECT * from comprovante;
DROP PROCEDURE prc_update_Comprovante_apmed;
CALL apmed2.prc_update_Comprovante_apmed (4, 'Compra de alguma outra coisa aí', NOW(), NOW(), 1, 1, 1, 1, 1, 2, 1, 1);



#Procedure responsável pela deleção de Comprovante
DELIMITER $$
CREATE PROCEDURE
prc_delete_Comprovante_apmed (IN id_compp INT)
BEGIN
	/*Atendimento */
    DELETE FROM comprovante WHERE id_comp = id_compp;
	SELECT * from comprovante;
END $$
DELIMITER ;

# Script responsável por dropar a procedure
DROP PROCEDURE prc_delete_Comprovante_apmed;
# Script responsável por chamar a procedure para deleção de médico
CALL apmed2.prc_delete_Comprovante_apmed(4);

