-- Clientes
INSERT INTO tbl_Clientes 
VALUES (1, 'Bruno', '1987-11-15', 'M');

INSERT INTO tbl_Clientes (cdCliente, nome, dataNascimento, sexo)
VALUES (2, 'Josu�', '1980-01-02', 'M');

-- Carros
INSERT INTO tbl_Carros (cdCarro, nomeModelo, nomeFabricante, anoModelo, cdCliente)
VALUES (1, 'Fusca', 'Volkswagen', '1981', 2);