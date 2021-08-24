/* Modelo Físico - APMED */

/* DDL - Data Definition Language |
Linguagem de Definição de Dados */

/* CREATE / DROP */

/* Criação do Banco de Dados - APMED */
CREATE DATABASE IF NOT EXISTS apmed;

/* Comando para a utilização do banco de dados */
USE apmed;

/* Criação da Tabela: Hospital */
# CREATE TABLE hospital
CREATE TABLE IF NOT EXISTS hospital
(
id_hosp INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cnpj_hosp VARCHAR(25) NOT NULL,
raz_hosp VARCHAR(150) NOT NULL,
cep_hosp VARCHAR(15) NOT NULL,
end_hosp VARCHAR(150) NOT NULL,
tel_hosp VARCHAR(20) NULL,
email_hosp VARCHAR(100) NULL
);

/* Criação da Tabela: Setor */
# CREATE TABLE setor
CREATE TABLE IF NOT EXISTS setor
(
id_setor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
espec_setor VARCHAR(45) NOT NULL,
cat_setor VARCHAR(45) NOT NULL,
cap_setor INT NOT NULL,
hospital_id_hosp INT NOT NULL,
FOREIGN KEY (hospital_id_hosp) REFERENCES hospital (id_hosp)
);

/* Criação da Tabela: Departamento */
# CREATE TABLE departamento
CREATE TABLE IF NOT EXISTS departamento
(
id_dep INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cat_dep VARCHAR(45) NOT NULL,
cap_dep INT NOT NULL,
ramal_dep VARCHAR(20) NOT NULL,
hospital_id_hosp INT NOT NULL,
FOREIGN KEY (hospital_id_hosp) REFERENCES hospital (id_hosp)
);

/* Criação da Tabela: Médico */
# CREATE TABLE medico
CREATE TABLE IF NOT EXISTS medico
(
id_med INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
crm_med VARCHAR(15) NOT NULL,
cpf_med VARCHAR(20) NOT NULL,
nome_med VARCHAR(150) NOT NULL,
nasc_med DATE NOT NULL,
nac_med VARCHAR(45) NOT NULL,
sexo_med ENUM ('M', 'F', 'O') DEFAULT 'M',
end_med VARCHAR(150) NOT NULL,
espec_med VARCHAR(45) NOT NULL,
tel_med VARCHAR(20) NULL,
email_med VARCHAR(100) NULL,
setor_id_setor INT NOT NULL,
setor_hospital_id_hosp INT NOT NULL,
FOREIGN KEY (setor_id_setor) REFERENCES setor (id_setor),
FOREIGN KEY (setor_hospital_id_hosp) REFERENCES setor (hospital_id_hosp)
);

/* Criação de Tabela: Funcionário */
# CREATE TABLE funcionario
CREATE TABLE IF NOT EXISTS funcionario
(
id_func INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
corem_func VARCHAR(20) NULL,
cpf_func VARCHAR(20) NOT NULL,
nome_func VARCHAR(150) NOT NULL,
nasc_func DATE NOT NULL,
nac_func VARCHAR(45) NOT NULL,
sexo_func ENUM ('M', 'F', 'O') DEFAULT 'M',
cargo_func VARCHAR(45) NOT NULL,
end_func VARCHAR(150) NOT NULL,
tel_func VARCHAR(20) NULL,
email_func VARCHAR(100) NULL,
departamento_id_dep INT,
departamento_hospital_id_hosp INT,
setor_id_setor INT,
setor_hospital_id_hosp INT,
FOREIGN KEY (departamento_id_dep) REFERENCES departamento (id_dep),
FOREIGN KEY (departamento_hospital_id_hosp) REFERENCES departamento (hospital_id_hosp),
FOREIGN KEY (setor_id_setor) REFERENCES setor (id_setor),
FOREIGN KEY (setor_hospital_id_hosp) REFERENCES setor (hospital_id_hosp)
);

/* Criação da Tabela: Convênio */
# CREATE TABLE convenio
CREATE TABLE IF NOT EXISTS convenio
(
id_conv INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cnpj_conv VARCHAR(25) NOT NULL,
raz_conv VARCHAR(150) NOT NULL,
tel_conv VARCHAR(20) NULL,
email_conv VARCHAR(100) NULL
);

/* Criação de Tabela: Paciente */
# CREATE TABLE paciente
CREATE TABLE IF NOT EXISTS paciente
(
id_pac INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cpf_pac VARCHAR(20) NOT NULL,
nome_pac VARCHAR(150) NOT NULL,
nasc_pac DATE NOT NULL,
nac_pac VARCHAR(45) NOT NULL,
sexo_pac ENUM ('M', 'F', 'O') DEFAULT 'M',
ocup_pac VARCHAR(45) NOT NULL,
end_pac VARCHAR(150) NOT NULL,
tel_pac VARCHAR(20) NULL,
email_pac VARCHAR(100) NULL,
setor_id_setor INT NOT NULL,
setor_hospital_id_hosp INT NOT NULL,
convenio_id_conv INT NULL,
FOREIGN KEY (convenio_id_conv) REFERENCES convenio (id_conv),
FOREIGN KEY (setor_id_setor) REFERENCES setor (id_setor),
FOREIGN KEY (setor_hospital_id_hosp) REFERENCES setor (hospital_id_hosp)
);

/* Criação da Tabela: Atendimento */
# CREATE TABLE atendimento
CREATE TABLE IF NOT EXISTS atendimento
(
id_atend INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
desc_atend VARCHAR(900) NOT NULL,
data_atend DATE NOT NULL,
hora_atend TIME NOT NULL,
priori_atend VARCHAR(45) NOT NULL,
paciente_id_pac INT NOT NULL,
funcionario_id_func INT NOT NULL,
funcionario_departamento_id_dep INT,
funcionario_departamento_hospital_id_hosp INT,
FOREIGN KEY (paciente_id_pac) REFERENCES paciente (id_pac),
FOREIGN KEY (funcionario_id_func) REFERENCES funcionario (id_func),
FOREIGN KEY (funcionario_departamento_id_dep) REFERENCES funcionario (departamento_id_dep),
FOREIGN KEY (funcionario_departamento_hospital_id_hosp) REFERENCES funcionario (departamento_hospital_id_hosp)
);

/* Criação da Tabela: Documentação */
# CREATE TABLE documentacao
CREATE TABLE IF NOT EXISTS documentacao
(
id_doc INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipo_doc VARCHAR(50) NOT NULL,
desc_doc VARCHAR(900) NOT NULL,
data_doc DATE NOT NULL,
hora_doc TIME NOT NULL
);

/* Criação da Tabela Associativa: Consulta */
# CREATE TABLE consulta
CREATE TABLE IF NOT EXISTS consulta
(
id_cons INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
paciente_id_pac INT,
medico_id_med INT,
documentacao_id_doc INT,
paciente_setor_id_setor INT,
paciente_setor_hospital_id_hosp INT,
FOREIGN KEY (paciente_id_pac) REFERENCES paciente (id_pac),
FOREIGN KEY (medico_id_med) REFERENCES medico (id_med),
FOREIGN KEY (documentacao_id_doc) REFERENCES documentacao (id_doc),
FOREIGN KEY (paciente_setor_id_setor) REFERENCES paciente (setor_id_setor),
FOREIGN KEY (paciente_setor_hospital_id_hosp) REFERENCES paciente (setor_hospital_id_hosp)
);

/* Criação da Tabela: Pagamento */
# CREATE TABLE pagamento
CREATE TABLE IF NOT EXISTS pagamento
(
id_pgto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
desc_pgto VARCHAR(100) NOT NULL,
data_pgto DATE NOT NULL,
hora_pgto TIME NOT NULL,
preco_pgto FLOAT NULL,
cred_pgto TINYINT NULL,
deb_pgto TINYINT NULL,
din_pgto TINYINT NULL,
conv_pgto TINYINT NULL
);

/* Criação da Tabela Associativa: Comprovante */
# CREATE TABLE comprovante
CREATE TABLE IF NOT EXISTS comprovante
(
id_comp INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
desc_comp VARCHAR(100) NOT NULL,
data_comp DATE NOT NULL,
hora_comp TIME NOT NULL,
funcionario_id_func INT NOT NULL,
pagamento_id_pgto INT NOT NULL,
consulta_id_cons INT NOT NULL,
paciente_convenio_id_conv INT NULL,
consulta_paciente_id_pac INT NOT NULL,
consulta_medico_id_med INT NOT NULL,
consulta_paciente_setor_id_setor INT NOT NULL,
consulta_paciente_setor_hospital_id_hosp INT NOT NULL,
FOREIGN KEY (funcionario_id_func) REFERENCES funcionario (id_func),
FOREIGN KEY (pagamento_id_pgto) REFERENCES pagamento (id_pgto),
FOREIGN KEY (consulta_id_cons) REFERENCES consulta (id_cons),
FOREIGN KEY (paciente_convenio_id_conv) REFERENCES paciente (convenio_id_conv),
FOREIGN KEY (consulta_paciente_id_pac) REFERENCES consulta (paciente_id_pac),
FOREIGN KEY (consulta_medico_id_med) REFERENCES consulta (medico_id_med),
FOREIGN KEY (consulta_paciente_setor_id_setor) REFERENCES consulta (paciente_setor_id_setor),
FOREIGN KEY (consulta_paciente_setor_hospital_id_hosp) REFERENCES consulta (paciente_setor_hospital_id_hosp)
);