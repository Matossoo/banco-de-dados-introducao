-- 1
SELECT id_categoria, COUNT(*) AS quantidade
FROM Produtos
GROUP BY id_categoria
HAVING COUNT(*) > 5;

-- 2
SELECT id_filial, SUM(total) AS total_vendas
FROM Vendas
GROUP BY id_filial
HAVING SUM(total) > 10000;

-- 3
SELECT cargo, AVG(salario) AS media_salario
FROM Funcionarios
GROUP BY cargo
HAVING AVG(salario) > 3000;

-- 4
SELECT id_fornecedor, COUNT(*) AS quantidade
FROM Produtos
GROUP BY id_fornecedor
HAVING COUNT(*) > 10;

-- 5
SELECT id_funcionario, COUNT(*) AS total_vendas
FROM Vendas
GROUP BY id_funcionario
HAVING COUNT(*) > 20;

-- 6
SELECT id_filial, COUNT(*) AS total_funcionarios
FROM Funcionarios
GROUP BY id_filial
HAVING COUNT(*) > 3;

-- 7
SELECT id_categoria, SUM(quantidade_estoque) AS estoque_total
FROM Produtos
GROUP BY id_categoria
HAVING SUM(quantidade_estoque) > 500;

-- 8
SELECT id_fornecedor, SUM(total) AS total_compras
FROM Compras
GROUP BY id_fornecedor
HAVING SUM(total) > 5000;

-- 9
SELECT data, COUNT(*) AS total_vendas
FROM Vendas
GROUP BY data
HAVING COUNT(*) > 10;

-- 10
SELECT endereco, SUM(pontos_fidelidade) AS total_pontos
FROM Clientes
GROUP BY endereco
HAVING SUM(pontos_fidelidade) > 200;

-- 11
SELECT cargo, MAX(salario) AS maior_salario
FROM Funcionarios
GROUP BY cargo
HAVING MAX(salario) > 7000;