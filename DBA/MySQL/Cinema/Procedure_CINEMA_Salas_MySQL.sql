# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_SalasNI (IN cod_sala INT, local_sala VARCHAR(50), capac_sala INT,
tipo_sala VARCHAR(50), reserv_sala BIT(1), vlr_sala DECIMAL(10,2), sessao_cod_sessao INT,
filmes_cod_filme INT)
BEGIN
	
		INSERT INTO salas (cod_sala, local_sala, capac_sala, tipo_sala, reserv_sala, vlr_sala,
        sessao_cod_sessao, filmes_cod_filme)
		VALUES (cod_sala, local_sala, capac_sala, tipo_sala, reserv_sala, vlr_sala,
        sessao_cod_sessao, filmes_cod_filme);
        SELECT * FROM salas;

END $$
DELIMITER ;



#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_SalasNI;
CALL cinema.prc_inserir_Cinemas_SalasNI (1, '1', 210, 'Filme Público', 0, 0, 1, 1);


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_SalasAI (IN local_sala VARCHAR(50), capac_sala INT,
tipo_sala VARCHAR(50), reserv_sala BIT(1), vlr_sala DECIMAL(10,2), sessao_cod_sessao INT,
filmes_cod_filme INT)
BEGIN
	DECLARE id_sala INT;

		SELECT MAX(cod_sala) INTO id_sala FROM salas;
		INSERT INTO salas (cod_sala, local_sala, capac_sala, tipo_sala, reserv_sala, vlr_sala,
        sessao_cod_sessao, filmes_cod_filme)
		VALUES (id_sala+1, local_sala, capac_sala, tipo_sala, reserv_sala, vlr_sala,
        sessao_cod_sessao, filmes_cod_filme);
        SELECT * FROM salas;




END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_SalasAI;
CALL cinema.prc_inserir_Cinemas_SalasAI ('3', 210, 'Filme Público', 0, 0, 1, 1);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Salas (IN codd_sala INT, local_sala VARCHAR(50), capac_sala INT,
tipo_sala VARCHAR(50), reserv_sala BIT(1), vlr_sala DECIMAL(10,2), sessao_cod_sessao INT,
filmes_cod_filme INT)
BEGIN

		UPDATE salas SET local_sala = local_sala, capac_sala = capac_sala, tipo_sala = tipo_sala,
        reserv_sala = reserv_sala, vlr_sala = vlr_sala, sessao_cod_sessao = sessao_cod_sessao,
        filmes_cod_filme = sessao_cod_sessao
		WHERE  cod_sala = codd_sala;
        SELECT * FROM salas;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from salas;
DROP PROCEDURE prc_update_Cinema_Salas;
CALL cinema.prc_update_Cinema_Salas (1, '1', 210, 'Apresentação/Palestra', 1, 1600, NULL, NULL);


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Salas (IN codd_sala INT)
BEGIN

    DELETE FROM salas WHERE cod_sala = codd_sala;
	SELECT * from salas;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Salas;
CALL cinema.prc_delete_Cinema_Salas(0);

