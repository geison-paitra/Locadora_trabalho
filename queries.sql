/* inserts de marca*/
INSERT INTO marca (idmarca, nome) 
VALUES (NULL,'Ferrari');
INSERT INTO marca (idmarca, nome) 
VALUES (NULL,'Lamborghini');
INSERT INTO marca (idmarca, nome) 
VALUES (NULL,'McLaren');
INSERT INTO marca (idmarca, nome) 
VALUES (NULL,'Bugatti');
INSERT INTO marca (idmarca, nome) 
VALUES (NULL,'Volksvagen');
INSERT INTO marca (idmarca, nome) 
VALUES (NULL,'DeLorean');



/* inserts de modelo*/
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,1,'458 Spider');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,2,'Aventador LP 700-4');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,3,'P90');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,4,'Veyron 16.4');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,5,'Fusca');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,6,'DMC-12');



/*insert de carro*/
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL, 1, 2019,'Vermelho','Duas portas, motor V8', NULL);
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL, 4, 2018,'Preto','Duas portas, com spoilers e detalhes em azul','Atinge 407km/h');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,2, 2019,'Laranja','Duas portas, motor V12','De 0a 100 em 3 seg');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,3, 2018,'Amarelo','Duas portas, motor v8', NULL);
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,6, 1985,'Prata','Duas portas, motor PRV V6','Precisa de 1.21 Gigawatts');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL, 5, 1974,'Preto','Duas portas, motor de maquina de costura','Carro em estado ruim');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL, 5, 1972,'Bege','Duas portas, motor de maquina de costura','Carro em estado ruim');

/*insert cliente */
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Martin McFly' , 'mmcfly@gmail.com', 'DeLorean');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Irineu', 'vocenaosabe@nem.eu','irineu123');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Ayrton Senna', 'senna@f1.com', 'Br421l');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Zeca Silva', 'zedapadaria@hotmail.com', 'paofrances');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Allan Ferreira', 'allanzoka@twitch.tv', 'tijolinho');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Barney Stinson', 'stinson_awesome@outlook.com', 'legendary');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Theodore Mosby', 'ted.mosby@outlook.com', 'arquitetomosby');

CALL CAD_CLIENTE('Marshall Eriksen', 'marshmallow@outlook.com', 'lilypad'); 


/* insert locacao */
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL, 1, 6, '2015-06-05', '2015-06-06', 2200, 'Cliente pagou adiantado');
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL, 5, 1, '1985-11-12', '1955-11-12', 100, NULL);
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL, 4, 7, '2005-9-19', '2014-03-31', 0, 'Aluguel pago por Barney Stinson');
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL, 3, 5, '2020-01-01', '2020-02-01', 1800.75, 'Desconto para clientes em parceria com a Twitch.tv');
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL, 6, 4, '2021-03-01', '2021-04-01', 50, 'Carro sera leiloado ao fim do aluguel');

/*--------------*/
/*UPDATE*/

UPDATE carro
SET ano = 2020
WHERE idcarro = 4;

UPDATE marca
SET nome = 'Volkswagen'
WHERE nome = 'Volksvagen';

UPDATE locacao
SET observacoes = 'O cliente sumiu'
WHERE id_cliente = '1';

UPDATE carro
SET observacoes = '****'
WHERE observacoes IS NULL;

UPDATE cliente
SET senha = 'WaitForIt-Legendary'
WHERE nome = 'Barney Stinson';


/*--------------------*/
/* DELETE */
DELETE FROM locacao
WHERE id_cliente = 4;

DELETE FROM carro
WHERE id_modelo = 5;

DELETE FROM modelo
WHERE idmodelo = 5;

DELETE FROM marca
WHERE nome = 'Volkswagen';

DELETE FROM cliente
WHERE idcliente = 4;
/*-------------------*/
/*Selects e Joins*/

SELECT nome, email
FROM cliente;

SELECT nome as Marcas
FROM marca;

SELECT a.nome AS Marca, b.descricao AS Modelo
FROM marca a
    INNER JOIN modelo b
    ON a.idmarca = b.id_marca
WHERE b.descricao IS NOT NULL;

SELECT a.descricao AS modelo, b.ano , b.cor 
FROM modelo a
    INNER JOIN carro b 
    ON a.idmodelo = b.id_modelo;

SELECT c.nome AS cliente, a.ano, l.valor
FROM locacao l
    INNER JOIN cliente c
    ON c.idcliente = l.id_cliente
    INNER JOIN carro a
    ON a.idcarro = l.id_carro;

select * from v_relatorio; -- É uma join em uma view
/*
SELECT  mo.descricao AS marca, 
        ma.descricao AS modelo, 
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
    */


/*mudar date*/
/* Select DATE_FORMAT(dia, '%d/%m/%y') AS data_formatada from timetest; */



