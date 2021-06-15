-- TESTE COM IF EXISTS --
DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_inserir_dept`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_dept (IN nome_depart VARCHAR(14), loc_dept VARCHAR(13) )
BEGIN
	DECLARE id INT;
	IF EXISTS (SELECT dname FROM dept WHERE dname = nome_depart)
	THEN
		SELECT 'O departamento já existe!' AS Mensagem;
	ELSE
		INSERT INTO dept (dname, loc)
		VALUES(nome_depart, loc_dept);
	END IF;
    SELECT * FROM dept;
END $$
DELIMITER ;

SELECT * FROM dept;

-- INSERIR DEPARTAMENTO --
CALL salgrade.prc_inserir_dept('RH', 'Brasil');



# Insert sem autoincrement #
DELIMITER $$
CREATE PROCEDURE
prc_inserir_dept_2 (IN deptno DECIMAL(2), dname VARCHAR(14), loc VARCHAR(13))
BEGIN
	
		INSERT INTO dept (deptno, dname, loc)
		VALUES (deptno, dname, loc);
        
END $$
DELIMITER ;

DROP PROCEDURE prc_inserir_dept_2;
CALL salgrade.prc_inserir_dept_2(1, 'Analista', 'Brasil');



DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_update_departamentos`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_update_dept (IN nome_departamentos VARCHAR(14), IN cod_depto DECIMAL(2,0))
BEGIN
	IF EXISTS (SELECT dname FROM dept WHERE dname = nome_departamentos)
	THEN
		SELECT 'Esse cargo já existe!' AS Mensagem;
		ELSE
		UPDATE dept SET dname = nome_departamentos WHERE deptno = cod_depto;
		SELECT * from dept;
	END IF;
END $$
DELIMITER ;



-- UPDATE DE DEPARTAMENTO --
DROP PROCEDURE prc_update_dept;
CALL salgrade.prc_update_dept('Informática' , '2');
SELECT * FROM dept;

DELIMITER $$

CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_delete_dept (IN cod_departamentos DECIMAL(2,0))
BEGIN
	DELETE FROM emp WHERE deptno = cod_departamentos;
	DELETE FROM dept WHERE deptno = cod_departamentos;
	SELECT deptno from emp;
	SELECT deptno from dept;
END $$
DELIMITER ;


-- DELETAR departamentos/empregado se existir --
SELECT * from dept;
#DROP PROCEDURE IF EXISTS `prc_delete_dept`;
CALL salgrade.prc_delete_dept(106);