# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_ServicosNI (IN cod_serv INT, tipo_serv VARCHAR(100), vlr_serv DECIMAL(10,2), desc_serv VARCHAR(150),
filmes_cod_filme INT, ingressos_cod_ingr INT, sessao_cod_sessao INT, salas_cod_sala INT, produtos_cod_prod INT)
BEGIN
	
		INSERT INTO servicos (cod_serv, tipo_serv, vlr_serv, desc_serv, filmes_cod_filme, ingressos_cod_ingr, sessao_cod_sessao,
        salas_cod_sala, produtos_cod_prod)
		VALUES (cod_serv, tipo_serv, vlr_serv, desc_serv, filmes_cod_filme, ingressos_cod_ingr, sessao_cod_sessao,
        salas_cod_sala, produtos_cod_prod);
        SELECT * FROM servicos;

END $$
DELIMITER ;



#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_ServicosNI;
# Chamar procedure
CALL cinema.prc_inserir_Cinemas_ServicosNI (2, 'Sessão para filmes públicos',
9.99, 'Público', 2, 1, 1, 2, 1);

SELECT * FROM filmes;
SELECT * FROM ingressos;
SELECT * FROM sessao;
SELECT * FROM salas;
SELECT * FROM produtos;

/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_ServicosAI (IN tipo_serv VARCHAR(100), vlr_serv DECIMAL(10,2), desc_serv VARCHAR(150),
filmes_cod_filme INT, ingressos_cod_ingr INT, sessao_cod_sessao INT, salas_cod_sala INT, produtos_cod_prod INT)
BEGIN
	DECLARE id_serv INT;

		SELECT MAX(cod_serv) INTO id_serv FROM servicos;
		INSERT INTO servicos (cod_serv, tipo_serv, vlr_serv, desc_serv, filmes_cod_filme, ingressos_cod_ingr, sessao_cod_sessao,
        salas_cod_sala, produtos_cod_prod)
		VALUES (id_serv+1, tipo_serv, vlr_serv, desc_serv, filmes_cod_filme, ingressos_cod_ingr, sessao_cod_sessao,
        salas_cod_sala, produtos_cod_prod);
        SELECT * FROM servicos;




END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_ServicosAI;
# Chamar procedure
CALL cinema.prc_inserir_Cinemas_ServicosAI ('Reserva de sala para apresentação', 1600, 'Somente convidados', NULL, NULL, NULL, 1, NULL);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/


# UPDATE DE SERVIÇOS
DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Servicos (IN codd_serv INT, tipo_serv VARCHAR(100), vlr_serv DECIMAL(10,2), desc_serv VARCHAR(150),
filmes_cod_filme INT, ingressos_cod_ingr INT, sessao_cod_sessao INT, salas_cod_sala INT, produtos_cod_prod INT)
BEGIN

		UPDATE servicos SET tipo_serv = tipo_serv, vlr_serv = vlr_serv, desc_serv = desc_serv, filmes_cod_filme = filmes_cod_filme,
        ingressos_cod_ingr = ingressos_cod_ingr, sessao_cod_sessao = sessao_cod_sessao, salas_cod_sala = salas_cod_sala,
        produtos_cod_prod = produtos_cod_prod
		WHERE  cod_serv = codd_serv;
        SELECT * FROM servicos;
        
END $$
DELIMITER ;

-- UPDATE DE SERVIÇOS --
SELECT * from servicos;
# Deletar procedure
DROP PROCEDURE prc_update_Cinema_Servicos;
# Chamar procedure
CALL cinema.prc_update_Cinema_Servicos (2, 'Reserva de sala para apresentação e instrução de projetos', 1600, 'Somente convidados',
NULL, NULL, NULL, 1, NULL);

# DELETE DE SERVIÇOS
DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Servicos (IN codd_serv INT)
BEGIN
	
    DELETE FROM servicos WHERE cod_serv = codd_serv;
	SELECT * from servicos;
    
END $$
DELIMITER ;
# Deletar procedure
DROP PROCEDURE IF EXISTS prc_delete_Cinema_Servicos;
# Chamar procedure
CALL cinema.prc_delete_Cinema_Servicos(2);

