-- TESTE COM IF EXISTS --
DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_inserir_emp`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_emp (
IN n_name VARCHAR(10),
job VARCHAR(9),
mgr DECIMAL(4,0),
hiredate DATE,
sal DECIMAL(7,2),
comm DECIMAL(7,2),
deptno DECIMAL(2,0) 
)
BEGIN
DECLARE id INT;
	IF EXISTS (SELECT ename FROM emp WHERE ename = n_name)
	THEN
		SELECT 'O empregado já está cadastrado!' AS Mensagem;
	ELSE
		INSERT INTO emp (ename, job, mgr, hiredate, sal, comm, deptno)
		VALUES(n_name, job, mgr, hiredate, sal, comm, deptno);
	END IF;
    SELECT * FROM emp;
END $$
DELIMITER ;

SELECT * FROM emp;

-- INSERIR EMPREGADO --
DROP PROCEDURE prc_inserir_emp;
CALL salgrade.prc_inserir_emp ('João José','Analista','1010','20200517','17950','10.55','1');

INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES ('1', 'Andrade', 'Analista', '1010', '20200517', '17950', '10.55', '2');


# Inserir empregado com autoincrement
DELIMITER $$
#DROP PROCEDURE IF EXISTS `prc_inserir_emp_2`;
CREATE PROCEDURE -- EXECUTAR SEMPRE AQUI PRIMEIRO --
prc_inserir_emp_2 (
IN n_name VARCHAR(10),
job VARCHAR(9),
mgr DECIMAL(4,0),
hiredate DATE,
sal DECIMAL(7,2),
comm DECIMAL(7,2),
deptno DECIMAL(2,0) 
)
BEGIN
	DECLARE emp_no DECIMAL(4);
	IF EXISTS (SELECT ename FROM emp WHERE ename = n_name)
	THEN
		SELECT 'O empregado já está cadastrado.' AS Mensagem;
	ELSE
		SELECT MAX(empno) INTO emp_no FROM emp;
		INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
		VALUES(emp_no+1, n_name, job, mgr, hiredate, sal, comm, deptno);
	END IF;
    SELECT * FROM emp;
END $$
DELIMITER ;

SELECT * FROM emp;

DROP PROCEDURE prc_inserir_emp_2;
CALL salgrade.prc_inserir_emp_2 ('Marceline','Analista','1010','20200517','17950','10.55','1');



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