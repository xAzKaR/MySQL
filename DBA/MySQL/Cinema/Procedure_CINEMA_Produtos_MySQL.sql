# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinemas_ProdutosNI (IN cod_prod INT, nm_prod VARCHAR(100), cat_prod VARCHAR(100), desc_prod VARCHAR(100), vlr_prod DECIMAL(10,2))
BEGIN
	
		INSERT INTO produtos (cod_prod, nm_prod, cat_prod, desc_prod, vlr_prod)
		VALUES (cod_prod, nm_prod, cat_prod, desc_prod , vlr_prod);
        SELECT * FROM produtos;

END $$
DELIMITER ;


#DROP PROCEDURE IF EXISTS prc_inserir_Cinemas_ProdutosNI;
CALL cinema.prc_inserir_Cinemas_ProdutosNI (1, 'Batata Frita', 'Alimentícios', 'Batata Frita 500g', 10.59);


/*
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');
*/

# Procedure para inserção de cinema com Auto-Increment#
DELIMITER $$
CREATE PROCEDURE
prc_inserir_Cinema_ProdutosAI (IN nm_prod VARCHAR(100), cat_prod VARCHAR(100), desc_prod VARCHAR(100), vlr_prod DECIMAL(10,2))
BEGIN
	DECLARE id_prod INT;

		SELECT MAX(cod_prod) INTO id_prod FROM produtos;
		INSERT INTO produtos (cod_prod, nm_prod, cat_prod, desc_prod, vlr_prod)
		VALUES (id_prod+1, nm_prod, cat_prod, desc_prod , vlr_prod);
        SELECT * FROM produtos;



END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_inserir_Cinema_ProdutosAI;
CALL cinema.prc_inserir_Cinema_ProdutosAI('Batata Frita', 'Alimentícios', 'Batata Frita 250g', 5.79);
/*
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');
*/



DELIMITER $$
CREATE PROCEDURE 
prc_update_Cinema_Produtos (IN cod_produto INT, nm_prod VARCHAR(100), cat_prod VARCHAR(100), desc_prod VARCHAR(100), vlr_prod DECIMAL(10,2))
BEGIN

		UPDATE produtos SET nm_prod = nm_prod, cat_prod = cat_prod, desc_prod = desc_prod, vlr_prod = vlr_prod
		WHERE  cod_prod = cod_produto;
        SELECT * FROM produtos;
        
END $$
DELIMITER ;

-- UPDATE DE hospital --
SELECT * from produtos;
DROP PROCEDURE prc_update_Cinema_Produtos;
CALL cinema.prc_update_Cinema_Produtos (2, 'Batata Frita', 'Alimentícios', 'Batata Frita 250g', 4.79);


DELIMITER $$
CREATE PROCEDURE
prc_delete_Cinema_Produtos (IN cod_produto INT)
BEGIN

    DELETE FROM produtos WHERE cod_prod = cod_produto;
	SELECT * from produtos;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prc_delete_Cinema_Produtos;
CALL cinema.prc_delete_Cinema_Produtos(2);

