# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_convenio_apmedNI (IN id_convi INT, cnpj_convi VARCHAR(25), raz_convi VARCHAR(150), tel_convi VARCHAR(20), email_convi VARCHAR(100))
BEGIN
	
		INSERT INTO convenio (id_conv, cnpj_conv, raz_conv, tel_conv, email_conv)
		VALUES (id_convi, cnpj_convi, raz_convi, tel_convi, email_convi);
        SELECT * FROM convenio;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_convenio_apmedNI;
CALL apmed2.prc_inserir_convenio_apmedNI(4 , '03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');

/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de Convenio #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_convenio_apmed (IN cnpj_convi VARCHAR(25), raz_convi VARCHAR(150), tel_convi VARCHAR(20), email_convi VARCHAR(100))
BEGIN

		INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
		VALUES (cnpj_convi, raz_convi, tel_convi, email_convi);
        SELECT * FROM convenio;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_convenio_apmed;
CALL apmed2.prc_inserir_convenio_apmed('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/


# Procedure Responsável pelo UPDATE  de convenio
DELIMITER $$
CREATE PROCEDURE 
prc_update_convenio_apmed (IN id_convi INT, cnpj_convi VARCHAR(25), raz_convi VARCHAR(150), tel_convi VARCHAR(20), email_convi VARCHAR(100))
BEGIN

		UPDATE convenio SET cnpj_conv = cnpj_convi, raz_conv = raz_convi, tel_conv = tel_convi, email_conv = email_convi
		WHERE  id_conv = id_convi;
        SELECT * FROM convenio;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from convenio;
DROP PROCEDURE prc_update_convenio_apmed;
CALL apmed2.prc_update_convenio_apmed(4 , '03.999.222/1111-02', 'Doffus Ceratus', '(61) 9999-8888', 'notredame@convenio.com');


# Procedure responsável pela deleção de convenio
DELIMITER $$
CREATE PROCEDURE
prc_delete_convenio_apmed (IN id_convi INT)
BEGIN
	/*Atendimento */
    DELETE FROM convenio WHERE id_conv = id_convi;
	SELECT * from convenio;
END $$
DELIMITER ;

CALL apmed2.prc_delete_convenio_apmed(5);

