-- Populando a tabela Cliente
INSERT INTO Cliente (cpf, nome, dtNasc, pgtoPreferencial, telefone)
VALUES ('02335678301', 'Fabiano Andrade', '15-05-1998', 'Cartão', '8334567890'),
       ('98765432307', 'Marilia Da Silva', '08-08-1980', 'PIX', '9876543210'),
       ('45678912355', 'Theo José Da Silva', '09-05-1990', 'PIX', '8891111111'),
       ('36925814706', 'João Pedro Andrade', '11-12-1997', 'Cartão', '8362222822'),
       ('36125814789', 'Ross Geller', '11-12-1997', 'Cartão', '8524227222');

-- Populando a tabela Funcionario
INSERT INTO Funcionario (cpf, nome, salario, telefone, dtAdmissao, cargo)
VALUES ('11122233344', 'Maria Fernanda De Andrade Cesário', 3960.00, '5555555555', '01-01-2023', 'Recepcionista'),
       ('44455566677', 'Eduarda Andrade', 2640.00, '6666666666', '01-01-2023', 'Cozinheira'),
       ('77788899900', 'Phoebe Buffay', 1980.00, '7777777777', '01-01-2023', 'Auxiliar de Limpeza'),
       ('12365478900', 'Rachel Green', 1980.00, '8888888888', '01-01-2023', 'Auxiliar de Limpeza'),
       ('14366478910', 'Monica Eustace', 2640.00, '999999999', '01-01-2023', 'Cozinheira');

-- Populando a tabela TipoQuarto
INSERT INTO TipoQuarto (idTipo, padrão, capacidade, preço)
VALUES (1, 'Standard', 2, 200.00),
       (2, 'Master', 4, 400.00),
       (3, 'Deluxe', 6, 600.00);

-- Populando a tabela Quarto
INSERT INTO Quarto (numQuarto, andar, idTipo, cpfFunc)
VALUES (101, 'Primeiro', 1, '77788899900'),
       (102, 'Primeiro', 1, '77788899900'),
       (201, 'Segundo', 2, '12365478900'),
       (202, 'Segundo', 2, '12365478900'),
       (301, 'Terceiro', 3, '77788899900'),
       (302, 'Terceiro', 3, '12365478900');

-- Populando a tabela Hospedagem
INSERT INTO Hospedagem (idHosp, dataHosp, dtPreSaida, cpfCliente)
VALUES (1, '1-11-2023', '3-11-2023', '02335678301'),
       (2, '2-11-2023', '4-11-2023', '98765432307'),
       (3, '12-11-2023', '14-11-2023', '45678912355'),
       (4, '15-11-2023', '16-11-2023', '36925814706'),
       (5, '16-11-2023', '20-11-2023', '36125814789');

-- Populando a tabela Reserva
INSERT INTO Reserva (idHosp, dtEntrada, status)
VALUES (1, '2023-11-1', 'Confirmada'),
       (5, '2023-11-16', 'Pendente');

-- Populando a tabela Balcao
INSERT INTO Balcao (idHosp, dtEntrada, comissao, cpfFunc)
VALUES (2, '2023-11-2', 20.00, '11122233344'),
       (3, '2023-11-12', 20.00, '11122233344'),
       (4, '2023-11-15', 20.00, '11122233344');

-- Populando a tabela FormaPagamento
INSERT INTO FormaPagamento (código, valor, dtPgto)
VALUES (1, 600.00, '2023-11-1'),
       (2, 400.00, '2023-11-2'),
       (3, 400.00, '2023-11-12'),
       (4, 200.00, '2024-11-15'),
       (5, 600.00, '2024-11-16');

-- Populando a tabela PIX
INSERT INTO PIX (cpfPagador, codPgto)
VALUES ('02335678301', 1),
       ('36125814789', 5);

-- Populando a tabela Cartão
INSERT INTO Cartão (codPgto)
VALUES (2),
       (3);

-- Populando a tabela CadastroCartao
INSERT INTO CadastroCartao (num, dtVal, titular)
VALUES ('1111222233334444', '2028-08-11', 'Theo José Da Silva'),
       ('5555666677778888', '2028-06-30', 'Marilia Da Silva');

-- Populando a tabela Fornecedor
INSERT INTO Fornecedor (cnpj, rzSocial)
VALUES ('12345678901234', 'Copal Distribuidora'),
       ('98765432109876', 'PMG Atacadista de Alimentos e Bebidas'),
       ('53762432309671', 'Aliança Distribuidora'),
       ('43755435109870', 'Vital Atacadista'),
       ('78765432109872', 'Triunfo Alimentícia LTDA');
       

-- Populando a tabela Telefone
INSERT INTO Telefone (cnpjForn, telefone)
VALUES ('12345678901234', '9115161711'),
       ('98765432109876', '8395999798'),
       ('53762432309671', '8891011111'),
       ('43755435109870', '9594996997'),
       ('78765432109872', '9144996934');

-- Populando a tabela Produto
INSERT INTO Produto (codBarras, descricao, valorU, cnpjForn)
VALUES ('ABCDE12345', 'Ovo', 1.00, '12345678901234'),
       ('FGHIC6789G', 'Café', 5.00, '98765432109876'),
       ('BBCDE12345', 'Macarrão', 1.00, '12345678901234'),
       ('FGHIJ67890', 'Pão', 4.00, '98765432109876'),
       ('SGQIJ67898', 'Cuscuz', 1.00, '98765432109876');
       
-- Populando a tabela Estoque
INSERT INTO Estoque (idLote, nome, dtForne, dtVal, cpfFunc)
VALUES (1, 'Lote de Ovos', '2023-11-01', '2023-12-01', '14366478910'),
       (2, 'Lote de Café', '2023-10-15', '2024-10-15', '44455566677'),
       (3, 'Lote de Macarrão', '2023-10-15', '2024-10-15', '14366478910'),
       (4, 'Lote de Pão', '2023-10-15', '2023-10-25', '44455566677'),
       (5, 'Lote de Cuscuz', '2023-10-15', '2023-12-25', '44455566677');

-- Populando a tabela HospedagemUsaTipo
INSERT INTO HospedagemUsaTipo (idHosp, idTipo)
VALUES (1, 3),
       (2, 2),
       (3, 2),
       (4, 1),
       (5, 3);

-- Populando a tabela HospedagemPossuiPgto
INSERT INTO HospedagemPossuiPgto (idHosp, codPgto)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5);

-- Populando a tabela EstoqueTemProduto
INSERT INTO EstoqueTemProduto (idLote, codBarras)
VALUES (1, 'ABCDE12345'),
       (2, 'FGHIC6789G'),
       (3, 'BBCDE12345'),
       (4, 'FGHIJ67890'),
       (5, 'SGQIJ67898');

-- Populando a tabela PagamentoPossuiCadastro
INSERT INTO PagamentoPossuiCadastro (codPgto, numCartao)
VALUES (2, '1111222233334444'),
       (3, '5555666677778888');