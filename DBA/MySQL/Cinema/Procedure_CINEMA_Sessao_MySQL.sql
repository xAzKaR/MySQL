# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_SessaoNI (IN cod_sessao INT, data_sessao DATE, hora_sessao TIME )
BEGIN
	
		INSERT INTO sessao (cod_sessao, data_sessao, hora_sessao)
		VALUES (cod_sessao, data_sessao, hora_sessao);
        SELECT * FROM sessao;

END $$
DELIMITER ;



#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_SessaoNI;
CALL cinema.prc_inserir_Cinemas_SessaoNI (1, '20210531', '16:30:00');


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_Sessao (IN data_sessao DATE, hora_sessao TIME)
BEGIN
	DECLARE id_sessao INT;

		SELECT MAX(cod_sessao) INTO id_sessao FROM sessao;
		INSERT INTO sessao (cod_sessao, data_sessao, hora_sessao)
		VALUES (id_sessao+1, data_sessao, hora_sessao);
        SELECT * FROM sessao;



END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_Sessao;
CALL cinema.prc_inserir_Cinemas_Sessao ('20210531', '16:30:00');
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Sessao (IN codd_sessao INT, data_sessao DATE, hora_sessao TIME)
BEGIN

		UPDATE sessao SET data_sessao = data_sessao, hora_sessao = hora_sessao
		WHERE  cod_sessao = codd_sessao;
        SELECT * FROM sessao;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from sessao;
DROP PROCEDURE prc_update_Cinema_Sessao;
CALL cinema.prc_update_Cinema_Sessao (2, '20210525', '16:30:00');


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Sessao (IN codd_sessao INT)
BEGIN

    DELETE FROM sessao WHERE cod_sessao = codd_sessao;
	SELECT * from sessao;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Sessao;
CALL cinema.prc_delete_Cinema_Sessao(2);

