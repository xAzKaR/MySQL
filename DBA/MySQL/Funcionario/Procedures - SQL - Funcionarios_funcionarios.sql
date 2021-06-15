-- TESTE COM IF EXISTS --
DELIMITER $$
#DROP PROCEDURE IF EXISTS prc_inserir_dependentes;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_funcionarios (IN nome_func VARCHAR(100), IN data_nasc DATE, IN sexo VARCHAR(1),
IN civil VARCHAR(30), IN rg_func VARCHAR(45), IN nacionalidade VARCHAR(45), IN salario VARCHAR(45), 
IN cod_cargo INT, IN cod_dep INT)
BEGIN
	DECLARE id INT;
	IF EXISTS (SELECT rg FROM funcionarios WHERE rg = rg_func)
	THEN
		SELECT 'O funcionario já existe!' AS Mensagem;
	ELSE
		SELECT MAX(mat_func) INTO id FROM funcionarios;
		INSERT INTO funcionarios (mat_func, nm_func, dt_nasc, sexo, est_civil, rg, nac_func, sal_func,
        cd_cargo, cd_depto)
		VALUES(id+1 , nome_func, data_nasc, sexo, civil, rg_func , nacionalidade, salario, cod_cargo, cod_dep);
	END IF;
    SELECT * FROM funcionarios;
END $$
DELIMITER ;

SELECT * FROM dependentes;
SELECT * FROM funcionarios;

-- INSERIR funcionarios --
CALL funcionarios.prc_inserir_funcionarios('Vanessa Dark', '1992-10-05', 'F', 'Casada', '36.107.888-2', 'Brasileira', '9323', '6', '105');


DELIMITER $$
#DROP PROCEDURE prc_update_dependentes;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_update_funcionarios (IN mat INT, IN nome_func VARCHAR(100), IN data_nasc DATE, IN sexo VARCHAR(1),
IN civil VARCHAR(30), IN rg_func VARCHAR(45), IN nacionalidade VARCHAR(45), IN salario VARCHAR(45), 
IN cod_cargo INT, IN cod_dep INT)
BEGIN
		UPDATE funcionarios SET nm_func = nome_func, dt_nasc = data_nasc, sexo = sexo , est_civil = civil,
        rg = rg_func, nac_func = nacionalidade, sal_func = salario, cd_cargo = cod_cargo, cd_depto = cod_dep 
        WHERE mat_func = mat;
		SELECT * from funcionarios;

END $$
DELIMITER ;

-- UPDATE DE FUNCIONARIOS --
CALL funcionarios.prc_update_funcionarios(1006,'Betina Marijuane Baptista', '1992-10-05', 'F', 'Casada', '36.107.888-2', 'Brasileira', '9323', '6', '105');
SELECT * FROM funcionarios;

DELIMITER $$
#DROP PROCEDURE prc_delete_dependentes;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_delete_funcionarios (IN matricula INT)
BEGIN
	IF EXISTS (SELECT mat_func FROM dependentes WHERE matricula)
    THEN
		DELETE FROM dependentes WHERE mat_func = matricula;
		DELETE FROM funcionarios WHERE mat_func = matricula;
    ELSE 
		DELETE FROM funcionarios WHERE mat_func = matricula;    
		SELECT * from funcionarios;
    END IF;
END $$
DELIMITER ;


-- DELETAR departamentos --
SELECT * from funcionarios;
CALL funcionarios.prc_delete_funcionarios(1006);

