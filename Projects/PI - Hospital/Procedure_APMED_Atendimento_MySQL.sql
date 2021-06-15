# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_atendimento_apmedNI (IN id_atendi INT, desc_atendi VARCHAR(900), data_atendi DATE, hora_atendi TIME, priori_atendi VARCHAR(45), 
paciente_id_paci INT, funci_id_func INT, func_depart_id_dep INT, func_depart_hosp_id_hosp INT)
BEGIN
	
		INSERT INTO atendimento (id_atend, desc_atend, data_atend, hora_atend, priori_atend, paciente_id_pac, funcionario_id_func, funcionario_departamento_id_dep,
        funcionario_departamento_hospital_id_hosp)
		VALUES(id_atendi, desc_atendi, data_atendi, hora_atendi, priori_atendi, 
		paciente_id_paci, funci_id_func, func_depart_id_dep, func_depart_hosp_id_hosp);
        
END $$
DELIMITER ;

DROP PROCEDURE prc_inserir_atendimento_apmedNI;
CALL apmed2.prc_inserir_atendimento_apmedNI(3,'O paciente foi encaminhado com o dedão na mão direita do pé esquerdo',
'20210427', '001015', 'Acompanhamento', 1, 2, 1, 1);



/*
SELECT * FROM funcionario;
SELECT * FROM atendimento;
SELECT * FROM paciente;
SELECT * FROM departamento;

#Backup Inserção de dados da tabela atendimento
INSERT INTO atendimento (desc_atend, data_atend, hora_atend, priori_atend, paciente_id_pac,
funcionario_id_func, funcionario_departamento_id_dep, funcionario_departamento_hospital_id_hosp)
VALUES ('Paciente atendido por telefone e encaminhado ao hospital mais próximo',
20210101, 000000, 'Alta', 1, 1, 1, 1);
*/



# Procedure para inserção de Hospital com AUTOINCREMENT #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_atendimento_apmed (IN desc_atendi VARCHAR(900), data_atendi DATE, hora_atendi TIME, priori_atendi VARCHAR(45), 
paciente_id_paci INT, func_id_func INT, func_depart_id_dep INT, func_depart_hosp_id_hosp INT)
BEGIN

		INSERT INTO atendimento (desc_atend, data_atend, hora_atend, priori_atend, paciente_id_pac, funcionario_id_func, funcionario_departamento_id_dep,
        funcionario_departamento_hospital_id_hosp)
		VALUES(desc_atendi, data_atendi, hora_atendi, priori_atendi, paciente_id_paci, func_id_func, func_depart_id_dep,
        func_depart_hosp_id_hosp);
        
        SELECT * FROM atendimento;
END $$
DELIMITER ;

# Listagem de atendimento#
SELECT * FROM atendimento;
# DROP procedure
DROP procedure prc_inserir_atendimento_apmed;
# Comando para chamar a procedure
CALL apmed2.prc_inserir_atendimento_apmed('Paciente foi admitido no hospital e encaminhado para UTI',
'2021-02-15', '00:10:15', 'Internado', 3, 1, 2, 2);

SELECT cd_cargo,  - 2 FROM cargos;

SELECT id_atend - 10 FROM atendimento;

# Procedure responsável por fazer o UPDATE de atendimento do Hospital
DELIMITER $$
CREATE PROCEDURE 
prc_update_atendimento_apmed (IN id_atendi INT, desc_atendi VARCHAR(900), data_atendi DATE, hora_atendi TIME, priori_atendi VARCHAR(45), 
paciente_id_paci INT, func_id_func INT, func_depart_id_dep INT, func_depart_hosp_id_hosp INT)
BEGIN

		UPDATE atendimento SET desc_atend = desc_atendi, data_atend = data_atendi, hora_atend = hora_atendi, priori_atend = priori_atendi,
		paciente_id_pac = paciente_id_paci, funcionario_id_func = func_id_func, funcionario_departamento_id_dep = func_depart_id_dep,
		funcionario_departamento_hospital_id_hosp = func_depart_hosp_id_hosp
		WHERE id_atend = id_atendi;

		SELECT * from atendimento;
END $$
DELIMITER ;

-- UPDATE DE ATENDIMENTO --
SELECT * from atendimento;
#DROP PROCEDURE prc_update_atendimento_apmed;
CALL apmed2.prc_update_atendimento_apmed(5 ,'Paciente foi admitido no hospital e encaminhado para UTI',
'2021-02-15', '00:10:15', 'Alta', 3, 5, 2, 3);

-- PROCEDURE DE DELETE ATENDIMENTO --
DELIMITER $$
CREATE PROCEDURE
prc_delete_atendimento_apmed (IN id_atendi INT)
BEGIN
	/*Atendimento */
    DELETE FROM atendimento WHERE id_atend = id_atendi;
	SELECT * from atendimento;
END $$
DELIMITER ;

CALL apmed2.prc_delete_atendimento_apmed(12);



# Procedure responsável por fazer o UPDATE do código primário - TEST
DELIMITER $$
CREATE PROCEDURE 
prc_update_atendimento_apmed_1 (paciente_id_paci INT, id_atendi INT)
BEGIN

		UPDATE atendimento SET id_atend = id_atendi
		WHERE paciente_id_pac = paciente_id_paci;

		SELECT * from atendimento;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_update_atendimento_apmed_1;

CALL apmed2.prc_update_atendimento_apmed_1(3, 4)