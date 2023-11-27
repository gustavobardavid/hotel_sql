-- Populando a tabela Cliente
INSERT INTO Cliente (cpf, nome, dtNasc, pgtoPreferencial, telefone)
VALUES ('12345678900', 'João da Silva', '1990-05-15', 'Cartão', '1234567890'),
       ('98765432100', 'Maria Souza', '1985-08-20', 'PIX', '9876543210'),
       ('45678912300', 'Ana Clara', '1988-09-05', 'PIX', '1111111111'),
       ('36925814700', 'Pedro Almeida', '1995-11-12', 'Cartão', '2222222222');

-- Populando a tabela Funcionario
INSERT INTO Funcionario (cpf, nome, salario, telefone, dtAdmissao, cargo)
VALUES ('11122233344', 'Carlos Ferreira', 3000.00, '5555555555', '2022-01-10', 'Recepcionista'),
       ('44455566677', 'Ana Oliveira', 3500.00, '6666666666', '2021-05-20', 'Gerente'),
       ('77788899900', 'Paula Santos', 3200.00, '7777777777', '2023-03-10', 'Atendente'),
       ('12365478900', 'Lucas Oliveira', 2800.00, '8888888888', '2023-06-22', 'Auxiliar de Limpeza');

-- Populando a tabela TipoQuarto
INSERT INTO TipoQuarto (padrão, capacidade, preço)
VALUES ('Luxo', 2, 200.00),
       ('Standard', 4, 150.00);

-- Populando a tabela Quarto
INSERT INTO Quarto (numQuarto, andar, idTipo, cpfFunc)
VALUES (101, 'Primeiro', 1, '11122233344'),
       (201, 'Segundo', 2, '11122233344');

-- Populando a tabela Hospedagem
INSERT INTO Hospedagem (dataHosp, dtPreSaida, cpfCliente)
VALUES ('2023-10-20', '2023-10-25', '12345678900'),
       ('2023-11-05', '2023-11-10', '98765432100');

-- Populando a tabela Reserva
INSERT INTO Reserva (idHosp, dtEntrada, status)
VALUES (1, '2023-10-20', 'Confirmada'),
       (2, '2023-11-05', 'Pendente'),
       (3, '2023-12-15', 'Confirmada'),
       (4, '2024-01-08', 'Pendente');

-- Populando a tabela Balcao
INSERT INTO Balcao (idHosp, dtEntrada, comissao, cpfFunc)
VALUES (1, '2023-10-20', 50.00, '11122233344'),
       (2, '2023-11-05', 40.00, '11122233344'),
       (3, '2023-12-15', 60.00, '44455566677'),
       (4, '2024-01-08', 45.00, '44455566677');

-- Populando a tabela FormaPagamento
INSERT INTO FormaPagamento (nome, valor, dtPgto)
VALUES ('Cartão de Crédito', 300.00, '2023-10-25'),
       ('PIX', 250.00, '2023-11-10'),
       ('Dinheiro', 180.00, '2023-12-16'),
       ('Transferência', 210.00, '2024-01-09');

-- Populando a tabela PIX
INSERT INTO PIX (cpfPagador, codPgto)
VALUES ('12345678900', 1),
       ('98765432100', 2);

-- Populando a tabela Cartão
INSERT INTO Cartão (codPgto)
VALUES (1),
       (2);

-- Populando a tabela CadastroCartao
INSERT INTO CadastroCartao (num, dtVal, titular)
VALUES ('1111222233334444', '2025-12-31', 'João da Silva'),
       ('5555666677778888', '2024-10-31', 'Maria Souza');

-- Populando a tabela Fornecedor
INSERT INTO Fornecedor (cnpj, rzSocial)
VALUES ('12345678901234', 'Fornecedor A'),
       ('98765432109876', 'Fornecedor B');

-- Populando a tabela Telefone
INSERT INTO Telefone (cnpjForn, telefone)
VALUES ('12345678901234', '1111111111'),
       ('98765432109876', '9999999999');

-- Populando a tabela Produto
INSERT INTO Produto (codBarras, descricao, valorU, cnpjForn)
VALUES ('ABCDE12345', 'Produto X', 25.00, '12345678901234'),
       ('FGHIJ67890', 'Produto Y', 30.00, '98765432109876');

-- Populando a tabela Estoque
INSERT INTO Estoque (nome, dtForne, dtVal, cpfFunc)
VALUES ('Lote A', '2023-11-01', '2024-11-01', '11122233344'),
       ('Lote B', '2023-10-15', '2024-10-15', '44455566677');

-- Populando a tabela HospedagemUsaTipo
INSERT INTO HospedagemUsaTipo (idHosp, idTipo)
VALUES (1, 1),
       (2, 2);

-- Populando a tabela HospedagemPossuiPgto
INSERT INTO HospedagemPossuiPgto (idHosp, codPgto, valor)
VALUES (1, 1, 300.00),
       (2, 2, 250.00);

-- Populando a tabela EstoqueTemProduto
INSERT INTO EstoqueTemProduto (idLote, codBarras, valor)
VALUES (1, 'ABCDE12345', 10),
       (2, 'FGHIJ67890', 15);

-- Populando a tabela PagamentoPossuiCadastro
INSERT INTO PagamentoPossuiCadastro (codPgto, numCartao)
VALUES (1, '1111222233334444'),
       (2, '5555666677778888');



