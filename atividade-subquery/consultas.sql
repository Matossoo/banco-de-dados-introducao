# QUESTÕES BÁSICAS — Subquery como filtro


-- 1
SELECT *
FROM alunos
WHERE idade = (
    SELECT MAX(idade)
    FROM alunos
);

-- 2
SELECT *
FROM alunos
WHERE idade < (
    SELECT AVG(idade)
    FROM alunos
);

-- 3
SELECT *
FROM cursos
WHERE carga_horaria = (
    SELECT MAX(carga_horaria)
    FROM cursos
);

-- 4
SELECT a.nome, m.nota
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
WHERE m.nota = (
    SELECT MAX(nota)
    FROM matriculas
);

-- 5
SELECT a.nome, m.nota
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
WHERE m.nota < (
    SELECT AVG(nota)
    FROM matriculas
);

-- 6
SELECT *
FROM cursos
WHERE carga_horaria > (
    SELECT AVG(carga_horaria)
    FROM cursos
);

-- 7
SELECT *
FROM alunos
WHERE idade = (
    SELECT MIN(idade)
    FROM alunos
);

-- 8
SELECT *
FROM matriculas
WHERE faltas > (
    SELECT AVG(faltas)
    FROM matriculas
);

-- 9
SELECT *
FROM cursos
WHERE carga_horaria <> (
    SELECT MAX(carga_horaria)
    FROM cursos
);

-- 10
SELECT a.nome, m.nota
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
WHERE m.nota = (
    SELECT MIN(nota)
    FROM matriculas
);


# QUESTÕES INTERMEDIÁRIAS — Subquery com IN


-- 1
SELECT nome
FROM alunos
WHERE id_aluno IN (
    SELECT id_aluno
    FROM matriculas
);

-- 2
SELECT *
FROM cursos
WHERE id_curso IN (
    SELECT id_curso
    FROM matriculas
);

-- 3
SELECT nome
FROM alunos
WHERE id_aluno IN (
    SELECT id_aluno
    FROM matriculas
    WHERE id_curso = (
        SELECT id_curso
        FROM cursos
        WHERE nome_curso = 'Python'
    )
);

-- 4
SELECT nome
FROM alunos
WHERE id_aluno IN (
    SELECT id_aluno
    FROM matriculas
    WHERE id_curso IN (
        SELECT id_curso
        FROM cursos
        WHERE carga_horaria > 60
    )
);

-- 5
SELECT *
FROM cursos
WHERE id_curso IN (
    SELECT id_curso
    FROM matriculas
    WHERE nota > 8
);

-- 6
SELECT *
FROM alunos
WHERE id_aluno IN (
    SELECT id_aluno
    FROM matriculas
    GROUP BY id_aluno
    HAVING COUNT(*) > 1
);

-- 7
SELECT *
FROM cursos
WHERE id_curso NOT IN (
    SELECT id_curso
    FROM matriculas
);

-- 8
SELECT *
FROM alunos
WHERE id_aluno IN (
    SELECT id_aluno
    FROM matriculas
    WHERE faltas > 5
);

-- 9
SELECT *
FROM cursos
WHERE id_curso IN (
    SELECT id_curso
    FROM matriculas
    WHERE id_aluno IN (
        SELECT id_aluno
        FROM alunos
        WHERE cidade = 'Curitiba'
    )
);

-- 10
SELECT *
FROM alunos
WHERE id_aluno IN (
    SELECT id_aluno
    FROM matriculas
    WHERE id_curso = (
        SELECT id_curso
        FROM cursos
        WHERE carga_horaria = (
            SELECT MAX(carga_horaria)
            FROM cursos
        )
    )
);


# QUESTÕES AVANÇADAS — Subquery com operadores


-- 1
SELECT *
FROM alunos
WHERE idade > (
    SELECT AVG(idade)
    FROM alunos
    WHERE cidade = 'São Paulo'
);

-- 2
SELECT c.nome_curso, AVG(m.nota) AS media
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING AVG(m.nota) > (
    SELECT AVG(nota)
    FROM matriculas
);

-- 3
SELECT a.nome, SUM(m.faltas) AS total_faltas
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING SUM(m.faltas) > (
    SELECT AVG(faltas)
    FROM matriculas
);

-- 4
SELECT c.nome_curso
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING MAX(m.nota) = (
    SELECT MAX(nota)
    FROM matriculas
);

-- 5
SELECT a.nome, AVG(m.nota) AS media
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING AVG(m.nota) < (
    SELECT AVG(nota)
    FROM matriculas
);

-- 6
SELECT c.nome_curso, COUNT(*) AS qtd
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING COUNT(*) > (
    SELECT COUNT(*) / COUNT(DISTINCT id_curso)
    FROM matriculas
);

-- 7
SELECT a.nome, m.nota
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
WHERE m.nota > ALL (
    SELECT nota
    FROM matriculas
    WHERE id_curso = (
        SELECT id_curso
        FROM cursos
        WHERE nome_curso = 'Banco de Dados'
    )
);

-- 8
SELECT c.nome_curso, MIN(m.nota) AS menor_nota
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING MIN(m.nota) > (
    SELECT AVG(sub.menor)
    FROM (
        SELECT MIN(nota) AS menor
        FROM matriculas
        GROUP BY id_curso
    ) sub
);

-- 9
SELECT *
FROM alunos
WHERE idade = (
    SELECT AVG(idade)
    FROM alunos
);

-- 10
SELECT *
FROM cursos
WHERE carga_horaria < (
    SELECT MAX(carga_horaria)
    FROM cursos
);


# SUBQUERY COMO NOVA COLUNA


-- 1
SELECT nome,
(
    SELECT COUNT(*)
    FROM matriculas m
    WHERE m.id_aluno = a.id_aluno
) AS total_matriculas
FROM alunos a;

-- 2
SELECT nome_curso,
(
    SELECT AVG(nota)
    FROM matriculas m
    WHERE m.id_curso = c.id_curso
) AS media_notas
FROM cursos c;

-- 3
SELECT nome,
(
    SELECT SUM(faltas)
    FROM matriculas m
    WHERE m.id_aluno = a.id_aluno
) AS total_faltas
FROM alunos a;

-- 4
SELECT nome_curso,
(
    SELECT COUNT(DISTINCT id_aluno)
    FROM matriculas m
    WHERE m.id_curso = c.id_curso
) AS total_alunos
FROM cursos c;

-- 5
SELECT nome,
(
    SELECT MAX(nota)
    FROM matriculas m
    WHERE m.id_aluno = a.id_aluno
) AS maior_nota
FROM alunos a;

-- 6
SELECT nome_curso,
(
    SELECT MIN(nota)
    FROM matriculas m
    WHERE m.id_curso = c.id_curso
) AS menor_nota
FROM cursos c;

-- 7
SELECT nome,
(
    SELECT AVG(nota)
    FROM matriculas m
    WHERE m.id_aluno = a.id_aluno
) AS Media_Aluno
FROM alunos a;

-- 8
SELECT nome_curso,
(
    SELECT SUM(faltas)
    FROM matriculas m
    WHERE m.id_curso = c.id_curso
) AS total_faltas
FROM cursos c;

-- 9
SELECT nome,
(
    SELECT COUNT(DISTINCT id_curso)
    FROM matriculas m
    WHERE m.id_aluno = a.id_aluno
) AS qtd_cursos
FROM alunos a;

-- 10
SELECT nome_curso,
(
    SELECT COUNT(*)
    FROM matriculas m
    WHERE m.id_curso = c.id_curso
    AND nota >= 7
) AS aprovados
FROM cursos c;


# DESAFIO — GROUP BY + HAVING + SUBQUERY


-- 1
SELECT cidade, AVG(idade) AS media_idade
FROM alunos
GROUP BY cidade
HAVING AVG(idade) > (
    SELECT AVG(idade)
    FROM alunos
);

-- 2
SELECT c.nome_curso, AVG(m.nota) AS media
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING AVG(m.nota) > (
    SELECT AVG(media_curso)
    FROM (
        SELECT AVG(nota) AS media_curso
        FROM matriculas
        GROUP BY id_curso
    ) sub
);

-- 3
SELECT a.nome, SUM(m.faltas) AS total
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING SUM(m.faltas) > (
    SELECT AVG(total_faltas)
    FROM (
        SELECT SUM(faltas) AS total_faltas
        FROM matriculas
        GROUP BY id_aluno
    ) sub
);

-- 4
SELECT c.nome_curso, COUNT(*) AS qtd
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING COUNT(*) > (
    SELECT AVG(qtd)
    FROM (
        SELECT COUNT(*) AS qtd
        FROM matriculas
        GROUP BY id_curso
    ) sub
);

-- 5
SELECT a.nome, AVG(m.nota) AS media
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING AVG(m.nota) > (
    SELECT AVG(m2.nota)
    FROM alunos a2
    INNER JOIN matriculas m2
    ON a2.id_aluno = m2.id_aluno
    WHERE a2.cidade = 'São Paulo'
);

-- 6
SELECT *
FROM cursos
WHERE carga_horaria > (
    SELECT AVG(carga_horaria)
    FROM cursos
    WHERE id_curso IN (
        SELECT id_curso
        FROM matriculas
    )
);

-- 7
SELECT a.nome, COUNT(*) AS qtd
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING COUNT(*) > (
    SELECT AVG(qtd)
    FROM (
        SELECT COUNT(*) AS qtd
        FROM matriculas
        GROUP BY id_aluno
    ) sub
);

-- 8
SELECT c.nome_curso, MAX(m.nota) AS maior_nota
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING MAX(m.nota) < (
    SELECT MAX(nota)
    FROM matriculas
);

-- 9
SELECT a.nome, AVG(m.faltas) AS media_faltas
FROM alunos a
INNER JOIN matriculas m
ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING AVG(m.faltas) < (
    SELECT AVG(faltas)
    FROM matriculas
);

-- 10
SELECT c.nome_curso,
COUNT(*) AS aprovados
FROM cursos c
INNER JOIN matriculas m
ON c.id_curso = m.id_curso
WHERE m.nota >= 7
GROUP BY c.nome_curso
HAVING COUNT(*) > (
    SELECT AVG(aprovados)
    FROM (
        SELECT COUNT(*) AS aprovados
        FROM matriculas
        WHERE nota >= 7
        GROUP BY id_curso
    ) sub
);
