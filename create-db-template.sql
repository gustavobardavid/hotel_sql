
CREATE TABLE IF NOT EXISTS Cliente 
( 
 cpf CHARACTER(11) UNIQUE,  
 nome VARCHAR(100) NOT NULL,  
 dtNasc DATE NOT NULL,  
 pgtoPreferencial VARCHAR(10),
 telefone VARCHAR(10) NOT NULL, 
 CONSTRAINT ClientePK PRIMARY KEY(cpf) 
); 
CREATE TABLE IF NOT EXISTS Funcionario 
( 
 cpf CHARACTER(11) UNIQUE,  
 nome VARCHAR(100) NOT NULL,  
 salario FLOAT(2),  
 telefone VARCHAR(10),  
 dtAdmissao DATE NOT NULL,
 cargo VARCHAR(20) NOT NULL,  
 CONSTRAINT FuncionarioPK PRIMARY KEY(cpf),
 CONSTRAINT SalPositivo CHECK (salario>0)
); 
CREATE TABLE IF NOT EXISTS Hospedagem 
( 
 idHosp INTEGER,  
 dataHosp DATE NOT NULL,  
 dtPreSaida DATE NOT NULL,  
 cpfCliente CHARACTER(11),
 CONSTRAINT HospedagemPK PRIMARY KEY (idHosp),
 CONSTRAINT cpfClienteFK FOREIGN KEY (cpfCliente)
 REFERENCES Cliente(cpf)
); 
CREATE TABLE IF NOT EXISTS Reserva 
( 
 idHosp INTEGER,  
 dtEntrada DATE NOT NULL,  
 status VARCHAR(10) NOT NULL,
 CONSTRAINT ReservaPK PRIMARY KEY (idHosp),
 CONSTRAINT ReservaFK FOREIGN KEY (idHosp) 
 REFERENCES Hospedagem(idHosp)  
); 
CREATE TABLE IF NOT EXISTS Balcao 
( 
 idHosp INTEGER,  
 dtEntrada DATE NOT NULL,  
 comissao FLOAT(2),  
 cpfFunc CHARACTER(11),
 CONSTRAINT BalcaoPK PRIMARY KEY(idHosp),
 CONSTRAINT BalcaoFK FOREIGN KEY(idHosp)
 REFERENCES Hospedagem(idHosp),
 CONSTRAINT CpfFuncFK FOREIGN KEY(cpfFunc) 
 REFERENCES Funcionario(cpf)
); 
CREATE TABLE IF NOT EXISTS TipoQuarto 
( 
 idTipo INTEGER,  
 padrão VARCHAR(10) NOT NULL,  
 capacidade INT NOT NULL,  
 preço FLOAT(2) NOT NULL,  
 CONSTRAINT TipoPK PRIMARY KEY(idTipo)
); 
CREATE TABLE IF NOT EXISTS Quarto 
( 
 numQuarto INT,  
 andar VARCHAR(10) NOT NULL,  
 idTipo INTEGER,  
 cpfFunc CHARACTER(11),
 CONSTRAINT QuartoPK PRIMARY KEY(numQuarto),
 CONSTRAINT TipoFK Foreign Key (idTipo) 
 REFERENCES TipoQuarto(idTipo),
 CONSTRAINT LimpaFK Foreign Key (cpfFunc) 
 REFERENCES Funcionario(cpf)
); 
CREATE TABLE IF NOT EXISTS FormaPagamento 
( 
 código INTEGER,  
 valor FLOAT(2) NOT NULL,  
 dtPgto DATE NOT NULL,
 CONSTRAINT CodigoPK PRIMARY KEY(código) 
); 

CREATE TABLE IF NOT EXISTS PIX 
( 
 cpfPagador CHARACTER(11),  
 codPgto INTEGER,
 CONSTRAINT codPgtoPixPK PRIMARY KEY(codPgto), 
 CONSTRAINT cpfPagadorFK FOREIGN KEY(cpfPagador) 
 REFERENCES Cliente(cpf), 
 CONSTRAINT codPgtoFK FOREIGN KEY(codPgto) 
 REFERENCES FormaPagamento(código) 
); 

CREATE TABLE IF NOT EXISTS Cartão 
( 
 codPgto INTEGER,
 CONSTRAINT codPgtoCartaoPK PRIMARY KEY(codPgto), 
 CONSTRAINT codPgtoFK FOREIGN KEY(codPgto) 
 REFERENCES FormaPagamento(código)
); 

CREATE TABLE IF NOT EXISTS CadastroCartao 
( 
 num VARCHAR(25),  
 dtVal DATE NOT NULL,  
 titular VARCHAR(100) NOT NULL,
 CONSTRAINT NumPK PRIMARY KEY(num)  
); 

CREATE TABLE IF NOT EXISTS Fornecedor 
( 
 cnpj VARCHAR(45),  
 rzSocial VARCHAR(100) NOT NULL,
 CONSTRAINT cnpjPK PRIMARY KEY(cnpj)    
); 

CREATE TABLE IF NOT EXISTS Telefone (
    cnpjForn VARCHAR(45),
    telefone VARCHAR(10) NOT NULL
    CONSTRAINT cnpjFornPK PRIMARY KEY,
    CONSTRAINT cnpjFornFK Foreign Key(cnpjForn) 
    REFERENCES Fornecedor(cnpj)
);
CREATE TABLE IF NOT EXISTS Produto        
( 
 codBarras VARCHAR(50),  
 descricao VARCHAR(45) NOT NULL,  
 valorU FLOAT(2) NOT NULL,  
 cnpjForn VARCHAR(45),
 CONSTRAINT CodBarrasPK PRIMARY KEY(codBarras),
 CONSTRAINT cnpjFornFK FOREIGN KEY(cnpjForn)
 REFERENCES Fornecedor(cnpj) 
); 

CREATE TABLE IF NOT EXISTS Estoque 
( 
 idLote INTEGER,  
 nome VARCHAR(100) NOT NULL,  
 dtForne DATE NOT NULL,  
 dtVal DATE NOT NULL ,  
 cpfFunc CHARACTER(11),
 CONSTRAINT idLotePK PRIMARY KEY(idLote),
 CONSTRAINT cpfFuncFK FOREIGN KEY(cpfFunc)
 REFERENCES Funcionario(cpf)  
); 
CREATE TABLE IF NOT EXISTS HospedagemUsaTipo 
( 
 idHosp INTEGER,  
 idTipo INTEGER,
 CONSTRAINT idHospIdTipoPK PRIMARY KEY(idHosp,idTipo),
 CONSTRAINT idHospFK FOREIGN KEY(idHosp) 
 REFERENCES Hospedagem(idHosp),
 CONSTRAINT idTipoFK FOREIGN KEY(idTipo) 
 REFERENCES TipoQuarto(idTipo)
); 

CREATE TABLE IF NOT EXISTS HospedagemPossuiPgto 
( 
 idHosp INTEGER,
 codPgto INTEGER,
 CONSTRAINT idHospCodPgtoPK PRIMARY KEY(idHosp, codPgto),
 CONSTRAINT idHospFK FOREIGN KEY(idHosp) 
 REFERENCES Hospedagem(idHosp),
 CONSTRAINT codPgtoFK FOREIGN KEY(codPgto) 
 REFERENCES FormaPagamento(código) 
); 
CREATE TABLE IF NOT EXISTS EstoqueTemProduto 
( 
 idLote INTEGER,
 codBarras VARCHAR(50),
 CONSTRAINT idLoteCodBarrasPK PRIMARY KEY(idLote,codBarras),
 CONSTRAINT idLoteFK FOREIGN KEY(idLote)
 REFERENCES Estoque(idLote),
 CONSTRAINT codBarrasFK FOREIGN KEY(codBarras)
 REFERENCES Produto(codBarras)
); 

CREATE TABLE IF NOT EXISTS PagamentoPossuiCadastro 
( 
    codPgto INTEGER,
    numCartao VARCHAR(25),
    CONSTRAINT codPgtoNumCartaoPK PRIMARY KEY(codPgto, numCartao),
    CONSTRAINT codPgtoFK FOREIGN KEY(codPgto)
    REFERENCES FormaPagamento(código),
    CONSTRAINT numCartaoFK Foreign Key(numCartao) 
    REFERENCES CadastroCartao(num)
); 


