-- 1
SELECT * FROM Produtos
ORDER BY nome ASC;

-- 2
SELECT * FROM Produtos
ORDER BY preco DESC;

-- 3
SELECT * FROM Clientes
ORDER BY pontos_fidelidade ASC;

-- 4
SELECT * FROM Funcionarios
ORDER BY salario DESC;

-- 5
SELECT * FROM Vendas
ORDER BY data DESC;

-- 6
SELECT * FROM Compras
ORDER BY total DESC;

-- 7
SELECT * FROM Produtos
ORDER BY quantidade_estoque ASC;

-- 8
SELECT * FROM Fornecedores
ORDER BY nome ASC;

-- 9
SELECT * FROM Filiais
ORDER BY endereco ASC;

-- 10
SELECT * FROM Funcionarios
ORDER BY cargo ASC, nome ASC;

-- 11
SELECT *
FROM Produtos
ORDER BY id_categoria ASC, preco DESC;