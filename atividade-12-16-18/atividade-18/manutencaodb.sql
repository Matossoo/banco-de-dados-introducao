
-- Criar banco

CREATE DATABASE INDUSTRIA_MANUTENCAO;
USE INDUSTRIA_MANUTENCAO;

---------------------------------------------------
-- TABELA ORIGINAL (NÃO NORMALIZADA)
---------------------------------------------------

CREATE TABLE OrdemServico_Original (
    CodigoOS INT,
    DataOS DATE,
    Cliente VARCHAR(100),
    TelefoneCliente VARCHAR(20),
    CidadeCliente VARCHAR(100),
    Equipamento VARCHAR(100),
    CategoriaEquipamento VARCHAR(100),
    Tecnico VARCHAR(100),
    CargoTecnico VARCHAR(100),
    TelefoneTecnico VARCHAR(20),
    FornecedorPeca VARCHAR(100),
    CidadeFornecedor VARCHAR(100),
    PecaUtilizada VARCHAR(100),
    QuantidadePeca INT,
    ValorPeca DECIMAL(10,2)
);

---------------------------------------------------
-- NORMALIZAÇÃO (3FN)
---------------------------------------------------

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE Tecnico (
    id_tecnico INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    telefone VARCHAR(20),
    PRIMARY KEY(id_tecnico)
);

CREATE TABLE CategoriaEquipamento (
    id_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_categoria),
    UNIQUE(nome_categoria)
);

CREATE TABLE Equipamento (
    id_equipamento INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY(id_equipamento),
    FOREIGN KEY(id_categoria)
        REFERENCES CategoriaEquipamento(id_categoria)
);

CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    PRIMARY KEY(id_fornecedor)
);

CREATE TABLE Peca (
    id_peca INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2),
    id_fornecedor INT NOT NULL,
    PRIMARY KEY(id_peca),
    FOREIGN KEY(id_fornecedor)
        REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE OrdemServico (
    codigo_os INT,
    data_os DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_equipamento INT NOT NULL,
    id_tecnico INT NOT NULL,

    PRIMARY KEY(codigo_os),

    FOREIGN KEY(id_cliente)
        REFERENCES Cliente(id_cliente),

    FOREIGN KEY(id_equipamento)
        REFERENCES Equipamento(id_equipamento),

    FOREIGN KEY(id_tecnico)
        REFERENCES Tecnico(id_tecnico)
);

CREATE TABLE ItemOS (
    codigo_os INT,
    id_peca INT,
    quantidade INT NOT NULL,

    PRIMARY KEY(codigo_os, id_peca),

    FOREIGN KEY(codigo_os)
        REFERENCES OrdemServico(codigo_os),

    FOREIGN KEY(id_peca)
        REFERENCES Peca(id_peca),

    CHECK (quantidade > 0)
);

---------------------------------------------------
-- INSERÇÃO DOS DADOS
---------------------------------------------------

INSERT INTO Cliente(nome, telefone, cidade)
VALUES
('MetalSul','(51)99999-1111','Porto Alegre'),
('AutoMec','(41)97777-2222','Curitiba'),
('Alfa Máquinas','(11)94444-4444','São Paulo');

INSERT INTO Tecnico(nome,cargo,telefone)
VALUES
('João Silva','Técnico Mecânico','(51)98888-1111'),
('Maria Souza','Técnica Industrial','(41)96666-2222'),
('Carlos Lima','Engenheiro de Manutenção','(51)95555-3333');

INSERT INTO CategoriaEquipamento(nome_categoria)
VALUES
('Prensas'),
('Transporte Interno'),
('CNC');

INSERT INTO Equipamento(nome,id_categoria)
VALUES
('Prensa Hidráulica',1),
('Esteira Transportadora',2),
('Centro de Usinagem',3);

INSERT INTO Fornecedor(nome,cidade)
VALUES
('Industrial Parts','Caxias do Sul'),
('MecParts','Curitiba'),
('TecIndustrial','Campinas');

INSERT INTO Peca(nome,valor,id_fornecedor)
VALUES
('Rolamento A',150.00,1),
('Correia B',80.00,1),
('Sensor X',250.00,2),
('Válvula Z',420.00,1),
('Motor Y',980.00,3);

INSERT INTO OrdemServico
VALUES
(1001,'2025-03-10',1,1,1),
(1002,'2025-03-12',2,2,2),
(1003,'2025-03-13',1,1,3),
(1004,'2025-03-15',3,3,1);

INSERT INTO ItemOS
VALUES
(1001,1,2),
(1001,2,1),
(1002,3,3),
(1003,4,1),
(1004,5,1);

