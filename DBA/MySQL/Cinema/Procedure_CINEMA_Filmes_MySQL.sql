# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_FilmesNI (IN cod_filme INT, tit_filme VARCHAR(100), dur_filme VARCHAR(32), gen_filme VARCHAR(50))
BEGIN
	
		INSERT INTO filmes (cod_filme, tit_filme, dur_filme, gen_filme)
		VALUES (cod_filme, tit_filme, dur_filme, gen_filme);
        SELECT * FROM filmes;

END $$
DELIMITER ;


#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_FilmesNI;
CALL cinema.prc_inserir_Cinemas_FilmesNI (1, 'Mortal Kombat', '02:55:19', 'Ação');


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_Filmes (IN tit_filme VARCHAR(100), dur_filme VARCHAR(32), gen_filme VARCHAR(50))
BEGIN
	DECLARE id_filme INT;

		SELECT MAX(cod_filme) INTO id_filme FROM filmes;
		INSERT INTO filmes (cod_filme, tit_filme, dur_filme, gen_filme)
		VALUES (id_filme+1, tit_filme, dur_filme, gen_filme);
        SELECT * FROM filmes;



END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_Filmes;
CALL cinema.prc_inserir_Cinemas_Filmes ('Cruella', '01:55:19', 'Comédia');
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Filmes (IN cod_filmes INT, tit_filme VARCHAR(100), dur_filme VARCHAR(32), gen_filme VARCHAR(50))
BEGIN

		UPDATE filmes SET tit_filme = tit_filme, dur_filme = dur_filme, gen_filme = gen_filme
		WHERE  cod_filme = cod_filmes;
        SELECT * FROM filmes;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from filmes;
DROP PROCEDURE prc_update_Cinema_Filmes;
CALL cinema.prc_update_Cinema_Filmes (2, 'Cruella', '01:55:19', 'Comédia');


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Filmes (IN cod_filmes INT)
BEGIN

    DELETE FROM filmes WHERE cod_filme = cod_filmes;
	SELECT * from filmes;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Filmes;
CALL cinema.prc_delete_Cinema_Filmes(2);

