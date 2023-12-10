-- Índice para a tabela Cliente no campo 'cpf'
CREATE INDEX idxCpf ON Cliente(cpf);

-- Índice para a tabela Funcionario no campo 'cpf'
CREATE INDEX idxCpfFuncionario ON Funcionario(cpf);

-- Índice para a tabela Hospedagem no campo 'idHosp'
CREATE INDEX idxIdHospHospedagem ON Hospedagem(idHosp);

-- Índice para a tabela Reserva no campo 'idHosp'
CREATE INDEX idxIdHospReserva ON Reserva(idHosp);

-- Índice para a tabela Balcao no campo 'idHosp'
CREATE INDEX idxIdHospBalcao ON Balcao(idHosp);

-- Índice para a tabela TipoQuarto no campo 'idTipo'
CREATE INDEX idxIdTipoTipoquarto ON TipoQuarto(idTipo);

-- Índice para a tabela Quarto no campo 'numQuarto'
CREATE INDEX idxNumQuartoQuarto ON Quarto(numQuarto);

-- Índice para a tabela FormaPagamento no campo 'código'
CREATE INDEX idxCodigoFormapagamento ON FormaPagamento(código);

-- Índice para a tabela PIX no campo 'cpfPagador'
CREATE INDEX idxCpfPagadorPix ON PIX(cpfPagador);

-- Índice para a tabela Cartão no campo 'codPgto'
CREATE INDEX idxCodPgtoCartao ON Cartão(codPgto);

-- Índice para a tabela CadastroCartao no campo 'num'
CREATE INDEX idxNumCadastroCartao ON CadastroCartao(num);

-- Índice para a tabela Fornecedor no campo 'cnpj'
CREATE INDEX idxCnpjFornecedor ON Fornecedor(cnpj);

-- Índice para a tabela Produto no campo 'codBarras'
CREATE INDEX idxCodBarrasProduto ON Produto(codBarras);

-- Índice para a tabela Estoque no campo 'idLote'
CREATE INDEX idxIdLoteEstoque ON Estoque(idLote);

-- Índice para a tabela HospedagemUsaTipo nos campos 'idHosp' e 'idTipo'
CREATE INDEX idxIdHospIdTipoHospedagemUsaTipo ON HospedagemUsaTipo(idHosp, idTipo);

-- Índice para a tabela HospedagemPossuiPgto nos campos 'idHosp' e 'codPgto'
CREATE INDEX idxIdHospCodPgtoHospedagemPossuiPgto ON HospedagemPossuiPgto(idHosp, codPgto);

-- Índice para a tabela EstoqueTemProduto nos campos 'idLote' e 'codBarras'
CREATE INDEX idxIdLoteCodBarrasEstoqueTemProduto ON EstoqueTemProduto(idLote, codBarras);

-- Índice para a tabela PagamentoPossuiCadastro nos campos 'codPgto' e 'numCartao'
CREATE INDEX idxCodPgtoNumCartaoPagamentoPossuiCadastro ON PagamentoPossuiCadastro(codPgto, numCartao);
