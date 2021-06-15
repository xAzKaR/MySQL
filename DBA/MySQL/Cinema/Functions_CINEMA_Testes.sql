-- FUNCTION PARA FORMATAÇÃO DE SALÁRIO --
DELIMITER $$
CREATE FUNCTION fnc_formatacao (valor  DOUBLE)
/* RETORNA O TIPO DE DADO QUE SERÁ RETORNADO*/
RETURNS VARCHAR(30)
READS SQL DATA
BEGIN

	RETURN CONCAT('R$ : ', TRUNCATE(valor, 2));
    
END $$ 
DELIMITER ;

DROP FUNCTION IF EXISTS fnc_formatacao;

-- FUNCTION LOCALIZAR FUNCIONARIO --
DELIMITER $$ 
CREATE FUNCTION fnc_localiza_cod (codigo_funcionario  INT)
RETURNS VARCHAR(150)
READS SQL DATA
BEGIN
	DECLARE nome_funcionario VARCHAR(50);
    DECLARE endereco VARCHAR(50);
    
    SELECT nm_func, end_func INTO nome_funcionario, endereco
    FROM funcionarios
    WHERE matri_func = codigo_funcionario;
	RETURN CONCAT('Funcionario: ', nome_funcionario , ' , ' ,'Endereço: ' , endereco);
    
END $$
DELIMITER ;

DROP FUNCTION fnc_localiza_cod;


-- FUNCTION EMPREGADO --
DELIMITER $$
CREATE FUNCTION fnc_emp_cinema (codigo_funcionario INT)
RETURNS VARCHAR(200)
READS SQL DATA
    BEGIN
        DECLARE nome_funcionario VARCHAR(50);
        DECLARE nome_cinema VARCHAR(150);
       
            SELECT nm_func, local_cine
            INTO nome_funcionario, nome_cinema
            FROM funcionarios JOIN cinemas
            ON funcionarios.cinema_cod_cine = cinemas.cod_cine
            WHERE matri_func = codigo_funcionario;
            RETURN CONCAT('Funcionario: ', nome_funcionario , ', ', 'Cinema: ' , nome_cinema);
       
    END $$
DELIMITER ;

-- FUNCTION DEPARTAMENTO --
DELIMITER $$
CREATE FUNCTION fnc_pedidos (codigo_servico INT)
RETURNS VARCHAR(150)
READS SQL DATA /* Teste */
    BEGIN
         DECLARE Quantidade VARCHAR(100);
		 DECLARE Valor_Total VARCHAR(100);
#        DECLARE valor_serv DECIMAL(10,2);
#        DECLARE valor_prod DECIMAL(10,2);
#    	 DECLARE valor_ingr DECIMAL(10,2);
        
		SELECT vlr_serv + vlr_prod + vlr_ingr
        INTO Valor_Total
		FROM servicos s JOIN produtos p JOIN ingressos i
		ON s.produtos_cod_prod = p.cod_prod AND s.ingressos_cod_ingr = i.cod_ingr
		WHERE s.cod_serv = codigo_servico;
		RETURN CONCAT (' Valor total R$: ' , Valor_Total);


    END $$
DELIMITER ;

/* Consulta para inserção de dados
SELECT * FROM produtos;
SELECT * FROM servicos;
SELECT * FROM ingressos;
*/


DROP FUNCTION IF EXISTS fnc_pedidos;
SELECT cinema.fnc_pedidos(106);


-- FUNCTION LOCALIZAR FUNCIONÁRIO PELA MATRÍCULA, RELACIONAR NACIONALIDADE E CONVERTER DATA DE NASCIMENTO --
DELIMITER $$ 
CREATE FUNCTION fnc_formata_data (matricula INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE dia_nome VARCHAR(10);
    DECLARE dia VARCHAR(2);
    DECLARE nome_mes VARCHAR(10);
    DECLARE ano VARCHAR(4);
    DECLARE nacionalidade VARCHAR(15);
    
		SELECT nac_func 'Naturalidade', DAYNAME(dt_nasc), DAY(dt_nasc), MONTHNAME(dt_nasc), YEAR(dt_nasc)
        INTO nacionalidade, dia_nome, dia, nome_mes, ano FROM 
        funcionarios
        WHERE mat_func = matricula;
        RETURN CONCAT(nacionalidade,', ', 'Data de Nascimento: ', dia_nome,', ', dia, ' de ', nome_mes,' de ', ano);

END $$
DELIMITER ;

DROP FUNCTION fnc_formata_data;
SELECT * FROM funcionarios;

