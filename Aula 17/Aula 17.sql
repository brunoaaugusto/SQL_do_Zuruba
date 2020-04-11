USE OficinaZuruba;
-- Drop das tabelas
DROP TABLE IF EXISTS tbl_ManutencoesServicos;
DROP TABLE IF EXISTS tbl_ManutencoesPecas;
DROP TABLE IF EXISTS tbl_Manutencoes;
DROP TABLE IF EXISTS tbl_Pecas;
DROP TABLE IF EXISTS tbl_Servicos;
DROP TABLE IF EXISTS tbl_Carros;
DROP TABLE IF EXISTS tbl_Clientes;



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
	cdCliente INT FOREIGN KEY REFERENCES tbl_Clientes (cdCliente)
);

CREATE TABLE tbl_Servicos (
	cdServico INT PRIMARY KEY,
	cdCarro INT FOREIGN KEY REFERENCES tbl_Carros (cdCarro) NOT NULL,
	dataEntrada DATE NOT NULL,
	dataSaida DATE
);

CREATE TABLE tbl_Pecas (
	cdPeca INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	valorCompra FLOAT,
	valorVenda FLOAT
);

CREATE TABLE tbl_Manutencoes (
	cdManutencao INT PRIMARY KEY,
	dataManutencao DATE NOT NULL,
	nome VARCHAR(50) NOT NULL,
)

CREATE TABLE tbl_ManutencoesPecas (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES tbl_Manutencoes (cdManutencao),
	cdPeca INT NOT NULL FOREIGN KEY REFERENCES tbl_Pecas (cdPeca)
);

CREATE TABLE tbl_ManutencoesServicos (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES tbl_Manutencoes (cdManutencao),
	cdServico INT NOT NULL FOREIGN KEY REFERENCES tbl_Servicos (cdServico)
)


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

