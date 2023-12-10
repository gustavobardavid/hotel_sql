
-- atualizar salario 
CREATE OR REPLACE PROCEDURE AtualizarSalarioFuncionario(
    IN cpfAtual CHARACTER(11),
    IN novoSalario FLOAT(2)
)
AS 
$$
BEGIN
    UPDATE Funcionario SET salario = novoSalario WHERE cpf = cpfAtual;
END 
$$
LANGUAGE plpgsql;

-- Atualizar a data de saída prevista de uma hospedagem
CREATE OR REPLACE PROCEDURE AtualizarDataPreSaidaHospedagem(
    IN idHospAtual INTEGER,
    IN novaDtPreSaida DATE
)
AS 
$$
BEGIN
    UPDATE Hospedagem SET dtPreSaida = novaDtPreSaida WHERE idHosp = idHospAtual;
END 
$$
LANGUAGE plpgsql;

-- Atualizar o valor de um produto no estoque
CREATE OR REPLACE PROCEDURE AtualizarValorProdutoNoEstoque(
    IN codBarrasAtual VARCHAR(50),
    IN novoValor FLOAT(2)
)
AS 
$$
BEGIN
    UPDATE Produto SET valorU = novoValor WHERE codBarras = codBarrasAtual;
END 
$$
LANGUAGE plpgsql;

-- Inserir um novo telefone para um fornecedor:
CREATE OR REPLACE PROCEDURE InserirTelefoneFornecedor(
    IN cnpjForn VARCHAR(45),
    IN telefone VARCHAR(10)
)
AS 
$$
BEGIN
    INSERT INTO Telefone(cnpjForn, telefone)
    VALUES (cnpjForn, telefone);
END 
$$
LANGUAGE plpgsql;
