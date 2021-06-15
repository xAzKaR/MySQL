#Apagar Banco de dados se existir
DROP DATABASE IF EXISTS escola_abc;

#Criação da Base de dados
CREATE DATABASE IF NOT EXISTS escola_abc CHARACTER SET = 'utf8';

USE escola_abc;

#Criação das tabelas
-- -----------------------------------------------------
-- Table aluno
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS aluno (
   id  INT NOT NULL ,
   nome  VARCHAR(100) NOT NULL ,
   matricula  VARCHAR(45) NOT NULL ,
   data_nascimento  DATE NULL ,
   data_matricula  DATE NOT NULL ,
  PRIMARY KEY ( id ) ,
  UNIQUE INDEX  matricula_UNIQUE  ( matricula  ASC) )
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table  prova
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS prova (
   id  INT NOT NULL ,
   data_realizacao  DATE NOT NULL ,
   descricao  VARCHAR(255) NOT NULL ,
  PRIMARY KEY ( id ) )
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table nota
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS nota (
   aluno_id  INT NOT NULL ,
   prova_id  INT NOT NULL ,
   valor_nota  DECIMAL(15,2) NULL ,
  PRIMARY KEY ( aluno_id ,  prova_id ) ,
  INDEX  fk_aluno_has_prova_prova1  ( prova_id  ASC) ,
  INDEX  fk_aluno_has_prova_aluno1  ( aluno_id  ASC) ,
  CONSTRAINT  fk_aluno_has_prova_aluno1
    FOREIGN KEY ( aluno_id  )
    REFERENCES aluno ( id  )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  fk_aluno_has_prova_prova1
    FOREIGN KEY ( prova_id  )
    REFERENCES prova  ( id  )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



#População das tabelas
-- INSERINDO ALUNOS
INSERT INTO aluno (id, nome, matricula, data_nascimento,
data_matricula) VALUES
(1,'MICHAEL JONH', '123A', STR_TO_DATE('23/08/1993',
'%d/%m/%Y'), CURRENT_DATE()),
(2,'WILLIANS JUNIOR', '400B', STR_TO_DATE('10/04/1993',
'%d/%m/%Y'), CURRENT_DATE()),
(3,'JOHN BILLBOARD', '420B', STR_TO_DATE('30/07/1993',
'%d/%m/%Y'), CURRENT_DATE()),
(4,'JENNY KILLY', '010A', NULL, STR_TO_DATE('25/01/2014',
'%d/%m/%Y'));


-- INSERINDO PROVAS
INSERT INTO prova (id, data_realizacao, descricao) 
VALUES
(1, STR_TO_DATE('30/03/2014', '%d/%m/%Y'), 'Prova A1'),
(2, STR_TO_DATE('30/04/2014', '%d/%m/%Y'), 'Prova B1'),
(3, STR_TO_DATE('30/05/2014', '%d/%m/%Y'), 'Prova C1'),
(4, STR_TO_DATE('30/07/2014', '%d/%m/%Y'), 'Prova A2'),
(5, STR_TO_DATE('30/08/2014', '%d/%m/%Y'), 'Prova B2'),
(6, STR_TO_DATE('30/09/2014', '%d/%m/%Y'), 'Prova C2');



INSERT INTO nota (aluno_id, prova_id, valor_nota) 
VALUES
#ALUNO 1
(1, 1, 10),
(1, 2, 9.8),
(1, 3, 8),
(1, 4, 10),
(1, 5, 10),
(1, 6, 9);

INSERT INTO nota (aluno_id, prova_id, valor_nota) 
VALUES
#ALUNO 2
(2, 1, 7),
(2, 2, 7.5),
(2, 3, 6),
(2, 4, 8),
(2, 5, 8.5),
(2, 6, 9);

INSERT INTO nota (aluno_id, prova_id, valor_nota) 
VALUES
#ALUNO 3
(3, 1, 9),
(3, 2, 9),
(3, 3, 9),
(3, 4, 10),
(3, 5, 10),
(3, 6, 9.8);

INSERT INTO nota (aluno_id, prova_id, valor_nota) 
VALUES
#ALUNO 4
(4, 1, 3),
(4, 2, 6),
(4, 3, 7),
(4, 4, 8),
(4, 5, 7),
(4, 6, 7);



#Criação da função calcula_nota()
DELIMITER $$ 
CREATE FUNCTION calc_nota(nota DECIMAL(15,2)) 
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
 DECLARE peso INT;
 #Se a nota do aluno for maior que 9.5 então sua nota terá um peso maior
 IF nota > 9.5 
 THEN
  SET peso = 2;
 ELSE
  SET peso = 1;
 END IF;
 RETURN (nota*peso) / 20;
END $$
DELIMITER ;



-- FUNCTION EMPREGADO --
DELIMITER $$
CREATE FUNCTION arredondamento_nota()
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
      
 #O DECLARE serve para declarar uma variável que será utilizada durante o programa
 DECLARE nota_atual NUMERIC(15,2);
 DECLARE id_aluno, id_prova INT;
  #Criamos um CURSOR que irá “guardar” o resultado do SELECT
 DECLARE cur CURSOR FOR SELECT valor_nota, aluno_id, prova_id FROM nota;
  #Abrimos o CURSOR para utilizá-lo dentro do LOOP
 OPEN cur;
  #Inicamos o LOOP dando um nome ao mesmo para que este possa ser referenciado caso #necessário myloop:
 LOOP
    #Atribuímos o valor das colunas do cursor as variáveis que criamos anteriormente
    FETCH cur INTO nota_atual, id_aluno, id_prova;
    #Lógica principal da nossa rotina.
    #Caso o próximo inteiro tenha um diferença de 0.2 ou menos da nota atual
    # então a nota atual será arredondada para este inteiro.
    IF (CEIL(nota_atual) - nota_atual) <= 0.2
    THEN
      UPDATE nota SET valor_nota = CEIL(nota_atual) 
      WHERE aluno_id = id_aluno AND prova_id = id_prova;
    END IF;
 END LOOP;
  #Fechamos o cursor
  CLOSE cur;
  
  RETURN CONCAT(cur,', ', 'Nota: ', nota_atual,', ', id_aluno, ' de ', id_prova,' de ', id_aluno);

END $$
DELIMITER ;
