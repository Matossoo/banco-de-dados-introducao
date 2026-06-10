USE HospitalDB;

INSERT INTO Hospitais(nome,cidade,estado,endereco)
VALUES
('Hospital Central','São Paulo','SP','Av Central 100'),
('Hospital Vida','Campinas','SP','Rua das Flores 200');

INSERT INTO Especialidades(nome)
VALUES
('Cardiologia'),
('Pediatria'),
('Ortopedia'),
('Neurologia');

INSERT INTO Medicos
(nome,crm,telefone,email,salario,id_especialidade,id_hospital)
VALUES
('Carlos Silva','CRM1001','11999999999','carlos@email.com',15000,1,1),
('Ana Souza','CRM1002','11888888888','ana@email.com',18000,2,1),
('Marcos Lima','CRM1003','11777777777','marcos@email.com',17000,3,2);

INSERT INTO Pacientes
(nome,cpf,data_nascimento,telefone,email,endereco,tipo_sanguineo,alergias)
VALUES
('João Pedro','12345678901','1990-05-10','11911111111','joao@email.com','Rua A','O+','Nenhuma'),
('Maria Clara','12345678902','1985-02-20','11922222222','maria@email.com','Rua B','A+','Dipirona'),
('Lucas Santos','12345678903','2000-10-15','11933333333','lucas@email.com','Rua C','B+','Nenhuma');

INSERT INTO Convenios(nome,telefone,cobertura)
VALUES
('Unimed','111111111','Completa'),
('Bradesco Saúde','222222222','Parcial');

INSERT INTO PacienteConvenio
(id_paciente,id_convenio,numero_carteira)
VALUES
(1,1,'UNI123'),
(2,2,'BRA456');

INSERT INTO Consultas
(data_consulta,diagnostico,observacoes,valor,id_paciente,id_medico)
VALUES
('2025-01-10 10:00:00','Gripe','Repouso',200,1,2),
('2025-01-12 09:00:00','Fratura','Raio X',500,2,3),
('2025-01-15 14:00:00','Checkup','Normal',150,3,1);

INSERT INTO Medicamentos
(nome,fabricante,estoque,preco)
VALUES
('Paracetamol','EMS',100,15),
('Amoxicilina','Medley',50,25),
('Ibuprofeno','Neo Quimica',80,18);

INSERT INTO Receitas
(id_consulta,data_receita,observacoes)
VALUES
(1,'2025-01-10','Tomar por 5 dias'),
(2,'2025-01-12','Uso contínuo');

INSERT INTO ReceitaMedicamento
(id_receita,id_medicamento,dosagem,frequencia)
VALUES
(1,1,'500mg','8h'),
(2,2,'1 comprimido','12h');

INSERT INTO Exames
(nome,resultado,data_exame,id_paciente,id_medico)
VALUES
('Hemograma','Normal','2025-01-11',1,2),
('Raio X','Fratura identificada','2025-01-12',2,3);

INSERT INTO Quartos
(numero,tipo,capacidade,status_quarto,id_hospital)
VALUES
('101','Enfermaria',2,'Livre',1),
('102','UTI',1,'Ocupado',1);

INSERT INTO Internacoes
(data_entrada,data_saida,motivo,id_paciente,id_quarto)
VALUES
('2025-01-12 08:00:00','2025-01-18 12:00:00','Fratura',2,2);

INSERT INTO Setores(nome)
VALUES
('Recepção'),
('Financeiro'),
('Enfermagem');

INSERT INTO Funcionarios
(nome,cpf,cargo,salario,id_setor,id_hospital)
VALUES
('Pedro Alves','11111111111','Recepcionista',2500,1,1),
('Fernanda Lima','22222222222','Enfermeira',4500,3,1),
('José Carlos','33333333333','Analista Financeiro',5000,2,2);

INSERT INTO Pagamentos
(valor,data_pagamento,forma_pagamento,id_consulta)
VALUES
(200,'2025-01-10','PIX',1),
(500,'2025-01-12','Cartão',2);

INSERT INTO UsuariosSistema
(usuario,senha_hash,nivel_acesso)
VALUES
('admin','123hash','ADMIN'),
('atendente','456hash','USER');

INSERT INTO Logs
(acao,data_log,id_usuario)
VALUES
('Login realizado',NOW(),1),
('Consulta cadastrada',NOW(),2);