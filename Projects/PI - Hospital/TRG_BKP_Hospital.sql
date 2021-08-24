# Esse trigger será disparado após a inserção de um registro na tabela de “hospital”:
DELIMITER $$
CREATE TRIGGER TRG_BKP_Hospital_BI BEFORE INSERT ON hospital
FOR EACH ROW
BEGIN
		INSERT INTO `apmed_bk`.`hospital_bk` SET cnpj_hosp = NEW.cnpj_hosp, raz_hosp = NEW.raz_hosp, cep_hosp = NEW.cep_hosp,
        end_hosp = NEW.end_hosp, tel_hosp = NEW.tel_hosp, email_hosp = NEW.email_hosp;
END $$
DELIMITER ;



INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-12', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');

SELECT * FROM HOSPITAL_BK;



# Esse trigger será disparado após a atualização de um registro na tabela de “hospital”.
DELIMITER $$
CREATE TRIGGER TRG_BKP_Hospital_BU BEFORE UPDATE ON hospital
FOR EACH ROW
BEGIN
	DECLARE id_hosptal INT;
    DECLARE event ENUM('D','U');
    SET id_hosptal = NEW.id_hosp;
    SET event = 'U';
    
      UPDATE `apmed_bk`.`hospital_BK` SET cnpj_hosp = NEW.cnpj_hosp, raz_hosp = NEW.raz_hosp, cep_hosp = NEW.cep_hosp, 
      end_hosp = NEW.end_hosp, tel_hosp = NEW.tel_hosp, email_hosp = NEW.email_hosp, evento = event
      WHERE id_hosp = id_hosptal;

    
END $$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER TRG_BKP_Hospital_AD AFTER DELETE ON hospital
FOR EACH ROW
BEGIN
	DECLARE event ENUM ('D','U');
    DECLARE id_hosptal INT;
    SET id_hosptal = OLD.id_hosp;
    SET event = 'D';
    
	UPDATE `apmed_bk`.`hospital_BK` SET evento = event
	WHERE id_hosp = id_hosptal;
      
END $$
DELIMITER ;

#DROP TRIGGER TRG_EntradaProduto_AD;

#DROP TRIGGER TRG_BKP_Hospital_AU;
#DROP TRIGGER TRG_BKP_Hospital_AI;
#DROP TRIGGER TRG_BKP_Hospital_BI;
#DROP TRIGGER TRG_BKP_Hospital_BU;
#DROP TRIGGER TRG_BKP_Hospital_AD;