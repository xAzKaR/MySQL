# Esse trigger será disparado antes da inserção de um registro na tabela de “funcionario”, alimentando a tabela de backup:
DELIMITER $$
CREATE TRIGGER TRG_BKP_Funcionario_BI BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
	DECLARE id_funci INT;
    SET id_funci = NEW.id_func;
    	
        INSERT INTO `apmed_bk`.`funcionario_bk` SET id_func = id_funci, corem_func = NEW.corem_func OR NULL, cpf_func = NEW.cpf_func, nome_func = NEW.nome_func, nasc_func = NEW.nasc_func, nac_func = NEW.nac_func, sexo_func = NEW.sexo_func,
        cargo_func = NEW.cargo_func, end_func = NEW.end_func, tel_func = NEW.tel_func, email_func = NEW.email_func, departamento_id_dep = NEW.departamento_id_dep OR NULL, 
        departamento_hospital_id_hosp = NEW.departamento_hospital_id_hosp OR NULL, setor_id_setor = NEW.setor_id_setor OR NULL, setor_hospital_id_hosp = NEW.setor_hospital_id_hosp OR NULL;
END $$
DELIMITER ;


SELECT * FROM `apmed2`.`funcionario`;
SELECT * FROM `apmed_bk`.`Funcionario_BK`;




# Esse trigger será disparado antes a atualização de um registro na tabela de “funcionario”, alimentando a tabela de backup.
DELIMITER $$
CREATE TRIGGER TRG_BKP_Funcionario_BU BEFORE UPDATE ON funcionario
FOR EACH ROW
BEGIN
	DECLARE id_funci INT;
    DECLARE event ENUM('D','U');
    SET id_funci = NEW.id_func;
    SET event = 'U';
    
     
     UPDATE `apmed_bk`.`funcionario_bk` SET corem_func = NEW.corem_func, cpf_func = NEW.cpf_func, nome_func = NEW.nome_func, nasc_func = NEW.nasc_func, nac_func = NEW.nac_func, sexo_func = NEW.sexo_func,
     cargo_func = NEW.cargo_func, end_func = NEW.end_func, tel_func = NEW.tel_func, email_func = NEW.email_func, departamento_id_dep = NEW.departamento_id_dep, 
	 departamento_hospital_id_hosp = NEW.departamento_hospital_id_hosp, setor_id_setor = NEW.setor_id_setor, setor_hospital_id_hosp = NEW.setor_hospital_id_hosp, evento = event
     WHERE id_func = id_funci;
      
    
END $$
DELIMITER ;

#DROP TRIGGER TRG_BKP_Funcionario_BU;


DELIMITER $$
CREATE TRIGGER TRG_BKP_Funcionario_AD AFTER DELETE ON funcionario
FOR EACH ROW
BEGIN
	DECLARE event ENUM ('D','U');
    DECLARE id_funci INT;
    SET id_funci = OLD.id_func;
    SET event = 'D';
    
	UPDATE `apmed_bk`.`funcionario_BK` SET evento = event
	WHERE id_func = id_funci;
      
END $$
DELIMITER ;


#DROP TRIGGER TRG_BKP_Funcionario_BI;
#DROP TRIGGER TRG_BKP_Funcionario_BU;
#DROP TRIGGER TRG_BKP_Funcionario_AD;