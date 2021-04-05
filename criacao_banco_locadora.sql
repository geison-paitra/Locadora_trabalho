CREATE DATABASE locadora; 
USE locadora;

/*
TABELA MARCA
Controle de marcas:
a. Campos: código e descrição;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE marca(
    idmarca INT PRIMARY KEY AUTO_INCREMENT, 
    descricao VARCHAR(100) NOT NULL
);

/*
TABELA MODELO
Controle de modelos:
a. Campos: código, código da marca e descrição;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE modelo(
    idmodelo INT PRIMARY KEY AUTO_INCREMENT,
    id_marca INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,

    /* constraints*/
    FOREIGN KEY(id_marca)
    REFERENCES marca(idmarca)
);

/*
TABELA CARRO
Controle de carros:
a. Campos: código, código do modelo, ano, cor, descrição e observações;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE carro(
    idcarro INT PRIMARY KEY AUTO_INCREMENT,
    id_modelo INT NOT NULL,
    ano INT(4) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    observacoes VARCHAR(200),

    FOREIGN KEY(id_modelo)
    REFERENCES modelo(idmodelo)
);

/*
TABELA CLIENTE
Controle de usuários (clientes):
a. Campos: código, nome, e-mail e senha;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE cliente(
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(20) NOT NULL
);

/*
TABELA LOCACAO
Controle de locação:
a. Campos: código, código do carro, código do cliente, data retirada, data devolução, 
valor e observações;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE locacao(
    idlocacao INT PRIMARY KEY AUTO_INCREMENT,
    id_carro INT NOT NULL,
    id_cliente INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    valor FLOAT(7,2) NOT NULL,
    observacoes VARCHAR(200),

    FOREIGN KEY(id_carro)
    REFERENCES carro(idcarro),
    FOREIGN KEY(id_cliente)
    REFERENCES cliente(idcliente)
);