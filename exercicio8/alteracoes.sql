-- =====================================
-- ALTER TABLE - MODIFICAR TABELAS
-- =====================================

-- 1. Renomear tabela
ALTER TABLE Clientes
RENAME TO ClientesVIP;

-- 2. Adicionar nova coluna
ALTER TABLE Produtos
ADD marca VARCHAR(50);

-- 3. Remover coluna
ALTER TABLE Produtos
DROP COLUMN marca;

-- 4. Modificar tipo da coluna
ALTER TABLE Clientes
MODIFY telefone VARCHAR(20);

-- 5. Renomear coluna
ALTER TABLE Funcionarios
RENAME COLUMN cargo TO funcao;


-- =====================================
-- MODIFICAR COLUNAS / ATRIBUTOS
-- =====================================

-- 1. Alterar tamanho do VARCHAR
ALTER TABLE Produtos
MODIFY nome VARCHAR(200);

-- 2. Tornar coluna NOT NULL
ALTER TABLE Clientes
MODIFY nome VARCHAR(100) NOT NULL;

-- 3. Remover NOT NULL
ALTER TABLE Clientes
MODIFY endereco VARCHAR(200) NULL;

-- 4. Adicionar valor DEFAULT
ALTER TABLE Clientes
MODIFY pontos_fidelidade INT DEFAULT 0;

-- 5. Alterar tipo INT para BIGINT
ALTER TABLE Vendas
MODIFY id_venda BIGINT;


-- =====================================
-- CHAVE PRIMÁRIA (PK)
-- =====================================

-- 1. Adicionar PK
ALTER TABLE Fornecedores
ADD PRIMARY KEY(id_fornecedor);

-- 2. Remover PK
ALTER TABLE Fornecedores
DROP PRIMARY KEY;

-- 3. Criar PK composta
ALTER TABLE ItensVenda
ADD PRIMARY KEY(id_venda, id_produto);

-- 4. Trocar PK
ALTER TABLE Clientes
DROP PRIMARY KEY;

ALTER TABLE Clientes
ADD PRIMARY KEY(id_cliente);

-- 5. AUTO_INCREMENT
ALTER TABLE Produtos
MODIFY id_produto INT AUTO_INCREMENT;


-- =====================================
-- CHAVES ESTRANGEIRAS (FK)
-- =====================================

-- 1. Adicionar FK
ALTER TABLE Produtos
ADD CONSTRAINT fk_categoria
FOREIGN KEY(id_categoria)
REFERENCES Categorias(id_categoria);

-- 2. Remover FK
ALTER TABLE Produtos
DROP FOREIGN KEY fk_categoria;

-- 3. Criar FK em Vendas
ALTER TABLE Vendas
ADD CONSTRAINT fk_cliente
FOREIGN KEY(id_cliente)
REFERENCES Clientes(id_cliente);

-- 4. FK com DELETE CASCADE
ALTER TABLE ItensVenda
ADD CONSTRAINT fk_venda
FOREIGN KEY(id_venda)
REFERENCES Vendas(id_venda)
ON DELETE CASCADE;

-- 5. FK com UPDATE CASCADE
ALTER TABLE Produtos
ADD CONSTRAINT fk_fornecedor
FOREIGN KEY(id_fornecedor)
REFERENCES Fornecedores(id_fornecedor)
ON UPDATE CASCADE;


-- =====================================
-- CONSTRAINTS
-- =====================================

-- 1. UNIQUE
ALTER TABLE Clientes
ADD CONSTRAINT unique_email
UNIQUE(email);

-- 2. Remover UNIQUE
ALTER TABLE Clientes
DROP INDEX unique_email;

-- 3. CHECK
ALTER TABLE Produtos
ADD CONSTRAINT chk_preco
CHECK(preco >= 0);

-- 4. DEFAULT
ALTER TABLE Clientes
ALTER pontos_fidelidade
SET DEFAULT 0;

-- 5. NOT NULL
ALTER TABLE Funcionarios
MODIFY salario DECIMAL(10,2) NOT NULL;