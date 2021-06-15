/*Criação do banco de dados*/
DROP DATABASE IF EXISTS correntista;
CREATE DATABASE IF NOT EXISTS correntista;
USE correntista;

/*Criação da tabela*/
CREATE TABLE tbl_correntista (
correntista_id int auto_increment primary key,
correntista_nome varchar(60) not null,
correntista_cpf varchar(20) not null,
dt_cadastro timestamp default current_timestamp(),
unique(correntista_cpf)
) Engine = InnoDB;


# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE 
mySp_correntistaInsert (v_nome VARCHAR(60), v_cpf VARCHAR(20))
BEGIN
	IF ((v_nome != '') && (v_cpf != '')) THEN
		INSERT INTO tbl_correntista (correntista_nome, correntista_cpf)
		VALUES (v_nome, v_cpf);
	ELSE
		SELECT 'NOME e CPF devem ser fornecidos para o cadastro!' AS Msg;
END IF;
END $$
DELIMITER ;

CALL correntista.mySp_correntistaInsert('Wagner Bianchi', '023.456.789-10');

DELIMITER $$
CREATE PROCEDURE 
mySp_correntistaUpdate (v_id INT, v_nome VARCHAR(60), v_cpf VARCHAR(20))
	IF (((v_id > 0) AND (v_id != '') ) AND (v_nome != '') AND (v_cpf != '')) 
    THEN
		UPDATE tbl_correntista SET correntista_nome =v_nome,
		correntista_cpf =v_cpf
		WHERE correntista_id =v_id;
	ELSE
		SELECT 'O novos NOME e CPF devem ser informados!' AS Msg;
	END IF;
END $$
DELIMITER ;

CALL correntista.mySp_correntistaUpdate(1, 'Wagner MySQL Bianchi', '123.123.111-11');



DELIMITER $$
CREATE PROCEDURE 
mySp_correntistaDelete(v_id INT)
BEGIN
	IF ((v_id > 0) && (v_id != '')) THEN
		DELETE FROM tbl_correntista 
        WHERE correntista_id = v_id;
	ELSE
		SELECT 'O identifiador do registro não foi informado!' AS Msg;
	END IF;
END $$
DELIMITER ;

CALL correntista.mySp_correntistaDelete(1);
SELECT * FROM tbl_correntista;
