USE OficinaZuruba;
-- Drop das tabelas
DROP TABLE IF EXISTS tbl_ManutencoesServicos;
DROP TABLE IF EXISTS tbl_ManutencoesPecas;
DROP TABLE IF EXISTS tbl_Manutencoes;
DROP TABLE IF EXISTS tbl_Pecas;
DROP TABLE IF EXISTS tbl_Servicos;
DROP TABLE IF EXISTS tbl_Carros;
DROP TABLE IF EXISTS tbl_Clientes;
DROP TABLE IF EXISTS tbl_Fornecedores;


CREATE TABLE tbl_Clientes (
	cdCliente INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dataNascimento DATE,
	sexo CHAR(1)
);

CREATE TABLE tbl_Carros (
	cdCarro INT PRIMARY KEY,
	nomeModelo VARCHAR(50) NOT NULL,
	nomeFabricante VARCHAR(50) NOT NULL,
	anoModelo INT NOT NULL,
	cdCliente INT NOT NULL
);

CREATE TABLE tbl_Servicos (
	cdServico INT PRIMARY KEY,
	cdCarro INT NOT NULL,
	dataEntrada DATE NOT NULL,
	dataSaida DATE
);

CREATE TABLE tbl_Manutencoes (
	cdManutencao INT PRIMARY KEY,
	dataManutencao DATE NOT NULL,
	nome VARCHAR(50) NOT NULL,
)

-- Pensar sobre como cadastraremos as ret�ficas de pe�as

CREATE TABLE tbl_Pecas (
	cdPeca INT PRIMARY KEY,
	cdManutencao INT NULL,
	cdFornecedor INT NULL,
	nome VARCHAR(50) NOT NULL,
	valorCompra FLOAT,
	valorVenda FLOAT
);

-- Tipos de servi�o
CREATE TABLE tbl_TiposServicos (
	cdTipoServico INT PRIMARY KEY,
	nome VARCHAR(50),
	descricao VARCHAR(150)
);


-- Fornecedor
CREATE TABLE tbl_Fornecedores (
	cdFornecedor INT PRIMARY KEY,
	nomeFornecedor VARCHAR(90) NOT NULL,
	dataCastro DATE
);

CREATE TABLE tbl_ManutencoesServicos (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES tbl_Manutencoes (cdManutencao),
	cdServico INT NOT NULL FOREIGN KEY REFERENCES tbl_Servicos (cdServico)
);

CREATE TABLE tbl_FornecedoresTipoServicos (
	cdFornecedor INT NOT NULL FOREIGN KEY REFERENCES tbl_Fornecedores (cdFornecedor),
	cdTipoServico INT NOT NULL FOREIGN KEY REFERENCES tbl_TiposServicos (cdTipoServico)
);

-- Regras de chaves estrangeiras
ALTER TABLE tbl_Carros
ADD CONSTRAINT FK_CarrosClientes
FOREIGN KEY (cdCliente)
REFERENCES tbl_Clientes (cdCliente);

ALTER TABLE tbl_Servicos
ADD CONSTRAINT KF_ServicosCarros
FOREIGN KEY (cdCarro)
REFERENCES tbl_Carros (cdCarro);

ALTER TABLE tbl_Pecas
ADD CONSTRAINT FK_PecasManutencoes 
FOREIGN KEY (cdManutencao)
REFERENCES tbl_Manutencoes (cdManutencao);

ALTER TABLE tbl_Pecas
ADD CONSTRAINT FK_PecasFornecedores
FOREIGN KEY (cdFornecedor)
REFERENCES tbl_Fornecedores (cdFornecedor);

-- Inser��o de dados

INSERT INTO tbl_Clientes (
	cdCliente,
	nome,
	dataNascimento,
	sexo
) VALUES (
	1,
	'Zurubabel',
	'1987-11-15',
	'M'
), (
	2,
	'Jailson',
	'1980-02-01',
	'M'
);

INSERT INTO tbl_Carros (
	cdCarro,
	nomeModelo,
	nomeFabricante,
	anoModelo,
	cdCliente
) VALUES (
	1,
	'Corsa',
	'Ford',
	'2005',
	1
), (
	2,
	'Fox',
	'Volswagen',
	'2008',
	2
);

