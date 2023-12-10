--Junções
--Essa consulta buscará detalhes das hospedagens com informações do cliente associado.
SELECT h.idHosp, h.dataHosp, h.dtPreSaida, c.nome AS nomeCliente, c.cpf AS cpfCliente
FROM Hospedagem h
INNER JOIN Cliente c ON h.cpfCliente = c.cpf;
-- Essa consulta trará informações sobre os quartos e os funcionários associados a eles.
SELECT tq.idTipo, tq.padrão, tq.capacidade, tq.preço, q.numQuarto, q.andar, f.nome AS funcionarioResponsavel
FROM TipoQuarto tq
INNER JOIN Quarto q ON tq.idTipo = q.idTipo
LEFT JOIN Funcionario f ON q.cpfFunc = f.cpf;

-- Envolvendo Null
--Esta consulta buscará funcionários que não possuem número de telefone registrado na tabela Funcionario.
SELECT *
FROM Funcionario
WHERE telefone IS NULL;

--Esta consulta trará informações sobre os quartos que não possuem um funcionário responsável 
SELECT *
FROM Quarto
WHERE cpfFunc IS NULL;

-- Substrings
--Essa consulta buscará clientes cujos nomes contenham 'Andrade'
SELECT *
FROM Cliente
WHERE nome LIKE '%Andrade%';
--Esta consulta trará produtos cujas descrições comecem com a letra M
SELECT *
FROM Produto
WHERE descricao LIKE 'M%';

-- Ordenação

--Esta consulta ordenará os funcionários em ordem decrescente de salário na tabela Funcionario.
SELECT *
FROM Funcionario
ORDER BY salario DESC;
-- Esta consulta trará os produtos ordenados pelo valor unitário em ordem crescente na tabela Produto.
SELECT *
FROM Produto
ORDER BY valorU ASC;

-- Aninhadas
--Essa consulta utiliza uma subconsulta para encontrar os funcionários que possuem o maior salário na tabela Funcionario.
SELECT *
FROM Funcionario
WHERE salario = (
    SELECT MAX(salario)
    FROM Funcionario
);
--Essa consulta utiliza uma subconsulta para encontrar o fornecedor com a maior quantidade de produtos em estoque na tabela EstoqueTemProduto.
SELECT p.*
FROM Produto p
WHERE codBarras IN (
    SELECT codBarras
    FROM EstoqueTemProduto
    GROUP BY codBarras
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Correlacionadas Aninhadas
--Esta consulta utiliza uma subconsulta correlacionada para encontrar funcionários com salários superiores à média de salários da tabela 
SELECT *
FROM Funcionario f
WHERE salario > (
    SELECT AVG(salario)
    FROM Funcionario
);
--Esta consulta utiliza uma subconsulta correlacionada para encontrar os funcionários que realizaram o maior número de hospedagens 
SELECT f.*
FROM Funcionario f
WHERE f.cpf IN (
    SELECT b.cpfFunc
    FROM Balcao b
    GROUP BY b.cpfFunc
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- Esta consulta trará informações sobre os pagamentos que não estão associados a Pix nem cartão. Ou seja, foram pagos em dinheiro
SELECT *
FROM FormaPagamento fp
WHERE NOT EXISTS (
    SELECT *
    FROM PIX p
    WHERE p.codPgto = fp.código
) AND NOT EXISTS (
    SELECT *
    FROM Cartão c
    WHERE c.codPgto = fp.código
);
