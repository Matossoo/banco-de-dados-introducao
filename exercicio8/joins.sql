-- 1
SELECT p.nome, c.nome
FROM Produtos p
JOIN Categorias c
ON p.id_categoria = c.id_categoria;

-- 2
SELECT p.nome, f.nome
FROM Produtos p
JOIN Fornecedores f
ON p.id_fornecedor = f.id_fornecedor;

-- 3
SELECT fu.nome, fi.nome
FROM Funcionarios fu
JOIN Filiais fi
ON fu.id_filial = fi.id_filial;

-- 4
SELECT v.id_venda, v.data, c.nome
FROM Vendas v
JOIN Clientes c
ON v.id_cliente = c.id_cliente;

-- 5
SELECT co.id_compra, co.data, f.nome
FROM Compras co
JOIN Fornecedores f
ON co.id_fornecedor = f.id_fornecedor;

-- 6
SELECT iv.id_venda,
       p.nome,
       iv.quantidade,
       iv.subtotal
FROM ItensVenda iv
JOIN Produtos p
ON iv.id_produto = p.id_produto;

-- 7
SELECT p.nome, f.nome
FROM Produtos p
JOIN Filiais f
ON p.id_filial = f.id_filial;

-- 8
SELECT v.id_venda, f.nome
FROM Vendas v
JOIN Funcionarios f
ON v.id_funcionario = f.id_funcionario;

-- 9
SELECT c.id_compra,
       f.nome,
       c.total
FROM Compras c
JOIN Filiais f
ON c.id_filial = f.id_filial;

-- 10
SELECT c.nome,
       v.id_venda,
       v.total
FROM Clientes c
JOIN Vendas v
ON c.id_cliente = v.id_cliente;

-- 11
SELECT
    v.id_venda,
    c.nome AS cliente,
    fu.nome AS funcionario,
    fi.nome AS filial,
    v.total
FROM Vendas v
JOIN Clientes c
ON v.id_cliente = c.id_cliente
JOIN Funcionarios fu
ON v.id_funcionario = fu.id_funcionario
JOIN Filiais fi
ON v.id_filial = fi.id_filial;