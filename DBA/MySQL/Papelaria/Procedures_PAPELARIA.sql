DELIMITER $$
  CREATE PROCEDURE SP_AtualizaEstoque_2 (idd INT, id_prod INT, qtde_comprada INT, valor_unit DECIMAL(9.2))
BEGIN
    DECLARE contador INT;

    SELECT COUNT(*) INTO contador FROM estoque WHERE id_produto = id_prod;

    IF contador > 0 THEN
        UPDATE estoque SET qtde = qtde + qtde_comprada, valor_unitario = valor_unit, id_produto = id_prod
        WHERE id = idd;
    ELSE
        INSERT INTO estoque (id_produto, qtde, valor_unitario) 
        VALUES (id_prod, qtde_comprada, valor_unit);
    END IF;
END $$
DELIMITER ;

DROP PROCEDURE SP_AtualizaEstoque_2;
CALL papelaria.SP_AtualizaEstoque_2 (1, 2, 30, 15);
SELECT * FROM estoque;



DELIMITER $$
CREATE PROCEDURE SP_AtualizaEstoque (id_prod int, qtde_comprada int, valor_unit decimal(9.2))
BEGIN
    declare contador int;

    SELECT count(*) into contador FROM estoque WHERE id_produto = id_prod;

    IF contador > 0 THEN
        UPDATE estoque SET qtde =+ qtde_comprada, valor_unitario = valor_unit
        WHERE id_produto = id_prod;
    ELSE
        INSERT INTO estoque (id_produto, qtde, valor_unitario) 
        values (id_prod, qtde_comprada, valor_unit);
    END IF;
END
DELIMITER ;

DROP PROCEDURE SP_AtualizaEstoque;

CALL papelaria.SP_AtualizaEstoque (1, 15, 15);

SELECT * FROM estoque;