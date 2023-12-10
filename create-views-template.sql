
-- Uma visão que mostra quantos atendimentos cada recepcionista fez.
CREATE VIEW RecepcionistasAtendimentos AS
SELECT f.cpf, f.nome AS nomeFuncionario, COUNT(b.idHosp) AS numHospedagensAtendidas
FROM Funcionario f
LEFT JOIN Balcao b ON f.cpf = b.cpfFunc
WHERE f.cargo = 'Recepcionista'
GROUP BY f.cpf, f.nome;

-- Uma visão que mostra detalhes das hospedagens com informações sobre os tipos de quarto utilizados:
CREATE VIEW DetalhesHospedagemTipoQuarto AS
SELECT h.idHosp, h.dataHosp, h.dtPreSaida, tq.padrão AS tipoQuarto, tq.capacidade, tq.preço
FROM Hospedagem h
LEFT JOIN HospedagemUsaTipo hut ON h.idHosp = hut.idHosp
LEFT JOIN TipoQuarto tq ON hut.idTipo = tq.idTipo;

-- Uma visão que relaciona informações sobre fornecedores e os produtos que eles fornecem:

CREATE VIEW FornecedorProdutos AS
SELECT f.cnpj, f.rzSocial AS nomeFornecedor, p.codBarras, p.descricao AS descricaoProduto, p.valorU AS valorUnitario
FROM Fornecedor f
LEFT JOIN Produto p ON f.cnpj = p.cnpjForn;

--Uma visão que relaciona o estoque de produtos com os funcionários responsáveis por eles:

CREATE VIEW EstoqueFuncionario AS
SELECT e.idLote, e.nome AS nomeProduto, e.dtForne, e.dtVal, f.nome AS nomeFuncionario
FROM Estoque e
LEFT JOIN Funcionario f ON e.cpfFunc = f.cpf;

--Uma visão que mostra os telefones associados aos fornecedores:

CREATE VIEW DetalhesTelefoneFornecedor AS
SELECT t.cnpjForn, f.rzSocial AS nomeFornecedor, t.telefone
FROM Telefone t
LEFT JOIN Fornecedor f ON t.cnpjForn = f.cnpj;
