# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_paciente_apmedNI (IN id_paci INT, cpf_paci VARCHAR(20), nome_paci VARCHAR(150), nasc_paci DATE, nac_paci VARCHAR(45),
sexo_paci ENUM('M', 'F', 'O'), ocup_paci VARCHAR(45), end_paci VARCHAR(150), tel_paci VARCHAR(20), email_paci VARCHAR(100),
set_id_setor INT, setor_hosp_id_hosp INT, conv_id_conv INT)
BEGIN
		IF EXISTS (SELECT cpf_pac FROM paciente WHERE cpf_pac = cpf_paci)
        THEN
			SELECT 'Paciente já cadastrado, verifique o CPF!' AS Mensagem;
		ELSE	
			INSERT INTO paciente (id_pac, cpf_pac, nome_pac, nasc_pac, nac_pac, sexo_pac, ocup_pac, end_pac, tel_pac, email_pac,
			setor_id_setor, setor_hospital_id_hosp, convenio_id_conv)
			VALUES (id_paci, cpf_paci, nome_paci, nasc_paci, nac_paci, sexo_paci, ocup_paci, end_paci, tel_paci, email_paci,
			set_id_setor, setor_hosp_id_hosp, conv_id_conv);
		END IF;
			SELECT * FROM paciente;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_paciente_apmedNI;
CALL apmed2.prc_inserir_paciente_apmedNI(1, '260.665.310-69', 'Adélia Cartaxo Quinterno', '19931210', 'Brasileiro', 'F', 'Auxiliar Administrativo', 'Quadra 17 - Asa Sul',
'(61) 9 9936-7731', 'adelia@hotmail.com', 1, 1, 1);



# Procedure para inserção de Pacientes #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_paciente_apmed (IN cpf_paci VARCHAR(20), nome_paci VARCHAR(150), nasc_paci DATE, nac_paci VARCHAR(45),
sexo_paci ENUM('M', 'F', 'O'), ocup_paci VARCHAR(45), end_paci VARCHAR(150), tel_paci VARCHAR(20), email_paci VARCHAR(100),
set_id_setor INT, setor_hosp_id_hosp INT, conv_id_conv INT)
BEGIN

		IF EXISTS (SELECT cpf_pac FROM paciente WHERE cpf_pac = cpf_paci)
        THEN
			SELECT 'Paciente já cadastrado, verifique o CPF!' AS Mensagem;
		ELSE	
			INSERT INTO paciente (cpf_pac, nome_pac, nasc_pac, nac_pac, sexo_pac, ocup_pac, end_pac, tel_pac, email_pac,
			setor_id_setor, setor_hospital_id_hosp, convenio_id_conv)
			VALUES (cpf_paci, nome_paci, nasc_paci, nac_paci, sexo_paci, ocup_paci, end_paci, tel_paci, email_paci,
			set_id_setor, setor_hosp_id_hosp, conv_id_conv);
		END IF;
			SELECT * FROM paciente;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_paciente_apmed;
CALL apmed2.prc_inserir_paciente_apmed('260.665.310-69', 'Adélia Cartaxo Quinterno', '19931210', 'Brasileira', 'F', 'Auxiliar Administrativo', 'Quadra 17 - Asa Sul',
'(61) 9 9936-7731', 'adelia@hotmail.com', 1, 1, 1);


/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/


#Procedure responsável pelo UPDATE de pacientes
DELIMITER $$
CREATE PROCEDURE 
prc_update_paciente_apmed (id_paci INT, cpf_paci VARCHAR(20), nome_paci VARCHAR(150), nasc_paci DATE, nac_paci VARCHAR(45),
sexo_paci ENUM('M', 'F', 'O'), ocup_paci VARCHAR(45), end_paci VARCHAR(150), tel_paci VARCHAR(20), email_paci VARCHAR(100),
set_id_setor INT, setor_hosp_id_hosp INT, conv_id_conv INT)
BEGIN

		UPDATE paciente SET cpf_pac = cpf_paci,  nome_pac = nome_paci, nasc_pac = nasc_paci, nac_pac = nac_paci, sexo_pac = sexo_paci,
		ocup_pac = ocup_paci, end_pac = end_paci, tel_pac = tel_paci, email_pac = email_paci, setor_id_setor = set_id_setor,
		setor_hospital_id_hosp = setor_hosp_id_hosp, convenio_id_conv = conv_id_conv
		WHERE  id_pac = id_paci;
        SELECT * FROM paciente;
        
END $$
DELIMITER ;

-- UPDATE DE PACIENTE --
SELECT * from paciente;
DROP PROCEDURE prc_update_paciente_apmed;
CALL apmed2.prc_update_paciente_apmed(1, '260.665.310-69', 'Josélia Cartaxo Quinterno', '19931210', 'Brasileiro', 'F', 'Auxiliar Administrativo', 'Quadra 17 - Asa Sul',
'(61) 9 9936-7731', 'adeliana@hotmail.com', 1, 1, 1);


-- DELETE DE PACIENTE --
DELIMITER $$
CREATE PROCEDURE
prc_delete_paciente_apmed (IN id_paci INT)
BEGIN

    DELETE FROM paciente WHERE id_pac = id_paci;
	SELECT * from paciente;

END $$
DELIMITER ;

DROP PROCEDURE prc_delete_paciente_apmed;
CALL apmed2.prc_delete_paciente_apmed(1);

