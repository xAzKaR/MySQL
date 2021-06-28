# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_funcionario_apmedNI (IN id_funci INT, corem_funci VARCHAR(20), cpf_funci VARCHAR(20), nome_funci VARCHAR(150),
nasc_funci DATE, nac_funci VARCHAR(45), sexo_funci ENUM('M', 'F', 'O'), cargo_funci VARCHAR(45), end_funci VARCHAR(150),
tel_funci VARCHAR(20), email_funci VARCHAR(100), depart_id_dep INT,
depart_hosp_id_hosp INT, set_id_setor INT, setor_hosp_id_hosp INT)
BEGIN
		IF EXISTS (SELECT cpf_func FROM funcionario WHERE cpf_func = cpf_funci)
		THEN
			SELECT 'Funcionário já existe !' AS MENSAGEM; 
        ELSE
			INSERT INTO funcionario (id_func, corem_func, cpf_func, nome_func, nasc_func, nac_func, sexo_func, cargo_func,
			end_func, tel_func, email_func, departamento_id_dep, departamento_hospital_id_hosp, setor_id_setor, setor_hospital_id_hosp)
			VALUES(id_funci, corem_funci, cpf_funci, nome_funci, nasc_funci, 
			nac_funci, sexo_funci, cargo_funci, end_funci, tel_funci, email_funci, depart_id_dep, depart_hosp_id_hosp,
			set_id_setor, setor_hosp_id_hosp);
        END IF;
END $$
DELIMITER ;

## Script responsável por dropar a procedure
DROP PROCEDURE prc_inserir_funcionario_apmedNI;
# Script responsável por chamar a procedure
CALL apmed2.prc_inserir_funcionario_apmedNI(3, '75495-45', '828.656.600-95', 'Ary Barros Sousa', '1993-09-12', 'Americano', 'M', 
'Enfermeiro', 'Karolina do Sul', '(61) 9 9344-6464', 'aryB@enfermeiro.com', NULL, NULL, 1, 1);

SELECT * FROM funcionario;



# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_funcionario_apmed (IN corem_funci VARCHAR(20), cpf_funci VARCHAR(20), nome_funci VARCHAR(150),
nasc_funci DATE, nac_funci VARCHAR(45), sexo_funci ENUM('M', 'F', 'O'), cargo_funci VARCHAR(45), end_funci VARCHAR(150),
tel_funci VARCHAR(20), email_funci VARCHAR(100), depart_id_dep INT,
depart_hosp_id_hosp INT, set_id_setor INT, setor_hosp_id_hosp INT)
BEGIN
		IF EXISTS (SELECT cpf_func FROM funcionario WHERE cpf_func = cpf_funci)
		THEN
			SELECT 'Funcionário já existe !' AS MENSAGEM; 
        ELSE
			INSERT INTO funcionario (corem_func, cpf_func, nome_func, nasc_func, nac_func, sexo_func, cargo_func,
			end_func, tel_func, email_func, departamento_id_dep, departamento_hospital_id_hosp, setor_id_setor, setor_hospital_id_hosp)
			VALUES(corem_funci, cpf_funci, nome_funci, nasc_funci, 
			nac_funci, sexo_funci, cargo_funci, end_funci, tel_funci, email_funci, depart_id_dep, depart_hosp_id_hosp,
			set_id_setor, setor_hosp_id_hosp);
        END IF;
END $$
DELIMITER ;

## Script responsável por dropar a procedure
DROP PROCEDURE prc_inserir_funcionario_apmed;
# Script responsável por chamar a procedure
CALL apmed2.prc_inserir_funcionario_apmed(NULL , '137.951.951-10', 'João de Barro da Silva Sauro', '1987-6-07', 'Africana', 'F', 
'Atendente', 'Carinha que mora logo ali', '(61) 9 9344-6464', 'jão@atendente.com', 1, 1, NULL, NULL);

SELECT * FROM funcionario;
SELECT * FROM `apmed_bk`.funcionario_bk;

/*Backup de funcionario APMED
INSERT INTO funcionario (corem_func, cpf_func, nome_func, nasc_func, nac_func,
sexo_func, cargo_func, end_func, tel_func, email_func, setor_id_setor,
setor_hospital_id_hosp)
VALUES ('321-5', '267.983.893-63', 'Kika Uma Vez Kika De Novo', 19900612, 'Americano', 'M', 
'Enfermeiro', 'Acapulco', '(61) 6 6666-5555', 'kiko@enfermeiro.com', 2, 2, 2 , 2);
*/
/*
SELECT * FROM funcionario;
SELECT * FROM atendimento;
SELECT * FROM paciente;
SELECT * FROM departamento;
SELECT * FROM setor;
SELECT * FROM medico;
*/



#Script responsável por fazer o UPDATE de dados de funcionario
DELIMITER $$
CREATE PROCEDURE 
prc_update_funcionario_apmed (IN id_funci INT, corem_funci VARCHAR(20), cpf_funci VARCHAR(20), nome_funci VARCHAR(150),
nasc_funci DATE, nac_funci VARCHAR(45), sexo_funci ENUM('M', 'F', 'O'), cargo_funci VARCHAR(45), end_funci VARCHAR(150),
tel_funci VARCHAR(20), email_funci VARCHAR(100), depart_id_dep INT, depart_hosp_id_hosp INT, set_id_setor INT, setor_hosp_id_hosp INT)
BEGIN

		UPDATE funcionario SET corem_func = corem_funci, cpf_func = cpf_funci, nome_func = nome_funci, nasc_func = nasc_funci,
		nac_func = nac_funci, sexo_func = sexo_funci, cargo_func = cargo_funci, end_func = end_funci, tel_func = tel_funci,
		email_func = email_funci, departamento_id_dep = depart_id_dep, departamento_hospital_id_hosp = depart_hosp_id_hosp,
		setor_id_setor = set_id_setor, setor_hospital_id_hosp = setor_hosp_id_hosp
		WHERE id_func = id_funci;

		SELECT * FROM funcionario;
END $$
DELIMITER ;

# Script responsável por dropar a procedure
DROP PROCEDURE prc_update_funcionario_apmed;
# Script responsável por chamar a procedure
CALL apmed2.prc_update_funcionario_apmed(2, NULL, '828.656.600-95', 'Nicola Carrilho Brásio Sauro', '1993-09-12', 'Americano', 'F', 
'Atendente', 'Karolina do Sul', '(61) 9 9344-6464', 'aryB@enfermeiro.com', NULL, NULL, 1, 1);



-- PROCEDURE DE DELETE FUNCIONARIO --
DELIMITER $$
CREATE PROCEDURE
prc_delete_funcionario_apmed (IN id_funci INT)
BEGIN
	/*Atendimento */
    DELETE FROM funcionario WHERE id_func = id_funci;
	SELECT * FROM funcionario;
END $$
DELIMITER ;

# Script responsável por dropar a procedure
DROP PROCEDURE prc_delete_funcionario_apmed;
# Script responsável por chamar a procedure
CALL apmed2.prc_delete_funcionario_apmed(2);

