# Esse trigger será disparado antes da inserção de um registro na tabela de “paciente”, alimentando a tabela de backup:
DELIMITER $$
CREATE TRIGGER TRG_BKP_Paciente_BI BEFORE INSERT ON `apmed2`.`paciente`
FOR EACH ROW
BEGIN
	DECLARE id_paci INT;
    SET id_paci = NEW.id_pac;
    
		INSERT INTO `apmed_bk`.`paciente_bk` SET id_pac = id_paci, cpf_pac = NEW.cpf_pac, nome_pac = NEW.nome_pac, nasc_pac = NEW.nasc_pac, nac_pac = NEW.nac_pac, 
        sexo_pac = NEW.sexo_pac, ocup_pac = NEW.ocup_pac, end_pac = NEW.end_pac, tel_pac = NEW.tel_pac, email_pac = NEW.email_pac, setor_id_setor = NEW.setor_id_setor,
        setor_hospital_id_hosp = NEW.setor_hospital_id_hosp, convenio_id_conv = NEW.convenio_id_conv;
END $$
DELIMITER ;


SELECT * FROM `apmed2`.`paciente`;
SELECT * FROM `apmed_bk`.`paciente_BK`;




# Esse trigger será disparado antes a atualização de um registro na tabela de “paciente”, alimentando a tabela de backup.
DELIMITER $$
CREATE TRIGGER TRG_BKP_Paciente_BU BEFORE UPDATE ON paciente
FOR EACH ROW
BEGIN
	DECLARE id_paci INT;
    DECLARE event ENUM('D','U');
    SET id_paci = NEW.id_pac;
    SET event = 'U';
    
     
	UPDATE `apmed_bk`.`paciente_bk` SET cpf_pac = NEW.cpf_pac, nome_pac = NEW.nome_pac, nasc_pac = NEW.nasc_pac, nac_pac = NEW.nac_pac, 
	sexo_pac = NEW.sexo_pac, ocup_pac = NEW.ocup_pac, end_pac = NEW.end_pac, tel_pac = NEW.tel_pac, email_pac = NEW.email_pac, setor_id_setor = NEW.setor_id_setor,
	setor_hospital_id_hosp = NEW.setor_hospital_id_hosp, convenio_id_conv = NEW.convenio_id_conv, evento = event
	WHERE id_pac = id_paci;
      
    
END $$
DELIMITER ;

#DROP TRIGGER TRG_BKP_Funcionario_BU;


DELIMITER $$
CREATE TRIGGER TRG_BKP_Paciente_AD AFTER DELETE ON paciente
FOR EACH ROW
BEGIN
	DECLARE event ENUM ('D','U');
    DECLARE id_paci INT;
    SET id_paci = OLD.id_pac;
    SET event = 'D';
    
	UPDATE `apmed_bk`.`paciente_bk` SET evento = event
	WHERE id_pac = id_paci;
      
END $$
DELIMITER ;


#DROP TRIGGER TRG_BKP_Paciente_BI;
#DROP TRIGGER TRG_BKP_Paciente_BU;
#DROP TRIGGER TRG_BKP_Paciente_AD;

