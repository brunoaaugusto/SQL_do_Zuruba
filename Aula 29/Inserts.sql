USE OficinaZuruba;

-- Clientes
INSERT INTO tbl_Clientes 
VALUES (1, 'Bruno', '1987-11-15', 'M');

INSERT INTO tbl_Clientes (cdCliente, nome, dataNascimento, sexo)
VALUES (2, 'Josu�', '1980-01-02', 'M');

-- Cliente com procedure

--SELECT * FROM tbl_Clientes

-- EXEC UDP_CadastrarClientes 3, 'Jailson', '1980-03-11', 'M'
-- EXEC UDP_CadastrarClientes 61658156, 'Josu�', '1990-11-11', 'M'

-- Carros
INSERT INTO tbl_Carros (cdCarro, nomeModelo, nomeFabricante, anoModelo, cdCliente)
VALUES (1, 'Fusca', 'Volkswagen', '1981', 2);

INSERT INTO tbl_Carros (cdCarro, nomeFabricante, nomeModelo, anoModelo, cdCliente)
VALUES (2, 'Volkswagen', 'Kombi', '2006', 1);