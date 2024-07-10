Create database PDV;
USE PDV;
CREATE TABLE cliente(
	idcliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR (45) NOT NULL,
    data_nasc DATE NOT NULL,
    email VARCHAR (45) NOT NULL,
    bairro VARCHAR (45) NOT NULL,
    cidade VARCHAR (45) NOT NULL
);

CREATE TABLE produto(
	idproduto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_produto VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    valor DECIMAL(8,2) NOT NULL,
    qtd INT NOT NULL
);

CREATE TABLE usuario(
	idusuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_usuario VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL
);

CREATE TABLE administrador(
    idADM INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeADM VARCHAR (50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    senha VARCHAR (10) NOT NULL
);

CREATE TABLE estoque(
	idestoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_cad DATE NOT NULL,
    qtdestq INT NOT NULL,
    produto_id INT NOT NULL,
    usuario_id INT NULL,
    FOREIGN KEY (produto_id) references produto(idproduto),
    FOREIGN KEY (usuario_id) references usuario(idusuario)
);

CREATE TABLE compra(
	idcompra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_compra DATE NOT NULL,
    loja VARCHAR(45) NOT NULL,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    usuario_id INT NOT NULL,
    
    FOREIGN KEY (cliente_id) references cliente(idcliente),
    FOREIGN KEY (produto_id) references produto(idproduto),
    FOREIGN KEY (usuario_id) references usuario(idusuario)
);

INSERT INTO cliente (nome, data_nasc, email, bairro, cidade) 
VALUES 
('João Silva', '1990-05-15', 'joao@email.com', 'Centro', 'São Paulo'),
('Maria Santos', '1985-09-20', 'maria@email.com', 'Copacabana', 'Rio de Janeiro'),
('Pedro Oliveira', '1988-03-10', 'pedro@email.com', 'Barra da Tijuca', 'Rio de Janeiro'),
('Ana Souza', '1995-11-28', 'ana@email.com', 'Ipanema', 'Rio de Janeiro'),
('Carlos Ferreira', '1979-07-03', 'carlos@email.com', 'Morumbi', 'São Paulo');

INSERT INTO produto (nome_produto, marca, valor, qtd) 
VALUES 
('Rosas Vermelhas', 'Fiori Belle', 25.00, 50),
('Lírios Brancos', 'Petali Fioriti', 30.00, 40),
('Orquídea Rosa', 'Jardim Encantado', 40.00, 30),
('Girassóis', 'Primavera Floricultura', 20.00, 60),
('Margaridas Amarelas', 'Caminho das Flores', 15.00, 80);

INSERT INTO usuario (nome_usuario, senha)
VALUES 
('ana_silva', 'senha123'),
('joao_pereira', 'abc456'),
('maria_oliveira', '789xyz'),
('pedro_gomes', 'senha456'),
('laura_santos', 'abc123');

INSERT INTO compra (data_compra, loja, cliente_id, produto_id, usuario_id)
VALUES 
('2024-04-01', 'Floricultura ABC', 3, 5, 2),
('2024-04-02', 'Petali Fioriti', 1, 4, 4),
('2024-04-03', 'Jardim Encantado', 5, 1, 3),
('2024-04-04', 'Primavera Floricultura', 2, 3, 5),
('2024-04-05', 'Caminho das Flores', 4, 2, 1);

INSERT INTO estoque (data_cad, qtdestq, produto_id, usuario_id)
VALUES 
('2024-04-01', 120, 3, 2),
('2024-04-02', 90, 1, 4),
('2024-04-03', 110, 5, 1),
('2024-04-04', 70, 4, 2),
('2024-04-05', 100, 2, 3);





