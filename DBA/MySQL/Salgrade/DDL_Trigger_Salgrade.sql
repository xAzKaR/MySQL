# Trigger de DEPT
DELIMITER $$
CREATE TRIGGER tg_deptno BEFORE INSERT ON dept
FOR EACH ROW
BEGIN

	DECLARE id DECIMAL(2);
    
    SELECT MAX(deptno)+1 FROM dept INTO id;
    SET NEW.deptno = id;

END $$
DELIMITER ;

DROP TRIGGER tg_deptno;


# Trigger de EMP

DELIMITER $$
CREATE TRIGGER tg_empno BEFORE INSERT ON emp
FOR EACH ROW
BEGIN

	DECLARE id DECIMAL(4);
    
    SELECT MAX(empno)+1 FROM emp INTO id;
    SET NEW.empno = id;

END $$
DELIMITER ;

DROP TRIGGER tg_empno;