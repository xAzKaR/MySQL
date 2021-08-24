# Esse trigger será disparado antes da inserção de um registro na tabela de “funcionario”, alimentando a tabela de backup:
DELIMITER $$
CREATE TRIGGER TRG_BKP_Funcionarios_BI BEFORE INSERT ON `cinema`.`clientes`
FOR EACH ROW
BEGIN
	DECLARE codd_cli INT;
    SET codd_cli = NEW.cod_cli;
    	
        INSERT INTO `cinema_bk`.`clientes_bk` SET cod_cli = codd_cli, nm_cli = NEW.nm_cli, end_cli = NEW.end_cli, rg = NEW.rg, email_cli = NEW.email_cli, tel_cli = NEW.tel_cli, cpf = NEW.cpf;
        
END $$
DELIMITER ;


SELECT * FROM `cinema`.`clientes`;
SELECT * FROM `cinema_bk`.`clientes_BK`;




# Esse trigger será disparado antes a atualização de um registro na tabela de “funcionario”, alimentando a tabela de backup.
DELIMITER $$
CREATE TRIGGER TRG_BKP_Clientes_BU BEFORE UPDATE ON `cinema`.`clientes`
FOR EACH ROW
BEGIN
	DECLARE codd_cli INT;
    DECLARE event ENUM('D','U');
    SET codd_cli = NEW.cod_cli;
    SET event = 'U';
    
     
     UPDATE `cinema_bk`.`clientes_bk` SET nm_cli = NEW.nm_cli, end_cli = NEW.end_cli, rg = NEW.rg, email_cli = NEW.email_cli, tel_cli = NEW.tel_cli, cpf = NEW.cpf, evento = event
     WHERE cod_cli = codd_cli;
      
    
END $$
DELIMITER ;

#DROP TRIGGER TRG_BKP_Funcionario_BU;


DELIMITER $$
CREATE TRIGGER TRG_BKP_Clientes_AD AFTER DELETE ON `cinema`.`clientes`
FOR EACH ROW
BEGIN
	DECLARE event ENUM ('D','U');
    DECLARE codd_cli INT;
    SET codd_cli = OLD.cod_cli;
    SET event = 'D';
    
	UPDATE `cinema_bk`.`Clientes_BK` SET evento = event
	WHERE cod_cli = codd_cli;
      
END $$
DELIMITER ;


#DROP TRIGGER TRG_BKP_Funcionarios_BI;
#DROP TRIGGER TRG_BKP_Funcionarios_BU;
#DROP TRIGGER TRG_BKP_Funcionarios_AD;