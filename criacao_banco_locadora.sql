CREATE DATABASE locadora; 
USE locadora;

/*
TABELA MARCA
Controle de marcas:
a. Campos: código e descrição;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE marca (
    idmarca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) UNIQUE NOT NULL 
);

/*
TABELA MODELO
Controle de modelos:
a. Campos: código, código da marca e descrição;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE modelo (
    idmodelo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50),
    id_marca INT NOT NULL
);

/*
TABELA CARRO
Controle de carros:
a. Campos: código, código do modelo, ano, cor, descrição e observações;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE carro (
    idcarro INT PRIMARY KEY AUTO_INCREMENT,
    ano INT(4) NOT NULL,
    observacoes VARCHAR(200),
    cor VARCHAR(20) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    id_modelo INT NOT NULL
);

/*
TABELA CLIENTE
Controle de usuários (clientes):
a. Campos: código, nome, e-mail e senha;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE cliente (
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(20) NOT NULL  
);

/*
TABELA LOCACAO
Controle de locação:
a. Campos: código, código do carro, código do cliente, data retirada, data devolução, 
valor e observações;
b. Funções: cadastrar, editar, excluir e listar.
*/
CREATE TABLE locacao (
    idlocacao INT PRIMARY KEY AUTO_INCREMENT,
    valor FLOAT(6,2) NOT NULL,
    data_retirada DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    observacoes VARCHAR(200),
    id_cliente INT NOT NULL,
    id_carro INT NOT NULL
);


/*Constraints */

ALTER TABLE locacao
ADD CONSTRAINT fk_locacao_cliente
FOREIGN KEY(id_cliente) 
REFERENCES cliente (idcliente);

ALTER TABLE locacao 
ADD CONSTRAINT fk_locacao_carro
FOREIGN KEY(id_carro) 
REFERENCES carro (idcarro);

ALTER TABLE modelo
ADD CONSTRAINT fk_modelo_marca
FOREIGN KEY(id_marca) 
REFERENCES marca (idmarca);

ALTER TABLE carro
ADD CONSTRAINT fk_carro_modelo
FOREIGN KEY(id_modelo) 
REFERENCES modelo (idmodelo);


/*view amazenada*/

CREATE VIEW v_relatorio AS
SELECT  ma.nome AS marca, 
        mo.descricao AS modelo, 
        ca.ano, 
        DATE_FORMAT(lo.data_retirada,'%d/%m/%Y') AS data_retirada,
        DATE_FORMAT(lo.data_devolucao,'%d/%m/%Y') AS data_devolucao 
FROM locacao lo 
    INNER JOIN carro ca
    ON ca.idcarro = lo.id_carro
    INNER JOIN modelo mo
    ON mo.idmodelo = ca.id_modelo
    INNER JOIN marca ma
    ON ma.idmarca = mo.id_marca;

    
    
/* procedimento Armazenado */
/* estrutura minha padrão

DELIMITER $
CREATE PROCEDURE nome (arg TIPO)
BEGIN

END
$
DELIMITER ;

*/


DELIMITER $
CREATE PROCEDURE CAD_CLIENTE(p_nome VARCHAR(100), p_email VARCHAR(100), p_senha VARCHAR(20))
BEGIN
    INSERT INTO cliente (idcliente, nome, email, senha) 
    VALUES (NULL, p_nome, p_email, p_senha);
END
$
DELIMITER ;





/*trigger -- apaga modelos de uma marca ja excluida */


/*tabela para ser usada na trigger (auditoria de cliente - apenas inserts)*/
CREATE TABLE audit_cliente(
    idaudit_cliente INT PRIMARY KEY AUTO_INCREMENT,
    idcliente INT UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    evento VARCHAR(6) NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    dia DATETIME NOT NULL   
);

/*trigger*/
DELIMITER $
CREATE TRIGGER auditoria_cli
AFTER INSERT ON cliente
FOR EACH ROW 
BEGIN
		
	INSERT INTO audit_cliente VALUES
	(NULL, NEW.idcliente, NEW.nome, NEW.email, 'Insert', CURRENT_USER(), NOW());
END
$
DELIMITER ;