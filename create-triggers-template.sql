CREATE OR REPLACE FUNCTION verificaHospedagensCliente()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Hospedagem WHERE cpfCliente = OLD.cpf) THEN
        RAISE EXCEPTION 'Não é possível excluir o cliente, pois existem hospedagens associadas a ele!';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER restricaoExclusaoCliente
BEFORE DELETE ON Cliente
FOR EACH ROW
EXECUTE FUNCTION verificaHospedagensCliente();

CREATE OR REPLACE FUNCTION verificaDatasEstoque()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.dtVal < NEW.dtForne THEN
        RAISE EXCEPTION 'Data de validade não pode ser anterior à data de fornecimento!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER restricaoDataEstoque
BEFORE INSERT ON Estoque
FOR EACH ROW
EXECUTE FUNCTION verificaDatasEstoque();

CREATE OR REPLACE FUNCTION verificaAtualizacaoCpfCliente()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.cpf <> NEW.cpf THEN
        RAISE EXCEPTION 'Não é permitido alterar o CPF do cliente!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER restricaoAtualizacaoCpfCliente
BEFORE UPDATE ON Cliente
FOR EACH ROW
EXECUTE FUNCTION verificaAtualizacaoCpfCliente();
