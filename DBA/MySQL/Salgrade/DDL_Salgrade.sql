#Apagar Banco de dados se existir
DROP DATABASE IF EXISTS Salgrade;

#Criação da Base de dados
CREATE DATABASE IF NOT EXISTS Salgrade CHARACTER SET = 'utf8';

USE Salgrade;

#Criação das tabelas
-- -----------------------------------------------------
-- Table aluno
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS dept (
deptno	NUMERIC(2) PRIMARY KEY NOT NULL ,
dname  VARCHAR(14) NOT NULL ,
loc  VARCHAR(13) NOT NULL
 );
 
 CREATE  TABLE IF NOT EXISTS emp (
empno	NUMERIC(4) PRIMARY KEY NOT NULL ,
ename  VARCHAR(10) NOT NULL ,
job  VARCHAR(9) NOT NULL,
mgr numeric(4),
hiredate DATE,
sal numeric(7,2),
comm numeric(7,2),
deptno numeric(2),
CONSTRAINT `emp_dept`
FOREIGN KEY (`deptno`) REFERENCES `salgrade`.`dept` (deptno)
ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE  TABLE IF NOT EXISTS salgrade (
grade	NUMERIC,
losal   NUMERIC,
hisal   NUMERIC
 );


DELIMITER $$
CREATE TRIGGER tg_deptno BEFORE INSERT ON dept
FOR EACH ROW
BEGIN

	DECLARE id INT;
    SELECT MAX(deptno)+1 FROM dept INTO id;
    SET NEW.DEPTNO = ID;

END $$;
DELIMITER ;