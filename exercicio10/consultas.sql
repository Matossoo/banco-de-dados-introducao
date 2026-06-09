-- 1. Liste o nome e a cidade de todos os hospitais cadastrados.
SELECT nome, cidade
FROM hospitais;

-- 2. Exiba o nome, CRM e salário de todos os médicos.
SELECT nome, crm, salario
FROM medicos;

-- 3. Liste os pacientes cadastrados com seu tipo sanguíneo.
SELECT nome, tipo_sanguineo
FROM pacientes;

-- 4. Exiba os medicamentos com estoque inferior a 50 unidades.
SELECT nome, estoque
FROM medicamentos
WHERE estoque < 50;

-- 5. Liste os pacientes que possuem alguma alergia registrada.
SELECT nome, alergia
FROM pacientes
WHERE alergia IS NOT NULL;

-- 6. Exiba as consultas realizadas após uma data informada pelo professor.
SELECT *
FROM consultas
WHERE data_consulta > '2026-01-01';

-- 7. Liste os exames realizados em um período informado pelo professor.
SELECT *
FROM exames
WHERE data_exame BETWEEN '2026-01-01' AND '2026-12-31';

-- 8. Exiba os funcionários cujo salário esteja entre R$ 2.500,00 e R$ 6.000,00.
SELECT nome, salario
FROM funcionarios
WHERE salario BETWEEN 2500 AND 6000;

-- 9. Liste os quartos que estão com status "Disponível".
SELECT numero_quarto, status
FROM quartos
WHERE status = 'Disponível';

-- 10. Exiba os pagamentos realizados utilizando uma forma de pagamento informada pelo professor.
SELECT *
FROM pagamentos
WHERE forma_pagamento = 'Cartão';

-- 11. Apresente a quantidade total de pacientes cadastrados.
SELECT COUNT(*) AS total_pacientes
FROM pacientes;

-- 12. Exiba o valor médio das consultas realizadas.
SELECT AVG(valor_consulta) AS media_consultas
FROM consultas;

-- 13. Apresente o menor valor de consulta registrado no sistema.
SELECT MIN(valor_consulta) AS menor_consulta
FROM consultas;

-- 14. Exiba a quantidade de médicos cadastrados por especialidade.
SELECT especialidade, COUNT(*) AS quantidade_medicos
FROM medicos
GROUP BY especialidade;

-- 15. Apresente a quantidade de funcionários cadastrados por setor.
SELECT setor, COUNT(*) AS quantidade_funcionarios
FROM funcionarios
GROUP BY setor;

-- 16. Liste o nome dos médicos e o nome de suas respectivas especialidades.
SELECT m.nome AS medico, e.nome_especialidade
FROM medicos m
INNER JOIN especialidades e
ON m.id_especialidade = e.id_especialidade;

-- 17. Exiba o nome dos funcionários e o nome do hospital em que trabalham.
SELECT f.nome AS funcionario, h.nome AS hospital
FROM funcionarios f
INNER JOIN hospitais h
ON f.id_hospital = h.id_hospital;

-- 18. Liste o nome dos pacientes e as datas de suas consultas.
SELECT p.nome AS paciente, c.data_consulta
FROM pacientes p
INNER JOIN consultas c
ON p.id_paciente = c.id_paciente;

-- 19. Exiba o(s) medicamento(s) com o maior preço cadastrado.
SELECT nome, preco
FROM medicamentos
WHERE preco = (
    SELECT MAX(preco)
    FROM medicamentos
);

-- 20. Liste os médicos cujo salário seja superior ao salário médio dos médicos cadastrados.
SELECT nome, salario
FROM medicos
WHERE salario > (
    SELECT AVG(salario)
    FROM medicos
);