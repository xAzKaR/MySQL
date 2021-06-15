# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_PedidosNI (IN cod_ped INT, clientes_cod_cli INT, servicos_cod_serv INT)
BEGIN
	
		INSERT INTO pedidos (cod_ped, clientes_cod_cli, servicos_cod_serv)
		VALUES (cod_ped, clientes_cod_cli, servicos_cod_serv);
        SELECT * FROM pedidos;

END $$
DELIMITER ;

SELECT * FROM pedidos;
SELECT * FROM clientes;
SELECT * FROM servicos;


#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_PedidosNI;
CALL cinema.prc_inserir_Cinemas_PedidosNI (1, 1 , 1);


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_PedidosAI (IN clientes_cod_cli INT, servicos_cod_serv INT)
BEGIN
	DECLARE id_ped INT;

		SELECT MAX(cod_ped) INTO id_ped FROM pedidos;
		INSERT INTO pedidos (cod_ped, clientes_cod_cli, servicos_cod_serv)
		VALUES (id_ped+1, clientes_cod_cli, servicos_cod_serv);
        SELECT * FROM pedidos;




END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_PedidosAI;
CALL cinema.prc_inserir_Cinemas_PedidosAI (1, 1);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Pedidos (IN codd_ped INT, clientes_cod_cli INT, servicos_cod_serv INT)
BEGIN

		UPDATE pedidos SET clientes_cod_cli = clientes_cod_cli, servicos_cod_serv = servicos_cod_serv
		WHERE  cod_ped = codd_ped;
        SELECT * FROM pedidos;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from salas;
DROP PROCEDURE prc_update_Cinema_Pedidos;
CALL cinema.prc_update_Cinema_Pedidos (2, 1, 1);


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Pedidos (IN codd_ped INT)
BEGIN

    DELETE FROM pedidos WHERE cod_ped = codd_ped;
	SELECT * from pedidos;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Pedidos;
CALL cinema.prc_delete_Cinema_Pedidos(2);

