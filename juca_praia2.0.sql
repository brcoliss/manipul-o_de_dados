CREATE TABLE Funcionario(
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nomeFuncionario VARCHAR(50) NOT null,
cpf CHAR(11) NOT NULL UNIQUE,
celular CHAR(11) NOT NULL
)

CREATE TABLE Cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE
)

CREATE TABLE Equipamento(
idEquipamento INT PRIMARY KEY AUTO_INCREMENT,
nomeEquipamento VARCHAR(50) NOT null,
qtd INT NOT NULL,
valorHora DECIMAL(5,2) NOT null
)

CREATE TABLE Aluguel(
idAluguel INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL,
idFuncionario INT NOT NULL,
dataHoraRetirada DATETIME NOT null,
dataHoraDevolucao DATETIME,
valorAPagar DECIMAL(10,2),
valorPago DECIMAL(10,2),
pago BIT,
formaPagamento VARCHAR(50),
qtVezes INT,
CONSTRAINT fk_Aluguel_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
CONSTRAINT fk_Aluguel_Funcionario FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario),
CONSTRAINT ck_formaPagamento CHECK (formaPagamento IN ('DINHEIRO','PIX','DÉBITO','CRÉDITO','OUTROS'))
)

CREATE TABLE AluguelEquipamento(
idAluguelEquipamento INT PRIMARY KEY AUTO_INCREMENT,
idEquipamento INT NOT NULL,
idAluguel INT NOT NULL,
valorItem DECIMAL(10,2) NOT NULL,
valorUnitario DECIMAL(10,2) NOT NULL,
qtd INT,
CONSTRAINT fk_AluguelEquipamento_Equipamento FOREIGN KEY (idEquipamento) REFERENCES equipamento (idEquipamento),
CONSTRAINT fk_AluguelEquipamento_Aluguel FOREIGN KEY (idAluguel) REFERENCES Aluguel (idAluguel)
)


ALTER TABLE Cliente
ADD tipoLogradouro VARCHAR(20),
ADD nomeLogradouro VARCHAR(100),
ADD numero VARCHAR(10),
ADD complemento VARCHAR(100),
ADD bairro VARCHAR(100);



INSERT INTO Cliente
(nomeCliente, cpf, email, cidade, estado, tipoLogradouro, nomeLogradouro, numero, complemento, bairro)
VALUES
('Donald', '11111111101', 'donald@uol.com.br', 'Santos', 'SP', 'Rua', 'das Flores', '10', NULL, 'Centro'),
('Margarida', '11111111102', 'margarida@uol.com.br', 'São Vicente', 'SP', 'Rua', 'Brasil', '200', 'Apartamento 12', 'Centro'),
('Patinhas', '11111111103', 'patinhas@uol.com.br', 'Florianópolis', 'SC', 'Rua', 'Beira Mar', '50', NULL, 'Centro'),
('Huguinho', '11111111104', 'huguinho@gmail.com', 'Santos', 'SP', 'Avenida', 'Ana Costa', '120', 'Apartamento 34', 'Gonzaga'),
('Luizinho', '11111111105', 'luizinho@gmail.com', 'Praia Grande', 'SP', 'Avenida', 'Kennedy', '300', 'Apartamento 21', 'Boqueirão'),
('Zezinho', '11111111106', 'zezinho@gmail.com', 'São Vicente', 'SP', 'Rua', 'Itararé', '45', NULL, 'Centro'),
('Pardal', '11111111107', 'pardal@uol.com.br', 'Santos', 'SP', 'Rua', 'XV de Novembro', '89', NULL, 'Centro'),
('Zé Carioca', '11111111108', 'zecarioca@gmail.com', 'Rio de Janeiro', 'RJ', 'Avenida', 'Atlântica', '500', NULL, 'Copacabana'),
('Mickey', '11111111109', 'mickey@hotmail.com', 'Recife', 'PE', 'Rua', 'Boa Vista', '77', 'Apartamento 15', 'Centro');



INSERT INTO Cliente (nomeCliente, email, cidade, estado, cpf)
 VALUES
('Minie', 'minie@gmail.com', 'Recife', 'PE', '11111111101'),
('Pateta', 'pateta@gmail.com', 'Não Informado', 'NI', '11111111102'),
('Branca de Neve', 'brancadeneve@hotmail.com', 'São Joaquim', 'SC', '11111111103'),
('Aladin', 'aladin@gmail.com', 'Belém', 'PA', '11111111104'),
('Cinderela', 'cinderela@hotmail.com', 'Goiania', 'GO', '11111111105'),
('Mulan', 'mulan@gmail.com', 'Rio das Ostras', 'RJ', '11111111106'),
('Moana', 'moana@gmail.com', 'Parati', 'RJ', '11111111107'),
('Asnésio', 'asnesio@uol.com.br', 'Belo Horizonte', 'MG', '11111111108'),
('Maga Patalógica', 'magapatalogica@gmail.com', 'Cubatão', 'SP', '11111111109'),
('Capitão Boeing', 'capitaoboeing@uol.com.br', 'Manaus', 'AM', '11111111110'),
('Pão Duro Mac Money', 'paoduromacmoney@ig.com.br', 'Osasco', 'SP', '11111111111');



INSERT INTO funcionario
(nomeFuncionario, cpf, celular)
VALUES
('Cebolinha', '22222222201', '11988887777'),
('Cascão', '22222222202', '11977776666'),
('Chico Bento', '22222222203', '11966665555');




