-- 1
SELECT * FROM Clientes
WHERE pontos_fidelidade > 100;

-- 2
SELECT * FROM Produtos
WHERE preco > 50;

-- 3
SELECT * FROM Funcionarios
WHERE salario > 3000;

-- 4
SELECT * FROM Produtos
WHERE quantidade_estoque < 10;

-- 5
SELECT * FROM Compras
WHERE data = '2025-01-10';

-- 6
SELECT * FROM Clientes
WHERE telefone IS NOT NULL;

-- 7
SELECT * FROM Funcionarios
WHERE cargo = 'Caixa';

-- 8
SELECT * FROM Produtos
WHERE id_filial = 1;

-- 9
SELECT * FROM Vendas
WHERE total > 500;

-- 10
SELECT * FROM Fornecedores
WHERE nome = 'Distribuidora Alfa';