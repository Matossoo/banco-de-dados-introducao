
-- =========================================
-- CRIAÇÃO DO BANCO DE DADOS
-- =========================================

CREATE DATABASE escola_subquery;
USE escola_subquery;

-- =========================================
-- TABELA ALUNOS
-- =========================================

CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT,
    cidade VARCHAR(100)
);

-- =========================================
-- TABELA CURSOS
-- =========================================

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

-- =========================================
-- TABELA MATRICULAS
-- =========================================

CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    nota DECIMAL(4,2),
    faltas INT,

    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);