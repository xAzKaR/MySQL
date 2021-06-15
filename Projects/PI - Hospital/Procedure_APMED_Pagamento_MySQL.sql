# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_pagamento_apmedNI (IN id_pgto INT, desc_pgto VARCHAR(100), data_pgto DATE, hora_pgto TIME, preco_pgto FLOAT, cred_pgto TINYINT, deb_pgto TINYINT, din_pgto TINYINT, conv_pgto TINYINT)
BEGIN
	
		INSERT INTO pagamento (id_pgto, desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto)
		VALUES (id_pgto, desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto);
        SELECT * FROM pagamento;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_pagamento_apmedNI;
CALL apmed2.prc_inserir_pagamento_apmedNI(5, 'Pagamento por convênio', 20210516, 160000, 0, 0, 0, 0, 1);

/*
INSERT INTO pagamento (desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto)
VALUES ('Pagamento por convênio', 20210516, 160000, 0, 0, 0, 0, 1);
*/

# Procedure para inserção de Pagamentos #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_pagamento_apmed (IN desc_pgto VARCHAR(100), data_pgto DATE, hora_pgto TIME, preco_pgto FLOAT, cred_pgto TINYINT, deb_pgto TINYINT, din_pgto TINYINT, conv_pgto TINYINT)
BEGIN

		INSERT INTO pagamento (desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto)
		VALUES (desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto);
        SELECT * FROM pagamento;

END $$
DELIMITER ;

#DROP PROCEDURE IF EXISTS prc_inserir_pagamento_apmed;
CALL apmed2.prc_inserir_pagamento_apmed('Pagamento por convênio', 20210516, 160000, 0, 0, 0, 0, 1);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



#Procedure responsável pelo UPDATE de pagamentos
DELIMITER $$
CREATE PROCEDURE 
prc_update_pagamento_apmed (IN id_pgtor INT, desc_pgto VARCHAR(100), data_pgto DATE, hora_pgto TIME, preco_pgto FLOAT, cred_pgto TINYINT, deb_pgto TINYINT, din_pgto TINYINT, conv_pgto TINYINT)
BEGIN

		UPDATE pagamento SET desc_pgto = desc_pgto, data_pgto = data_pgto, hora_pgto = hora_pgto, preco_pgto = preco_pgto, cred_pgto = cred_pgto, deb_pgto = deb_pgto, din_pgto = din_pgto, conv_pgto = conv_pgto
		WHERE  id_pgto = id_pgtor;
        SELECT * FROM pagamento;
        
END $$
DELIMITER ;

-- UPDATE DE pagamentos --
SELECT * from pagamento;
DROP PROCEDURE prc_update_pagamento_apmed;
CALL apmed2.prc_update_pagamento_apmed(5, 'Pagamento por crédito', 20210516, 160000, 1, 0, 0, 0, 0);



#Procedure responsável pelo DELETE de pagamentos
DELIMITER $$
CREATE PROCEDURE
prc_delete_pagamento_apmed (IN id_pgtor INT)
BEGIN
	/*Atendimento */
    DELETE FROM pagamento WHERE id_pgto = id_pgtor;
	SELECT * from pagamento;
END $$
DELIMITER ;

CALL apmed2.prc_delete_pagamento_apmed(6);

