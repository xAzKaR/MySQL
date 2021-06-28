# Esse trigger será disparado antes da inserção de um registro na tabela de “paciente”, alimentando a tabela de backup:
DELIMITER $$
CREATE TRIGGER TRG_BKP_Medico_BI BEFORE INSERT ON `apmed2`.`medico`
FOR EACH ROW
BEGIN
	DECLARE id_medi INT;
    SET id_medi = NEW.id_med;

	INSERT INTO `apmed_bk`.`medico_bk` SET id_med = id_medi, crm_med = NEW.crm_med, cpf_med = NEW.cpf_med, nome_med = NEW.nome_med, nasc_med = NEW.nasc_med, nac_med = NEW.nac_med, sexo_med = NEW.sexo_med,
	end_med = NEW.end_med, espec_med = NEW.espec_med, tel_med = NEW.tel_med, email_med = NEW.email_med, setor_id_setor = NEW.setor_id_setor, setor_hospital_id_hosp = NEW.setor_hospital_id_hosp;

END $$
DELIMITER ;


SELECT * FROM `apmed2`.`medico`;
SELECT * FROM `apmed_bk`.`medico_BK`;




# Esse trigger será disparado antes a atualização de um registro na tabela de “paciente”, alimentando a tabela de backup.
DELIMITER $$
CREATE TRIGGER TRG_BKP_Medico_BU BEFORE UPDATE ON medico
FOR EACH ROW
BEGIN
	DECLARE id_medi INT;
    DECLARE event ENUM('D','U');
    SET id_medi = NEW.id_med;
    SET event = 'U';
    
     
	UPDATE `apmed_bk`.`medico_bk` SET id_med = id_medi, crm_med = NEW.crm_med, cpf_med = NEW.cpf_med, nome_med = NEW.nome_med, nasc_med = NEW.nasc_med, nac_med = NEW.nac_med, sexo_med = NEW.sexo_med,
	end_med = NEW.end_med, espec_med = NEW.espec_med, tel_med = NEW.tel_med, email_med = NEW.email_med, setor_id_setor = NEW.setor_id_setor, setor_hospital_id_hosp = NEW.setor_hospital_id_hosp, evento = event
	WHERE id_med = id_medi;
      
    
END $$
DELIMITER ;

#DROP TRIGGER TRG_BKP_Funcionario_BU;


DELIMITER $$
CREATE TRIGGER TRG_BKP_Medico_AD AFTER DELETE ON medico
FOR EACH ROW
BEGIN

	DECLARE event ENUM ('D','U');
    DECLARE id_medi INT;
    SET id_medi = OLD.id_med;
    SET event = 'D';
    
	UPDATE `apmed_bk`.`medico_bk` SET evento = event
	WHERE id_med = id_medi;
      
END $$
DELIMITER ;


#DROP TRIGGER TRG_BKP_Medico_BI;
#DROP TRIGGER TRG_BKP_Medico_BU;
#DROP TRIGGER TRG_BKP_Medico_AD;