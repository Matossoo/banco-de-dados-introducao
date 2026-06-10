-- SELECT
SELECT * FROM Pacientes;
SELECT nome, telefone FROM Pacientes;
SELECT * FROM Medicos;
SELECT nome, crm FROM Medicos;
SELECT * FROM Consultas;
SELECT * FROM Exames;
SELECT * FROM Funcionarios;

-- WHERE
SELECT * FROM Pacientes
WHERE tipo_sanguineo='O+';

SELECT * FROM Medicos
WHERE salario > 16000;

SELECT * FROM Consultas
WHERE valor > 200;

SELECT * FROM Medicamentos
WHERE estoque < 60;

SELECT * FROM Internacoes
WHERE data_saida IS NULL;

-- ORDER BY
SELECT * FROM Pacientes
ORDER BY nome;

SELECT * FROM Medicos
ORDER BY salario DESC;

SELECT * FROM Consultas
ORDER BY data_consulta DESC;

SELECT * FROM Funcionarios
ORDER BY cargo,nome;

SELECT * FROM Medicamentos
ORDER BY estoque ASC;