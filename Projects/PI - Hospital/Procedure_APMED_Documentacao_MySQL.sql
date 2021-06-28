# Insert de médico sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Documentacao_apmedNI (IN id_doc INT, tipo_doc VARCHAR(50), desc_doc VARCHAR(900), data_doc DATE, hora_doc TIME)
BEGIN
	
		INSERT INTO Documentacao (id_doc, tipo_doc, desc_doc, data_doc, hora_doc)
		VALUES (id_doc, tipo_doc, desc_doc, data_doc, hora_doc);
        SELECT * FROM Documentacao;

END $$
DELIMITER ;

# Script responsável por remover uma procedure
DROP PROCEDURE IF EXISTS prc_inserir_Documentacao_apmedNI;
# Script responsável por chamar a procedure
CALL apmed2.prc_inserir_Documentacao_apmedNI (4, 'Relatório', 'Relatório sobre consulta', NOW(), NOW());


/* BACKUP de inserção de médicos
INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, 
end_med, espec_med, tel_med, email_med, setor_id_setor, setor_hospital_id_hosp)
VALUES ('1234', '000.998.727-89', 'Leonardo De Amaral', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);
*/



# Procedure para inserção de Documentação APMED com autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Documentacao_apmed (IN tipo_doc VARCHAR(50), desc_doc VARCHAR(900), data_doc DATE, hora_doc TIME)
BEGIN

		INSERT INTO documentacao (tipo_doc, desc_doc, data_doc, hora_doc)
		VALUES (tipo_doc, desc_doc, data_doc, hora_doc);
        SELECT * FROM documentacao;

END $$
DELIMITER ;



# Script responsável por dropar a procedure
DROP PROCEDURE IF EXISTS prc_inserir_Documentacao_apmed;
# Script responsável por chamar a procedure de inserção
CALL apmed2.prc_inserir_Documentacao_apmed ('Relatório', 'Relatório sobre consulta', NOW(), NOW());



#Procedure responsável por fazer o update de médico
DELIMITER $$
CREATE PROCEDURE 
prc_update_Documentacao_apmed (IN id_docum INT, tipo_doc VARCHAR(50), desc_doc VARCHAR(900), data_doc DATE, hora_doc TIME)
BEGIN

		UPDATE documentacao  SET tipo_doc = tipo_doc, desc_doc = desc_doc, data_doc = data_doc, hora_doc = hora_doc
		WHERE id_doc = id_docum;
        SELECT * FROM documentacao;
        
END $$
DELIMITER ;


SELECT * from documentacao;
DROP PROCEDURE prc_update_Documentacao_apmed;
CALL apmed2.prc_update_Documentacao_apmed (4, 'Prontuário', 'Prontuário de Consulta', NOW(), NOW());



#Procedure responsável pela deleção de Médicos
DELIMITER $$
CREATE PROCEDURE
prc_delete_Documentacao_apmed (IN id_docum INT)
BEGIN
	/*Atendimento */
    DELETE FROM documentacao WHERE id_doc = id_docum;
	SELECT * from documentacao;
END $$
DELIMITER ;

# Script responsável por dropar a procedure
DROP PROCEDURE prc_delete_Documentacao_apmed;
# Script responsável por chamar a procedure para deleção de médico
CALL apmed2.prc_delete_Documentacao_apmed(4);

