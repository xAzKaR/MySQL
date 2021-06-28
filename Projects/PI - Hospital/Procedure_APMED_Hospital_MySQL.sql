# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_hospital_apmedNI (IN id_hospt INT, cnpj VARCHAR(25), raz VARCHAR(150), cep VARCHAR(15), endereco VARCHAR(150), 
telefone VARCHAR(150), email VARCHAR(100) )
BEGIN
	
		INSERT INTO hospital (id_hosp, cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
		VALUES(id_hospt, cnpj, raz, cep, endereco, telefone, email);
END $$
DELIMITER ;

CALL apmed2.prc_inserir_hospital_apmedNI(1,'02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');




# Procedure para inserção de Hospital #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_hospital_apmed (IN cnpj VARCHAR(25), raz VARCHAR(150), cep VARCHAR(15), endereco VARCHAR(150), 
telefone VARCHAR(150), email VARCHAR(100) )
BEGIN

	IF EXISTS (SELECT cnpj_hosp FROM hospital WHERE cnpj_hosp = cnpj) 	#OR 
#			  (SELECT raz_hosp FROM hospital WHERE raz_hosp = raz) 		OR
#			  (SELECT email_hosp FROM hospital WHERE email_hosp = email)
	THEN	
		SELECT 'CNPJ, Razão ou email já cadastrados! !' AS Mensagem;
	ELSE
		INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
		VALUES(cnpj, raz, cep, endereco, telefone, email);
	END IF;
    
END $$
DELIMITER ;

SELECT * FROM hospital;
DROP procedure prc_inserir_hospital_apmed;
CALL apmed2.prc_inserir_hospital_apmed('02.560.878/0001-15', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');


/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/
 SHOW TRIGGERS;

# Procedure responsável pelo UPDATE de hospital
DELIMITER $$
CREATE PROCEDURE 
prc_update_hospital_apmed (IN id_hosptal INT, cnpj VARCHAR(25), raz VARCHAR(150), cep VARCHAR(15), endereco VARCHAR(150), 
telefone VARCHAR(150), email VARCHAR(100))
BEGIN

	IF EXISTS (SELECT id_hosp FROM hospital WHERE id_hosp = id_hosptal)
	THEN
		UPDATE hospital SET cnpj_hosp = cnpj, raz_hosp = raz, cep_hosp = cep, end_hosp = endereco,
		tel_hosp = telefone, email_hosp = email
		WHERE id_hosp = id_hosptal;
	ELSE
		SELECT 'Hospital não cadastrado!' AS Mensagem;
	END IF;
		SELECT * from hospital;
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from hospital;
#DROP PROCEDURE prc_update_hospital_apmed; #Não pode alterar o código do hospital sem fazer o delete antes!
CALL apmed2.prc_update_hospital_apmed(2,'02.560.878/0001-15', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');

SELECT * from hospital_bk;


#Procedure responsável pela deleção de HOSPITAL
DELIMITER $$
CREATE PROCEDURE
prc_delete_hospital_apmed (IN id_hospt INT)
BEGIN
	/*Atendimento */
    DELETE FROM hospital WHERE id_hosp = id_hospt;
	SELECT * from hospital;
END $$
DELIMITER ;

CALL apmed2.prc_delete_hospital_apmed(3);

