# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_IngressosNI (IN cod_ingr INT, tipo_ingr VARCHAR(100), vlr_ingr DECIMAL(10,2),
filmes_cod_filme INT, sessao_cod_sessao INT, salas_cod_sala INT)
BEGIN
	
		INSERT INTO ingressos (cod_ingr, tipo_ingr, vlr_ingr, filmes_cod_filme, sessao_cod_sessao, salas_cod_sala)
		VALUES (cod_ingr, tipo_ingr, vlr_ingr, filmes_cod_filme, sessao_cod_sessao, salas_cod_sala);
        SELECT * FROM ingressos;

END $$
DELIMITER ;

SELECT * FROM salas;
SELECT * FROM sessao;
SELECT * FROM filmes;
SELECT * FROM ingressos;

#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_IngressosNI;
CALL cinema.prc_inserir_Cinemas_IngressosNI (1, '', 9.99, 2, 1, 2);


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_IngressosAI (IN tipo_ingr VARCHAR(100), vlr_ingr DECIMAL(10,2),
filmes_cod_filme INT, sessao_cod_sessao INT, salas_cod_sala INT)
BEGIN
	DECLARE id_ingr INT;

		SELECT MAX(cod_ingr) INTO id_ingr FROM ingressos;
		INSERT INTO ingressos (cod_ingr, tipo_ingr, vlr_ingr, filmes_cod_filme, sessao_cod_sessao, salas_cod_sala)
		VALUES (id_ingr+1, tipo_ingr, vlr_ingr, filmes_cod_filme, sessao_cod_sessao, salas_cod_sala);
        SELECT * FROM ingressos;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_IngressosAI;
CALL cinema.prc_inserir_Cinemas_IngressosAI ('Filme - Cruella', 9.99, 2, 1, 2);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Ingressos (IN codd_ingr INT, tipo_ingr VARCHAR(100), vlr_ingr DECIMAL(10,2),
filmes_cod_filme INT, sessao_cod_sessao INT, salas_cod_sala INT)
BEGIN

		UPDATE ingressos SET tipo_ingr = tipo_ingr, vlr_ingr = vlr_ingr, filmes_cod_filme = filmes_cod_filme,
        sessao_cod_sessao = sessao_cod_sessao, salas_cod_sala = salas_cod_sala
		WHERE  cod_ingr = codd_ingr;
        SELECT * FROM ingressos;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from ingressos;
DROP PROCEDURE prc_update_Cinema_Ingressos;
CALL cinema.prc_update_Cinema_Ingressos (2 ,'Filme - Mortal Kombat', 9.99, 1, 1, 2);


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Ingressos (IN codd_ingr INT)
BEGIN

    DELETE FROM ingressos WHERE cod_ingr = codd_ingr;
	SELECT * from ingressos;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Ingressos;
CALL cinema.prc_delete_Cinema_Ingressos(2);

