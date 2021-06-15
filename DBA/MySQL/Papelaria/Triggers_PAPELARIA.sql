# Esse trigger será disparado após a inserção de um registro na tabela de “ENTRADA_PRODUTO”:
DELIMITER $$
CREATE TRIGGER TRG_EntradaProduto_AI AFTER INSERT ON entrada_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde, new.valor_unitario);
END $$
DELIMITER ;

#DROP TRIGGER TRG_EntradaProduto_AI;


# Esse trigger será disparado após a atualização de um registro na tabela de “ENTRADA_PRODUTO ”.
DELIMITER $$
CREATE TRIGGER TRG_EntradaProduto_AU AFTER UPDATE ON entrada_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde - old.qtde, new.valor_unitario);
END $$
DELIMITER ;

#DROP TRIGGER TRG_EntradaProduto_AU;


# Esse trigger será disparado após a exclusão de um registro na tabela de “ENTRADA_PRODUTO”.
DELIMITER $$
CREATE TRIGGER TRG_EntradaProduto_AD AFTER DELETE ON entrada_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde * -1, old.valor_unitario);
END $$
DELIMITER ;

#DROP TRIGGER TRG_EntradaProduto_AD;

# Esse trigger será disparado após a inserção de um registro na tabela de “SAIDA_PRODUTO”.
DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AI AFTER INSERT ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde * -1, new.valor_unitario);
END $$
DELIMITER ;

#DROP TRIGGER TRG_SaidaProduto_AI;

# Esse trigger será disparado após a atualização de um registro na tabela “SAIDA_PRODUTO”.
DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AU AFTER UPDATE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, old.qtde - new.qtde, new.valor_unitario);
END $$
DELIMITER ;

#DROP TRIGGER TRG_SaidaProduto_AU;

# Esse trigger será disparado após a exclusão de um registro na tabela de “SAIDA_PRODUTO”.
DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AD AFTER DELETE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde, old.valor_unitario);
END $$
DELIMITER ;

#DROP TRIGGER TRG_SaidaProduto_AD;
