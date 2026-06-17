-- Active: 1781720889403@@matosso-bd-daduashdiodbaso.b.aivencloud.com@25794@atividade_16
use atividade_16;

-- 1. Criar banco de dados
CREATE DATABASE INDUSTRIA;

-- Usar o banco
USE INDUSTRIA;

-- 2 e 3. Criar tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    data_admissao DATE,
    salario DECIMAL(10,2),
    email VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(50),
    estado CHAR(2),
    status_funcionario VARCHAR(20)
);

-- 4. Inserir registros
INSERT INTO FUNCIONARIO
(nome, cargo, setor, data_admissao, salario, email, telefone, cidade, estado, status_funcionario)
VALUES
('João Silva', 'Analista de Sistemas', 'TI', '2022-03-15', 5500.00, 'joao@empresa.com', '48999990001', 'Florianópolis', 'SC', 'Ativo'),

('Maria Souza', 'Assistente Administrativo', 'Administrativo', '2021-08-10', 3200.00, 'maria@empresa.com', '48999990002', 'São José', 'SC', 'Ativo'),

('Carlos Lima', 'Engenheiro de Produção', 'Produção', '2020-05-20', 7800.00, 'carlos@empresa.com', '48999990003', 'Palhoça', 'SC', 'Ativo'),

('Ana Costa', 'Analista de RH', 'Recursos Humanos', '2023-01-12', 4500.00, 'ana@empresa.com', '48999990004', 'Florianópolis', 'SC', 'Ativo'),

('Pedro Santos', 'Supervisor de Produção', 'Produção', '2019-07-01', 8500.00, 'pedro@empresa.com', '48999990005', 'Biguaçu', 'SC', 'Ativo');

-- 5. Criar VIEW
CREATE VIEW VW_FUNCIONARIOS AS
SELECT
    nome,
    cargo,
    setor
FROM FUNCIONARIO;

-- 6. Consultas na VIEW usando WHERE

-- Funcionários do setor TI
SELECT *
FROM VW_FUNCIONARIOS
WHERE setor = 'TI';

-- Funcionários do setor Produção
SELECT *
FROM VW_FUNCIONARIOS
WHERE setor = 'Produção';

-- 7. Listar funcionários de um setor específico
SELECT *
FROM VW_FUNCIONARIOS
WHERE setor = 'Produção';

-- 8. Listar funcionários cujo cargo contenha uma palavra-chave
SELECT *
FROM VW_FUNCIONARIOS
WHERE cargo LIKE '%Analista%';

-- 9. Exibir todos os dados da VIEW
SELECT *
FROM VW_FUNCIONARIOS;