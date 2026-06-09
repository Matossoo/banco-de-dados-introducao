-- =========================================
-- INSERTS ALUNOS
-- =========================================

INSERT INTO alunos (nome, idade, cidade) VALUES
('Ana', 18, 'São Paulo'),
('Bruno', 22, 'Curitiba'),
('Carlos', 20, 'Florianópolis'),
('Daniela', 25, 'São Paulo'),
('Eduardo', 19, 'Curitiba'),
('Fernanda', 21, 'Rio de Janeiro'),
('Gabriel', 24, 'Porto Alegre'),
('Helena', 18, 'Curitiba'),
('Igor', 27, 'São Paulo'),
('Juliana', 23, 'Florianópolis');

-- =========================================
-- INSERTS CURSOS
-- =========================================

INSERT INTO cursos (nome_curso, carga_horaria) VALUES
('Python', 60),
('Java', 80),
('Banco de Dados', 70),
('Redes', 50),
('C++', 90),
('JavaScript', 40);

-- =========================================
-- INSERTS MATRICULAS
-- =========================================

INSERT INTO matriculas (id_aluno, id_curso, nota, faltas) VALUES
(1, 1, 8.5, 2),
(1, 3, 7.0, 5),

(2, 2, 9.0, 1),
(2, 5, 6.5, 7),

(3, 1, 5.5, 10),
(3, 4, 7.8, 3),

(4, 3, 9.5, 0),
(4, 5, 8.8, 2),

(5, 2, 6.0, 8),

(6, 6, 7.2, 4),
(6, 1, 8.0, 1),

(7, 5, 9.8, 0),
(7, 3, 8.7, 2),

(8, 4, 5.0, 9),

(9, 2, 4.5, 12),
(9, 5, 7.5, 5),

(10, 6, 8.9, 1),
(10, 1, 9.1, 0);

-- =========================================
-- CONSULTAS PARA TESTAR O BANCO
-- =========================================

SELECT * FROM alunos;

SELECT * FROM cursos;

SELECT * FROM matriculas;

-- =========================================
-- JOIN COMPLETO PARA VISUALIZAR MELHOR
-- =========================================

SELECT
    a.nome,
    a.idade,
    a.cidade,
    c.nome_curso,
    c.carga_horaria,
    m.nota,
    m.faltas
FROM matriculas m
INNER JOIN alunos a
    ON a.id_aluno = m.id_aluno
INNER JOIN cursos c
    ON c.id_curso = m.id_curso;
