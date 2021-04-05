/* inserts de marca*/
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'Ferrari');
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'Lamborghini');
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'McLaren');
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'Bugatti');

/* inserts de modelo*/
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,1,'458 Spider');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,2,'Aventador');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,3,'P90');
INSERT INTO modelo (idmodelo, id_marca, descricao) 
VALUES (NULL,4,'Veyron 16.4');

/*insert de carro*/
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,1,2019,'Vermelho','Duas portas, motor V8',NULL);
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,4,2018,'Preto','Duas portas, com spoilers e detalhes em azul','Atinge 407km/h');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,1,2019,'Laranja','Duas portas, motor V12','De 0a 100 em 3 seg');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,4,2018,'Amarelo','Duas portas, motor v8',NULL);

/*insert cliente */
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Joao' , 'joao@gmail.com', '12345');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Irineu', 'vocenaosabe@nem.eu','irineu123');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Ayrton', 'senna@f1.com', 'Br421l');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Zeca', 'zedapadaria@hotmail.com', 'paofrances');
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Allan', 'allanzoka@twitch.tv', 'tijolinho');

/* insert locacao */
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES

/*--------------*/
/*UPDATE*/

UPDATE modelo
SET descricao='Aventador LP 700-4'
WHERE idmodelo = 2;

UPDATE carro
SET ano = 2020
WHERE idcarro = 4;

UPDATE cliente
SET nome = 'Jose'
WHERE nome = 'Zeca';

/*--------------------*/
/* DELETE */


/*mudar date*/
Select *, DATE_FORMAT(dia, '%d/%m/%y') AS data_formatada from timetest;