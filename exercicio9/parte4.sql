-- GROUP BY

SELECT id_medico,
COUNT(*) total_consultas
FROM Consultas
GROUP BY id_medico;

SELECT id_paciente,
COUNT(*) total_exames
FROM Exames
GROUP BY id_paciente;

SELECT cargo,
AVG(salario)
FROM Funcionarios
GROUP BY cargo;

SELECT id_hospital,
COUNT(*) total_medicos
FROM Medicos
GROUP BY id_hospital;

SELECT id_convenio,
COUNT(*) pacientes
FROM PacienteConvenio
GROUP BY id_convenio;


-- HAVING

SELECT id_medico,
COUNT(*) total
FROM Consultas
GROUP BY id_medico
HAVING COUNT(*) > 1;

SELECT cargo,
AVG(salario)
FROM Funcionarios
GROUP BY cargo
HAVING AVG(salario) > 3000;

SELECT id_hospital,
COUNT(*) total
FROM Medicos
GROUP BY id_hospital
HAVING COUNT(*) > 1;


-- JOINS

SELECT p.nome,
c.data_consulta
FROM Pacientes p
JOIN Consultas c
ON p.id_paciente=c.id_paciente;

SELECT m.nome,
e.nome
FROM Medicos m
JOIN Especialidades e
ON m.id_especialidade=e.id_especialidade;

SELECT p.nome,
cv.nome
FROM Pacientes p
JOIN PacienteConvenio pc
ON p.id_paciente=pc.id_paciente
JOIN Convenios cv
ON pc.id_convenio=cv.id_convenio;

SELECT c.id_consulta,
p.nome,
m.nome
FROM Consultas c
JOIN Pacientes p
ON c.id_paciente=p.id_paciente
JOIN Medicos m
ON c.id_medico=m.id_medico;

SELECT i.id_internacao,
p.nome,
q.numero
FROM Internacoes i
JOIN Pacientes p
ON i.id_paciente=p.id_paciente
JOIN Quartos q
ON i.id_quarto=q.id_quarto;


-- SUBQUERIES

SELECT *
FROM Medicos
WHERE salario =
(
SELECT MAX(salario)
FROM Medicos
);

SELECT *
FROM Funcionarios
WHERE salario =
(
SELECT MAX(salario)
FROM Funcionarios
);

SELECT *
FROM Pacientes
WHERE id_paciente IN
(
SELECT id_paciente
FROM Consultas
);

SELECT *
FROM Medicamentos
WHERE estoque <
(
SELECT AVG(estoque)
FROM Medicamentos
);

SELECT *
FROM Consultas
WHERE valor >
(
SELECT AVG(valor)
FROM Consultas
);