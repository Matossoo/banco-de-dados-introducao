-- 1
SELECT id_categoria, COUNT(*) AS quantidade
FROM Produtos
GROUP BY id_categoria;

-- 2
SELECT id_cliente, SUM(total) AS total_vendas
FROM Vendas
GROUP BY id_cliente;

-- 3
SELECT cargo, AVG(salario) AS media_salarial
FROM Funcionarios
GROUP BY cargo;

-- 4
SELECT id_filial, COUNT(*) AS total_funcionarios
FROM Funcionarios
GROUP BY id_filial;

-- 5
SELECT id_filial, SUM(total) AS total_vendido
FROM Vendas
GROUP BY id_filial;

-- 6
SELECT id_fornecedor, COUNT(*) AS total_produtos
FROM Produtos
GROUP BY id_fornecedor;

-- 7
SELECT id_fornecedor, SUM(total) AS total_compras
FROM Compras
GROUP BY id_fornecedor;

-- 8
SELECT id_categoria, AVG(preco) AS media_preco
FROM Produtos
GROUP BY id_categoria;

-- 9
SELECT endereco, SUM(pontos_fidelidade) AS total_pontos
FROM Clientes
GROUP BY endereco;

-- 10
SELECT id_produto, SUM(quantidade) AS total_vendido
FROM ItensVenda
GROUP BY id_produto;

-- 11
SELECT cargo, MAX(salario) AS maior_salario
FROM Funcionarios
GROUP BY cargo;