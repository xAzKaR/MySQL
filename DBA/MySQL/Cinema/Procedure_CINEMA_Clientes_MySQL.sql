# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_clientesNI (IN cod_cli INT, nm_cli VARCHAR(100), end_cli VARCHAR(100), rg VARCHAR(15), email_cli VARCHAR(45),
 tel_cli VARCHAR(45), cpf VARCHAR(14))
BEGIN
	
		INSERT INTO clientes (cod_cli, nm_cli, end_cli, rg, email_cli, tel_cli, cpf)
		VALUES (cod_cli, nm_cli, end_cli, rg, email_cli, tel_cli, cpf);
        SELECT * FROM clientes;

END $$
DELIMITER ;


#DROP PROCEDURE IF EXISTS prc_inserir_cinemas_cinemaNI;
CALL cinema.prc_inserir_Cinemas_clientesNI (1, 'Selma Ramires Girão',
'Rua de cima do lado da direita', '47.196.756-7','selma@email.com',
'(61) 9 4002-8922', '673.829.350-00');


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinema_clientesAI (IN nm_cli VARCHAR(100), end_cli VARCHAR(100), rg VARCHAR(15), email_cli VARCHAR(45),
 tel_cli VARCHAR(45), cpf VARCHAR(14))
BEGIN
	DECLARE id_cli INT;

		SELECT MAX(cod_cli) INTO id_cli FROM clientes;
		INSERT INTO clientes (cod_cli, nm_cli, end_cli, rg, email_cli, tel_cli, cpf)
		VALUES (id_cli+1, nm_cli, end_cli, rg, email_cli, tel_cli, cpf);
        SELECT * FROM clientes;


END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinema_clientesAI;
CALL cinema.prc_inserir_Cinema_clientesAI('Selma Ramires Girão', 'Rua de cima do lado da direita', '47.196.756-7','selma@email.com',
'(61) 9 4002-8922', '673.829.350-00');
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Clientes (IN cod_clien INT, nm_cli VARCHAR(100), end_cli VARCHAR(100), rg VARCHAR(15), email_cli VARCHAR(45),
 tel_cli VARCHAR(45), cpf VARCHAR(14))
BEGIN

		UPDATE clientes SET nm_cli = nm_cli, end_cli = end_cli, rg = rg, email_cli = email_cli, tel_cli = tel_cli, cpf = cpf
		WHERE  cod_cli = cod_clien;
        SELECT * FROM clientes;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from cinemas;
DROP PROCEDURE prc_update_Cinema_Clientes;
CALL cinema.prc_update_Cinema_Clientes (2, 'Teste Ramires Girão', 'Rua de cima do lado da direita', '47.196.756-7','selma@email.com',
'(61) 9 4002-8922', '673.829.350-00');


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Clientes (IN cod_clien INT)
BEGIN

    DELETE FROM clientes WHERE cod_cli = cod_clien;
	SELECT * from clientes;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Clientes;
CALL cinema.prc_delete_Cinema_Clientes(2);

