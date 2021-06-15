/* DML - Data Manipulation Language |
Linguagem de Manipulação de Dados */

# Script de seleção, inserção, atualização e remoção de dados

/* INSERT / UPDATE / DELETE */

#Comando de utilização do banco de dados
USE apmed2;

/* Inserção de dados na tabela hospital */
INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('02.560.878/0001-07', 'HOSPITAL ANCHIETA - LTDA', '72115-700', 
'Área Especial 8, 9, 10, St. C Norte Qnc - Taguatinga, Brasília', '(61) 3353-9000', 
'relacionamento@hospitalanchieta.com.br');

INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('03.333.222/1111-06', 'HOSPITAL SANTA MARTA', '78326-928', 
'Área Especial 14, Pistão Sul - Taguatinga, Brasília', '(61) 2222-8888', 
'santamarta@hospital.com.br');

INSERT INTO hospital (cnpj_hosp, raz_hosp, cep_hosp, end_hosp, tel_hosp, email_hosp)
VALUES ('04.444.444/1111-14', 'HOSPITAL DE BASE', '78432-832', 
'St. Sul - Asa Sul, Brasília', '(61) 7777-8888', 
'basehospital@hospital.com.br');

/* Inserção de dados na tabela setor */
INSERT INTO setor (espec_setor, cat_setor, cap_setor, hospital_id_hosp)
VALUES ('Ortopedia', 'Pediatria', 1, 1);

INSERT INTO setor (espec_setor, cat_setor, cap_setor, hospital_id_hosp)
VALUES ('Cirurgia', 'Geriatria', 3, 2);

INSERT INTO setor (espec_setor, cat_setor, cap_setor, hospital_id_hosp)
VALUES ('UTI', 'COVID-19', 10, 3);

/* Inserção de dados na tabela departamento */
INSERT INTO departamento (cat_dep, cap_dep, ramal_dep, hospital_id_hosp)
VALUES ('Administrativo', 10, '8877', 1);

INSERT INTO departamento (cat_dep, cap_dep, ramal_dep, hospital_id_hosp)
VALUES ('Almoxarifado', 5, '8855', 2);

INSERT INTO departamento (cat_dep, cap_dep, ramal_dep, hospital_id_hosp)
VALUES ('RH', 12, '8880', 3);

/* Inserção de dados na tabela médico */
INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, 
end_med, espec_med, tel_med, email_med, setor_id_setor, setor_hospital_id_hosp)
VALUES ('1234', '000.998.727-89', 'Leonardo De Amaral', 19900312, 'Brasileiro', 'M', 
'QNN 14 Lote 3 Apto 9', 'Neurologia', '(61) 9 9999-0909', 'leandro@medico.com', 1, 1);

INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, 
end_med, espec_med, tel_med, email_med, setor_id_setor, setor_hospital_id_hosp)
VALUES ('5678', '000.555.321-20', 'Sabrina Ferreira', 20001014, 'Indiano', 'F', 
'Quadra Sul da Asa Norte', 'Ortopedia', '(61) 8 8888-8888', 'fernanda@medica.com', 2, 2);

INSERT INTO medico (crm_med, cpf_med, nome_med, nasc_med, nac_med, sexo_med, 
end_med, espec_med, tel_med, email_med, setor_id_setor, setor_hospital_id_hosp)
VALUES ('9101', '000.014.673-90', 'Juliano Tobias', 19950522, 'Mexicano', 'M', 
'Quadra Norte da Asa Sul', 'Pediatria', '(61) 7 7777-7777', 'juliano@medico.com', 3, 3);

/* Inserção de dados na tabela funcionário */
INSERT INTO funcionario (cpf_func, nome_func, nasc_func, nac_func,
sexo_func, cargo_func, end_func, tel_func, email_func, departamento_id_dep,
departamento_hospital_id_hosp)
VALUES ('080.888.999-79', 'Chaves Do Oito', 20000514, 'Brasileiro', 'M',
'Atendente', 'QNM 36 Posto Norte', '(61) 9 9999-8888', 'chaves@funcionario.com', 1, 1);

INSERT INTO funcionario (cpf_func, nome_func, nasc_func, nac_func,
sexo_func, cargo_func, end_func, tel_func, email_func, departamento_id_dep,
departamento_hospital_id_hosp)
VALUES ('024.666.321-11', 'Chiquinha Da Vila', 19911230, 'Austríaco', 'F',
'Atendente', 'QNM 40 Posto Sul', '(61) 2 2222-1234', 'chiquinha@funcionario.com', 2, 2);

INSERT INTO funcionario (cpf_func, nome_func, nasc_func, nac_func,
sexo_func, cargo_func, end_func, tel_func, email_func, departamento_id_dep,
departamento_hospital_id_hosp)
VALUES ('812.827.947-03', 'Bruxa Do Setentaeum', 19980305, 'Chinês', 'F',
'Atendente', 'QNM 42 Posto Nordeste', '(61) 5 8932-9021', 'bruxa@funcionario.com', 3, 3);

INSERT INTO funcionario (corem_func, cpf_func, nome_func, nasc_func, nac_func,
sexo_func, cargo_func, end_func, tel_func, email_func, setor_id_setor,
setor_hospital_id_hosp)
VALUES ('321-5', '267.983.893-63', 'Kika Uma Vez Kika De Novo', 19900612, 'Americano', 'M', 
'Enfermeiro', 'Acapulco', '(61) 6 6666-5555', 'kiko@enfermeiro.com', 1, 1);

INSERT INTO funcionario (corem_func, cpf_func, nome_func, nasc_func, nac_func,
sexo_func, cargo_func, end_func, tel_func, email_func,
setor_id_setor, setor_hospital_id_hosp)
VALUES ('123-4', '627.873.092-38', 'Seu Madruga', 19850201, 'Indiano', 'M',
'Enfermeiro', 'Cidade do Méxio, Rua principal', '(61) 2 2222-5555', 'madruga@enfermeiro.com', 2, 2);

/* Inserção de dados na tabela convênio */
INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('01.782.999/7777-08', 'UNIMED', '(61) 3777-0000', 'unimed@convenio.com');

INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('03.999.222/1111-02', 'Notre Dame', '(61) 9999-8888', 'notredame@convenio.com');

INSERT INTO convenio (cnpj_conv, raz_conv, tel_conv, email_conv)
VALUES ('04.222.555/2436-09', 'Salutte', '(61) 4441-3333', 'salutte@convenio.com');

/* Inserção de dados na tabela paciente */
INSERT INTO paciente (cpf_pac, nome_pac, nasc_pac, nac_pac, sexo_pac,
ocup_pac, end_pac, tel_pac, email_pac, setor_id_setor, setor_hospital_id_hosp, convenio_id_conv)
VALUES ('091.091.928-09', 'Laura Da Silva', 20031223, 'Brasileiro', 'F', 'Auxiliar Administrativo', 'Quadra 30 - Asa Sul',
'(61) 9 9999-8888', 'laura@hotmail.com', 1, 1, 1);

INSERT INTO paciente (cpf_pac, nome_pac, nasc_pac, nac_pac, sexo_pac,
ocup_pac, end_pac, tel_pac, email_pac, setor_id_setor, setor_hospital_id_hosp)
VALUES ('444.122.782-02', 'Arthur Do Bigbrother', 20000212, 'Americano', 'M', 'Influencer', 'Quadra 40 - Guará',
'(61) 1 1111-6666', 'arthur@hotmail.com', 2, 2);

INSERT INTO paciente (cpf_pac, nome_pac, nasc_pac, nac_pac, sexo_pac,
ocup_pac, end_pac, tel_pac, email_pac, setor_id_setor, setor_hospital_id_hosp)
VALUES ('432.432.234-12', 'Juliette', 19900918, 'Mongol', 'F', 'Maquiadora', 'Quadra 10 - Taguatinga',
'(61) 3 3333-2222', 'juliette@hotmail.com', 3, 3);

/* Inserção de dados na tabela atendimento */
INSERT INTO atendimento (desc_atend, data_atend, hora_atend, priori_atend, paciente_id_pac,
funcionario_id_func, funcionario_departamento_id_dep, funcionario_departamento_hospital_id_hosp)
VALUES ('Paciente atendido por telefone e encaminhado ao hospital mais próximo',
20210101, 000000, 'Alta', 1, 1, 1, 1);

INSERT INTO atendimento (desc_atend, data_atend, hora_atend, priori_atend, paciente_id_pac,
funcionario_id_func, funcionario_departamento_id_dep, funcionario_departamento_hospital_id_hosp)
VALUES ('Paciente atendido por telefone e encaminhado ao hospital mais próximo',
20210506, 080000, 'Normal', 2, 4, 2, 2);

INSERT INTO atendimento (desc_atend, data_atend, hora_atend, priori_atend, paciente_id_pac,
funcionario_id_func, funcionario_departamento_id_dep, funcionario_departamento_hospital_id_hosp)
VALUES ('Paciente atendido por telefone e encaminhado ao hospital mais próximo',
20210518, 160000, 'Baixa', 3, 5, 2, 3);

/* Inserção de dados na tabela documentação */
INSERT INTO documentacao (tipo_doc, desc_doc, data_doc, hora_doc)
VALUES ('Relatório', 'Relatório sobre consulta', 20210504, 120000);

INSERT INTO documentacao (tipo_doc, desc_doc, data_doc, hora_doc)
VALUES ('Diagnóstico', 'Diagnóstico do paciente', 20210304, 000000);

INSERT INTO documentacao (tipo_doc, desc_doc, data_doc, hora_doc)
VALUES ('Prontuário', 'Prontuário de consulta', 20210504, 123000);

/* Inserção de dados na tabela consulta */
INSERT INTO consulta (paciente_id_pac, medico_id_med, documentacao_id_doc,
paciente_setor_id_setor, paciente_setor_hospital_id_hosp)
VALUES (1, 1, 1, 1, 1);

INSERT INTO consulta (paciente_id_pac, medico_id_med, documentacao_id_doc,
paciente_setor_id_setor, paciente_setor_hospital_id_hosp)
VALUES (2, 2, 2, 2, 2);

INSERT INTO consulta (paciente_id_pac, medico_id_med, documentacao_id_doc,
paciente_setor_id_setor, paciente_setor_hospital_id_hosp)
VALUES (3, 3, 3, 3, 3);

/* Inserção de dados na tabela pagamento */
INSERT INTO pagamento (desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto)
VALUES ('Pagamento por convênio', 20210516, 160000, 0, 0, 0, 0, 1);

INSERT INTO pagamento (desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto)
VALUES ('Pagamento em dinheiro', 20210314, 120000, 175.00, 0, 0, 1, 0);

INSERT INTO pagamento (desc_pgto, data_pgto, hora_pgto, preco_pgto, cred_pgto, deb_pgto, din_pgto, conv_pgto)
VALUES ('Pagamento em débito', 20211212, 140000, 85.00, 0, 1, 0, 0);

/* Inserção de dados na tabela comprovante */
INSERT INTO comprovante (desc_comp, data_comp, hora_comp, funcionario_id_func, pagamento_id_pgto, consulta_id_cons,
paciente_convenio_id_conv, consulta_paciente_id_pac, consulta_medico_id_med,
consulta_paciente_setor_id_setor, consulta_paciente_setor_hospital_id_hosp)
VALUES ('Documento para comprovação fiscal', 20210504, 120000, 1, 1, 1, 1, 1, 1, 1, 1);

INSERT INTO comprovante (desc_comp, data_comp, hora_comp, funcionario_id_func, pagamento_id_pgto, consulta_id_cons,
consulta_paciente_id_pac, consulta_medico_id_med, consulta_paciente_setor_id_setor, consulta_paciente_setor_hospital_id_hosp)
VALUES ('Documento para comprovação fiscal', 20211212, 165500, 2, 2, 2, 2, 2, 2, 2);

INSERT INTO comprovante (desc_comp, data_comp, hora_comp, funcionario_id_func, pagamento_id_pgto, consulta_id_cons,
consulta_paciente_id_pac, consulta_medico_id_med, consulta_paciente_setor_id_setor, consulta_paciente_setor_hospital_id_hosp)
VALUES ('Documento para comprovação fiscal', 20210504, 120000, 3, 3, 3, 3, 3, 3, 3);