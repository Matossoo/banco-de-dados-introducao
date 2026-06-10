CREATE DATABASE SupermercadoDB;
USE SupermercadoDB;

-- ==========================
-- TABELA CATEGORIAS
-- ==========================
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- ==========================
-- TABELA FORNECEDORES
-- ==========================
CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    endereco VARCHAR(200)
);

-- ==========================
-- TABELA FILIAIS
-- ==========================
CREATE TABLE Filiais (
    id_filial INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL
);

-- ==========================
-- TABELA PRODUTOS
-- ==========================
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_categoria INT NOT NULL,
    id_fornecedor INT NOT NULL,
    id_filial INT NOT NULL,

    FOREIGN KEY (id_categoria)
        REFERENCES Categorias(id_categoria),

    FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedores(id_fornecedor),

    FOREIGN KEY (id_filial)
        REFERENCES Filiais(id_filial)
);

-- ==========================
-- TABELA FUNCIONARIOS
-- ==========================
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_contratacao DATE NOT NULL,
    id_filial INT NOT NULL,

    FOREIGN KEY (id_filial)
        REFERENCES Filiais(id_filial)
);

-- ==========================
-- TABELA CLIENTES
-- ==========================
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone CHAR(11) UNIQUE,
    endereco VARCHAR(200),
    pontos_fidelidade INT DEFAULT 0
);

-- ==========================
-- TABELA COMPRAS
-- ==========================
CREATE TABLE Compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_fornecedor INT NOT NULL,
    id_filial INT NOT NULL,

    FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedores(id_fornecedor),

    FOREIGN KEY (id_filial)
        REFERENCES Filiais(id_filial)
);

-- ==========================
-- TABELA ITENSCOMPRA
-- ==========================
CREATE TABLE ItensCompra (
    id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_compra)
        REFERENCES Compras(id_compra),

    FOREIGN KEY (id_produto)
        REFERENCES Produtos(id_produto)
);

-- ==========================
-- TABELA VENDAS
-- ==========================
CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_cliente INT,
    id_funcionario INT NOT NULL,
    id_filial INT NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente),

    FOREIGN KEY (id_funcionario)
        REFERENCES Funcionarios(id_funcionario),

    FOREIGN KEY (id_filial)
        REFERENCES Filiais(id_filial)
);

-- ==========================
-- TABELA ITENSVENDA
-- ==========================
CREATE TABLE ItensVenda (
    id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_venda)
        REFERENCES Vendas(id_venda),

    FOREIGN KEY (id_produto)
        REFERENCES Produtos(id_produto)
);

