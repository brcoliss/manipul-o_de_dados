-- ========================================
-- 1) CRIAÇÃO DAS TABELAS
-- ========================================

-- Tabela Funcionario
CREATE TABLE Funcionario(
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeFuncionario VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    celular CHAR(11) NOT NULL
);

-- Tabela Cliente
CREATE TABLE Cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2),
    tipoLogradouro VARCHAR(20),
    nomeLogradouro VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(100)
);

-- Tabela Equipamento
CREATE TABLE Equipamento(
    idEquipamento INT PRIMARY KEY AUTO_INCREMENT,
    nomeEquipamento VARCHAR(50) NOT NULL,
    qtd INT NOT NULL,
    valorHora DECIMAL(5,2) NOT NULL
);

-- Tabela Aluguel
CREATE TABLE Aluguel(
    idAluguel INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idFuncionario INT NOT NULL,
    dataHoraRetirada DATETIME NOT NULL,
    dataHoraDevolucao DATETIME,
    valorAPagar DECIMAL(10,2),
    valorPago DECIMAL(10,2),
    pago BIT,
    formaPagamento ENUM('DINHEIRO','PIX','DÉBITO','CRÉDITO','OUTROS'),
    qtVezes INT,
    CONSTRAINT fk_Aluguel_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
    CONSTRAINT fk_Aluguel_Funcionario FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario)
);

-- Tabela AluguelEquipamento
CREATE TABLE AluguelEquipamento(
    idAluguelEquipamento INT PRIMARY KEY AUTO_INCREMENT,
    idEquipamento INT NOT NULL,
    idAluguel INT NOT NULL,
    valorItem DECIMAL(10,2) NOT NULL,
    valorUnitario DECIMAL(10,2) NOT NULL,
    qtd INT NOT NULL,
    CONSTRAINT fk_AluguelEquipamento_Equipamento FOREIGN KEY (idEquipamento) REFERENCES Equipamento (idEquipamento),
    CONSTRAINT fk_AluguelEquipamento_Aluguel FOREIGN KEY (idAluguel) REFERENCES Aluguel (idAluguel)
);

-- ========================================
-- 2) INSERIR CLIENTES (primeiro bloco)
-- ========================================

INSERT INTO Cliente (nomeCliente, cpf, email, cidade, estado, tipoLogradouro, nomeLogradouro, numero, complemento, bairro)
VALUES
('Donald', '11111111101', 'donald@uol.com.br', 'Santos', 'SP', 'Rua', 'das Flores', '10', NULL, 'Centro'),
('Margarida', '11111111102', 'margarida@uol.com.br', 'São Vicente', 'SP', 'Rua', 'Brasil', '200', NULL, 'Centro'),
('Patinhas', '11111111103', 'patinhas@uol.com.br', 'Florianópolis', 'SC', 'Rua', 'Beira Mar', '50', NULL, 'Centro'),
('Huguinho', '11111111104', 'huguinho@gmail.com', 'Santos', 'SP', 'Avenida', 'Ana Costa', '120', 'Apartamento 34', 'Gonzaga'),
('Luizinho', '11111111105', 'luizinho@gmail.com', 'Praia Grande', 'SP', 'Avenida', 'Kennedy', '300', 'Apartamento 21', 'Boqueirão'),
('Zezinho', '11111111106', 'zezinho@gmail.com', 'São Vicente', 'SP', 'Rua', 'Itararé', '45', NULL, 'Centro'),
('Pardal', '11111111107', 'pardal@uol.com.br', 'Santos', 'SP', 'Rua', 'XV de Novembro', '89', NULL, 'Centro'),
('Zé Carioca', '11111111108', 'zecarioca@gmail.com', 'Rio de Janeiro', 'RJ', 'Avenida', 'Atlântica', '500', NULL, 'Copacabana'),
('Mickey', '11111111109', 'mickey@hotmail.com', 'Recife', 'PE', 'Rua', 'Boa Vista', '77', 'Apartamento 15', 'Centro');

-- ========================================
-- 3) INSERIR CLIENTES (segundo bloco)
-- ========================================

INSERT INTO Cliente (nomeCliente, cpf, email, cidade, estado, tipoLogradouro, nomeLogradouro, numero, complemento, bairro)
VALUES
('Minie', '11111111201', 'minie@gmail.com', 'Recife', 'PE', 'Rua', 'Boa Vista', '10', NULL, 'Centro'),
('Pateta', '11111111202', 'pateta@gmail.com', 'Não Informado', 'NI', 'Rua', 'Principal', '1', NULL, 'Centro'),
('Branca de Neve', '11111111203', 'brancadeneve@hotmail.com', 'São Joaquim', 'SC', 'Rua', 'das Flores', '20', NULL, 'Centro'),
('Aladin', '11111111204', 'aladin@gmail.com', 'Belém', 'PA', 'Rua', 'Princesa', '50', NULL, 'Centro'),
('Cinderela', '11111111205', 'cinderela@hotmail.com', 'Goiania', 'GO', 'Rua', 'Real', '100', NULL, 'Centro'),
('Mulan', '11111111206', 'mulan@gmail.com', 'Rio das Ostras', 'RJ', 'Rua', 'das Pedras', '12', NULL, 'Centro'),
('Moana', '11111111207', 'moana@gmail.com', 'Parati', 'RJ', 'Rua', 'Beira Mar', '30', NULL, 'Centro'),
('Asnésio', '11111111208', 'asnesio@uol.com.br', 'Belo Horizonte', 'MG', 'Rua', 'Central', '50', NULL, 'Centro'),
('Maga Patalógica', '11111111209', 'magapatalogica@gmail.com', 'Cubatão', 'SP', 'Rua', 'das Nações', '45', NULL, 'Centro'),
('Capitão Boeing', '11111111210', 'capitaoboeing@uol.com.br', 'Manaus', 'AM', 'Avenida', 'Amazonas', '100', NULL, 'Centro'),
('Pão Duro Mac Money', '11111111211', 'paoduromacmoney@ig.com.br', 'Osasco', 'SP', 'Rua', 'Brasil', '200', NULL, 'Centro');

-- ========================================
-- 4) INSERIR FUNCIONÁRIOS
-- ========================================

INSERT INTO Funcionario (nomeFuncionario, cpf, celular)
VALUES
('Cebolinha', '22222222201', '11988887777'),
('Cascão', '22222222202', '11977776666'),
('Chico Bento', '22222222203', '11966665555');

-- ========================================
-- 5) INSERIR EQUIPAMENTOS
-- ========================================

INSERT INTO Equipamento (nomeEquipamento, qtd, valorHora)
VALUES
('Cadeiras 02 posições', 50, 2.00),
('Cadeiras 04 posições', 100, 3.50),
('Guarda Sol P', 40, 2.00),
('Guarda Sol G', 60, 3.00),
('Mesinha', 30, 1.50);

-- ========================================
-- 6) ALUGUEL PATETA - 1 cadeira 2 posições
-- ========================================

INSERT INTO Aluguel (idCliente, idFuncionario, dataHoraRetirada, pago)
VALUES
(
    (SELECT idCliente FROM Cliente WHERE nomeCliente='Pateta'),
    (SELECT idFuncionario FROM Funcionario WHERE nomeFuncionario='Cebolinha'),
    '2024-12-08 00:00:00',
    0
);

INSERT INTO AluguelEquipamento (idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES
(
    (SELECT idEquipamento FROM Equipamento WHERE nomeEquipamento='Cadeiras 02 posições'),
    (SELECT MAX(idAluguel) FROM Aluguel),
    2.00,
    2.00,
    1
);

UPDATE Equipamento
SET qtd = qtd - 1
WHERE nomeEquipamento='Cadeiras 02 posições';

-- ========================================
-- 7) ALUGUEL MICKEY - 2 cadeiras 4 posições + 1 guarda sol G
-- ========================================

INSERT INTO Aluguel (idCliente, idFuncionario, dataHoraRetirada, pago)
VALUES
(
    (SELECT idCliente FROM Cliente WHERE nomeCliente='Mickey'),
    (SELECT idFuncionario FROM Funcionario WHERE nomeFuncionario='Chico Bento'),
    '2024-12-10 00:00:00',
    0
);
INSERT INTO AluguelEquipamento (idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES
(
    (SELECT idEquipamento FROM Equipamento WHERE nomeEquipamento='Cadeiras 04 posições'),
    (SELECT MAX(idAluguel) FROM Aluguel),
    3.50,
    3.50,
    2
);

INSERT INTO AluguelEquipamento (idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES
(
    (SELECT idEquipamento FROM Equipamento WHERE nomeEquipamento='Guarda Sol G'),
    (SELECT MAX(idAluguel) FROM Aluguel),
    3.00,
    3.00,
    1
);

UPDATE Equipamento SET qtd = qtd - 2 WHERE nomeEquipamento='Cadeiras 04 posições';
UPDATE Equipamento SET qtd = qtd - 1 WHERE nomeEquipamento='Guarda Sol G';

-- ========================================
-- 8) ALUGUEL DONALD - 1 guarda sol P
-- ========================================

INSERT INTO Aluguel (idCliente, idFuncionario, dataHoraRetirada, pago)
VALUES
(
    (SELECT idCliente FROM Cliente WHERE nomeCliente='Donald'),
    (SELECT idFuncionario FROM Funcionario WHERE nomeFuncionario='Cebolinha'),
    '2024-12-27 00:00:00',
    0
);

INSERT INTO AluguelEquipamento (idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES
(
    (SELECT idEquipamento FROM Equipamento WHERE nomeEquipamento='Guarda Sol P'),
    (SELECT MAX(idAluguel) FROM Aluguel),
    2.00,
    2.00,
    1
);

UPDATE Equipamento SET qtd = qtd - 1 WHERE nomeEquipamento='Guarda Sol P';

-- ========================================
-- 9) ALUGUEL HUGUINHO - 2 cadeiras 4 posições + 1 guarda sol G
-- ========================================

INSERT INTO Aluguel (idCliente, idFuncionario, dataHoraRetirada, pago)
VALUES
(
    (SELECT idCliente FROM Cliente WHERE nomeCliente='Huguinho'),
    (SELECT idFuncionario FROM Funcionario WHERE nomeFuncionario='Chico Bento'),
    '2024-12-28 00:00:00',
    0
);

INSERT INTO AluguelEquipamento (idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES
(
    (SELECT idEquipamento FROM Equipamento WHERE nomeEquipamento='Cadeiras 04 posições'),
    (SELECT MAX(idAluguel) FROM Aluguel),
    3.50,
    3.50,
    2
);

INSERT INTO AluguelEquipamento (idEquipamento, idAluguel, valorItem, valorUnitario, qtd)
VALUES
(
    (SELECT idEquipamento FROM Equipamento WHERE nomeEquipamento='Guarda Sol G'),
    (SELECT MAX(idAluguel) FROM Aluguel),
    3.00,
    3.00,
    1
);

UPDATE Equipamento SET qtd = qtd - 2 WHERE nomeEquipamento='Cadeiras 04 posições';
UPDATE Equipamento SET qtd = qtd - 1 WHERE nomeEquipamento='Guarda Sol G';

-- ========================================
-- 10) Listar clientes
-- ========================================
SELECT nomeCliente, email, cidade, estado, tipoLogradouro, nomeLogradouro, numero, complemento, bairro
FROM Cliente
ORDER BY nomeCliente ASC;

-- ========================================
-- 11) Listar funcionários
-- ========================================
SELECT nomeFuncionario, cpf, celular
FROM Funcionario
ORDER BY nomeFuncionario ASC;

-- ========================================
-- 12) Listar alugueis
-- ========================================
SELECT 
    A.idAluguel,
    C.nomeCliente,
    F.nomeFuncionario,
    A.dataHoraRetirada,
    A.dataHoraDevolucao,
    A.valorAPagar,
    A.valorPago,
    A.pago,
    A.formaPagamento
FROM Aluguel A
INNER JOIN Cliente C ON A.idCliente = C.idCliente
INNER JOIN Funcionario F ON A.idFuncionario = F.idFuncionario
ORDER BY A.dataHoraRetirada ASC;

-- ========================================
-- 13) Clientes da baixada santista
-- ========================================
SELECT nomeCliente, cidade, estado
FROM Cliente
WHERE cidade IN ('Santos', 'São Vicente', 'Praia Grande', 'Guarujá', 'Cubatão', 'Bertioga', 'Mongaguá', 'Itanhaém', 'Peruíbe')
ORDER BY nomeCliente ASC;

-- ========================================
-- 14) Produtos em estoque (decrescente)
-- ========================================
SELECT nomeEquipamento, qtd
FROM Equipamento
ORDER BY qtd DESC;

-- ========================================
-- 15) Clientes que moram em casa
-- ========================================
SELECT nomeCliente, cidade, estado
FROM Cliente
WHERE complemento IS NULL
ORDER BY nomeCliente ASC;

-- ========================================
-- 16) Clientes que não moram em SP
-- ========================================
SELECT nomeCliente, estado
FROM Cliente
WHERE estado <> 'SP';

-- ========================================
-- 17) Clientes que começam com A
-- ========================================
SELECT nomeCliente
FROM Cliente
WHERE nomeCliente LIKE 'A%';

-- ========================================
-- 18) Clientes que começam com M e vivem em PE
-- ========================================
SELECT nomeCliente, estado
FROM Cliente
WHERE nomeCliente LIKE 'M%' AND estado='PE';

-- ========================================
-- 19) Apenas cadeiras em ordem de quantidade
-- ========================================
SELECT nomeEquipamento, qtd
FROM Equipamento
WHERE nomeEquipamento LIKE 'Cadeiras%'
ORDER BY qtd DESC;

-- ========================================
-- 20) Aluguéis entre 25/12/2024 e 31/12/2024
-- ========================================
SELECT *
FROM Aluguel
WHERE dataHoraRetirada >= '2024-12-25 00:00:00'
  AND dataHoraRetirada <= '2024-12-31 23:59:59'
ORDER BY dataHoraRetirada ASC;