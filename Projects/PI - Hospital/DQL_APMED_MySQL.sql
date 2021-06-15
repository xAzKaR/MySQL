/* DQL - Data Query Language |
Linguagem de Consulta de Dados */

USE apmed2; # Comando para a utilização do Banco de Dados

# Comando DQL para filtragem em ordem alfabética dos hospitais cadastrados
SELECT * FROM hospital ORDER BY raz_hosp ASC;

# Comando DQL para filtragem em ordem decrescente os médicos cadastrados
SELECT * FROM medico ORDER BY nasc_med DESC;

# Comando DQL para agrupar os funcionários alocados em setores
SELECT * FROM funcionario GROUP BY setor_id_setor;

# Comando DQL para mostrar todas as colunas da tabela
SELECT * FROM convenio;

# Comando DQL para filtragem dos pacientes que possuem convênio
SELECT * FROM paciente ORDER BY convenio_id_conv ASC;

# Comando DQL para filtrar o atendimento por prioridade
SELECT * FROM atendimento WHERE priori_atend LIKE '%Alta%';

# Comando DQL para mostrar todas as colunas da tabela
SELECT * FROM consulta;

# Comando DQL para mostrar o valor total da coluna de preços da tabela pagamento
SELECT SUM(preco_pgto) FROM pagamento;

# Comando DQL para busca do comprovante de um paciente específico
SELECT * FROM comprovante WHERE consulta_paciente_id_pac = 1;