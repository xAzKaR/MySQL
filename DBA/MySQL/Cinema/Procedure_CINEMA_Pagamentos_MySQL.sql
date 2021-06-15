# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_PagamentosNI (IN cod_pag INT, data_pag DATE, vlr_pag DECIMAL(10,2), tipo_pag VARCHAR(32),
clientes_cod_ped INT)
BEGIN
	
		INSERT INTO pagamentos (cod_pag, data_pag, vlr_pag, tipo_pag, clientes_cod_ped)
		VALUES (cod_pag, data_pag, vlr_pag, tipo_pag, clientes_cod_ped);
        SELECT * FROM pagamentos;

END $$
DELIMITER ;

SELECT * FROM pagamentos;
SELECT * FROM pedidos;

#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_PagamentosNI;
CALL cinema.prc_inserir_Cinemas_PagamentosNI (1, '20210602', 1600, 'Reserva de Sala', 1);


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_PagamentosAI (IN data_pag DATE, vlr_pag DECIMAL(10,2), tipo_pag VARCHAR(32),
clientes_cod_ped INT)
BEGIN
	DECLARE id_pag INT;

		SELECT MAX(cod_pag) INTO id_pag FROM pagamentos;
		INSERT INTO pagamentos (cod_pag, data_pag, vlr_pag, tipo_pag, clientes_cod_ped)
		VALUES (id_pag+1, data_pag, vlr_pag, tipo_pag, clientes_cod_ped);
        SELECT * FROM pagamentos;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_PagamentosAI;
CALL cinema.prc_inserir_Cinemas_PagamentosAI ('20210602', 1600, 'Reserva de Sala', 1);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Pagamentos (IN codd_pag INT, data_pag DATE, vlr_pag DECIMAL(10,2), tipo_pag VARCHAR(32),
clientes_cod_ped INT)
BEGIN

		UPDATE pagamentos SET data_pag = data_pag, vlr_pag = vlr_pag, tipo_pag = tipo_pag,
        clientes_cod_ped = clientes_cod_ped
		WHERE  cod_pag = codd_pag;
        SELECT * FROM pagamentos;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from pagamentos;
DROP PROCEDURE prc_update_Cinema_Pagamentos;
CALL cinema.prc_update_Cinema_Pagamentos (2, '20210602', 2600, 'Reserva de Sala', 1);


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Pagamentos (IN codd_pag INT)
BEGIN

    DELETE FROM pagamentos WHERE cod_pag = codd_pag;
	SELECT * from pagamentos;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Pagamentos;
CALL cinema.prc_delete_Cinema_Pagamentos(2);

