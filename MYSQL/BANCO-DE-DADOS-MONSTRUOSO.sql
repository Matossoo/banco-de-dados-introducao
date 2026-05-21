CREATE DATABASE EscolaDB;
USE EscolaDB;

CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    idade INT
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    nota DECIMAL(4,2),
    faltas INT,
FOREIGN KEY (id_aluno)REFERENCES Alunos(id_aluno),
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso)
);
INSERT INTO Alunos (nome, cidade, idade)VALUES
('Carlos','São Paulo',18),
('Mariana','Curitiba',22),
('João','Florianópolis',19),
('Fernanda','São Paulo',25),
('Lucas','Rio de Janeiro',20),
('Patricia','Curitiba',21),
('Ana','Porto Alegre',23),
('Bruno','São Paulo',24);

INSERT INTO Cursos (nome_curso, carga_horaria)VALUES
('Python',40),
('Banco de Dados',60),
('Java',80),
('Data Science',100);

INSERT INTO Matriculas (id_aluno, id_curso, nota, faltas)VALUES
(1,1,8.5,2),
(1,2,7.0,5),
(2,1,9.5,1),
(2,4,8.0,4),
(3,2,6.5,6),
(3,3,7.5,3),
(4,4,9.0,0),
(5,1,5.5,10),
(5,2,6.0,7),
(6,3,8.5,2),
(7,4,7.0,5),
(8,2,9.5,1);

-- Questões — SELECT, FROM, WHERE e GROUP BY

select * from Alunos;

select nome from Alunos;

select * from Cursos;

select nome from Alunos
where cidade = 'São Paulo';

select nome from Alunos
where idade >20;

select nome_curso from Cursos
where carga_horaria > 50;

select nome from Alunos
where idade between 18 and 22;

select nome from Alunos
where cidade = 'Curitiba';

select nome from Alunos
where idade < 21;

select * from Matriculas;

-- Intermediárias

select Alunos.nome, nota from Alunos
join Matriculas on Alunos.id_aluno = Matriculas.id_aluno
where nota > 8;

select nome, faltas from Alunos
join Matriculas on Alunos.id_aluno = Matriculas.id_aluno
where faltas> 5;

select nome_curso, carga_horaria from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
where carga_horaria = 80;

select nome, cidade from Alunos
where cidade <> 'São Paulo';

select nome from Alunos
where nome like 'A%';

select nome from Alunos
where nome like '%A';

select nome_curso from Cursos
where nome_curso like '%Dados%';

select id_matricula, nota from Matriculas
where nota between 7 and 9;

select nome, idade from Alunos
where idade = 20;

select nome_curso, carga_horaria from Cursos
where carga_horaria <= 60;
 
-- Questões com GROUP BY

select cidade, count(nome) as Quantidade
from Alunos
group by cidade;

select cidade, avg(idade) as média_idade
from Alunos
group by cidade;

select nome_curso, count(Matriculas.id_curso) as Quantidade_matriculas
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso;

select nome_curso, avg(nota) as Media_nota
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso;

select  nome_curso, sum(faltas) as Quantidade_faltas
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso;

select  nome_curso, max(nota) as Maior_nota
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso;

select  nome_curso, min(nota) as Menor_nota
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso;

select  nome, sum(faltas) as Total_faltas
from Alunos
join Matriculas on Alunos.id_aluno = Matriculas.id_aluno
group by nome;

select  nome, avg(nota) as Media_nota
from Alunos
join Matriculas on Alunos.id_aluno = Matriculas.id_aluno
group by nome;

select  nome, count(idade) as Faixa_etaria
from Alunos
group by nome;

-- Questões Avançadas — HAVING e ORDER BY

select cidade, count(nome) from Alunos
group by cidade
having count(nome) > 2
order by cidade desc;

select  nome_curso, avg(nota) as media_nota
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso
having avg(nota) > 8
order by media_nota desc;

select  nome_curso, count(id_matricula) as Quantidade_matricula
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso
having count(id_matricula) > 2
order by Quantidade_matricula desc;

select  nome, sum(faltas) as soma_faltas
from Alunos
join Matriculas on Alunos.id_aluno = Matriculas.id_aluno
group by nome
having sum(faltas) > 5
order by soma_faltas desc;

select  nome_curso, min(nota) as menor_nota
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso
having min(nota) > 6
order by menor_nota desc;

select nome_curso, carga_horaria from Cursos
order by carga_horaria desc;

select nome, idade from Alunos
order by idade desc;

select  nome_curso, avg(nota) as media_nota
from Cursos
join Matriculas on Cursos.id_curso = Matriculas.id_curso
group by nome_curso
order by media_nota desc;

select cidade, count(nome) as quantidade_alunos
from Alunos
group by cidade
order by quantidade_alunos desc;

select  nome, avg(nota) as media_nota
from Alunos
join Matriculas on Alunos.id_aluno = Matriculas.id_aluno
group by nome
having min(nota) > 7
order by media_nota desc;







