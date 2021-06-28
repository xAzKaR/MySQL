# Esse trigger será disparado antes da inserção de um registro na tabela de “Consulta”, alimentando a tabela de backup:
DELIMITER $$
CREATE TRIGGER TRG_BKP_Consulta_BI BEFORE INSERT ON `apmed2`.`Consulta`
FOR EACH ROW
BEGIN
	DECLARE id_conss INT;
    SET id_conss = NEW.id_cons;

	INSERT INTO `apmed_bk`.`consulta_bk` SET id_cons = id_conss, paciente_id_pac = NEW.paciente_id_pac, 
    medico_id_med = NEW.medico_id_med, documentacao_id_doc = NEW.documentacao_id_doc, 
    paciente_setor_id_setor = NEW.paciente_setor_id_setor,
    paciente_setor_hospital_id_hosp = NEW.paciente_setor_hospital_id_hosp;

END $$
DELIMITER ;


SELECT * FROM `apmed2`.`Consulta`;
SELECT * FROM `apmed_bk`.`Consulta_BK`;




# Esse trigger será disparado antes a atualização de um registro na tabela de “paciente”, alimentando a tabela de backup.
DELIMITER $$
CREATE TRIGGER TRG_BKP_Consulta_BU BEFORE UPDATE ON Consulta
FOR EACH ROW
BEGIN
	DECLARE id_conss INT;
    DECLARE event ENUM('D','U');
    SET id_conss = NEW.id_cons;
    SET event = 'U';
    
     
	UPDATE `apmed_bk`.`consulta_bk` SET id_cons = id_conss, paciente_id_pac = NEW.paciente_id_pac, medico_id_med = NEW.medico_id_med,
    documentacao_id_doc = NEW.documentacao_id_doc, paciente_setor_id_setor = NEW.paciente_setor_id_setor,
	paciente_setor_hospital_id_hosp = NEW.paciente_setor_hospital_id_hosp, evento = event
	WHERE id_cons = id_conss;
      
    
END $$
DELIMITER ;

#DROP TRIGGER TRG_BKP_Consulta_BU;


DELIMITER $$
CREATE TRIGGER TRG_BKP_Consulta_AD AFTER DELETE ON consulta
FOR EACH ROW
BEGIN

	DECLARE event ENUM ('D','U');
    DECLARE id_conss INT;
    SET id_conss = OLD.id_cons;
    SET event = 'D';
    
	UPDATE `apmed_bk`.`consulta_bk` SET evento = event
	WHERE id_cons = id_conss;
      
END $$
DELIMITER ;

/*
DROP TRIGGER TRG_BKP_Consulta_BI;
DROP TRIGGER TRG_BKP_Consulta_BU;
DROP TRIGGER TRG_BKP_Consulta_AD;
*/