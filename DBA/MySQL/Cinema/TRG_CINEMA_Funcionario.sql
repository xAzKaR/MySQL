# Esse trigger será disparado antes da inserção de um registro na tabela de “funcionario”, alimentando a tabela de backup:
DELIMITER $$
CREATE TRIGGER TRG_BKP_Funcionarios_BI BEFORE INSERT ON `cinema`.`funcionarios`
FOR EACH ROW
BEGIN
	DECLARE matri_funci INT;
    SET matri_funci = NEW.matri_func;
    	
        INSERT INTO `cinema_bk`.`funcionarios_bk` SET matri_func = matri_funci, nm_func = NEW.nm_func, end_func = NEW.end_func, tel_func = NEW.tel_func, cinema_cod_cine = NEW.cinema_cod_cine;
        
END $$
DELIMITER ;


SELECT * FROM `cinema`.`funcionarios`;
SELECT * FROM `cinema_bk`.`Funcionarios_BK`;




# Esse trigger será disparado antes a atualização de um registro na tabela de “funcionario”, alimentando a tabela de backup.
DELIMITER $$
CREATE TRIGGER TRG_BKP_Funcionarios_BU BEFORE UPDATE ON `cinema`.`funcionarios`
FOR EACH ROW
BEGIN
	DECLARE matri_funci INT;
    DECLARE event ENUM('D','U');
    SET matri_funci = NEW.matri_func;
    SET event = 'U';
    
     
     UPDATE `cinema_bk`.`funcionarios_bk` SET nm_func = NEW.nm_func, end_func = NEW.end_func, tel_func = NEW.tel_func, cinema_cod_cine = NEW.cinema_cod_cine, evento = event
     WHERE matri_func = matri_funci;
      
    
END $$
DELIMITER ;

#DROP TRIGGER TRG_BKP_Funcionario_BU;


DELIMITER $$
CREATE TRIGGER TRG_BKP_Funcionarios_AD AFTER DELETE ON `cinema`.`funcionarios`
FOR EACH ROW
BEGIN
	DECLARE event ENUM ('D','U');
    DECLARE matri_funci INT;
    SET matri_funci = OLD.matri_func;
    SET event = 'D';
    
	UPDATE `cinema_bk`.`funcionarios_BK` SET evento = event
	WHERE matri_func = matri_funci;
      
END $$
DELIMITER ;


#DROP TRIGGER TRG_BKP_Funcionarios_BI;
#DROP TRIGGER TRG_BKP_Funcionarios_BU;
#DROP TRIGGER TRG_BKP_Funcionarios_AD;