/* inserts de marca*/
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'Ferrari');
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'Lamborghini');
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'McLaren');
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'Bugatti');
INSERT INTO marca (idmarca, descricao) 
VALUES (NULL,'Volksvagen');
INSERT INTO marca (idmarca, descricao) 
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
VALUES (NULL,1,2019,'Vermelho','Duas portas, motor V8',NULL);
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,4,2018,'Preto','Duas portas, com spoilers e detalhes em azul','Atinge 407km/h');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,1,2019,'Laranja','Duas portas, motor V12','De 0a 100 em 3 seg');
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,4,2018,'Amarelo','Duas portas, motor v8',NULL);
INSERT INTO carro (idcarro, id_modelo, ano, cor, descricao, observacoes)
VALUES (NULL,6,1985,'Prata','Duas portas, motor PRV V6','Precisa de 1.21 Gigawatts');

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
INSERT INTO cliente (idcliente, nome, email, senha) 
VALUES (NULL, 'Marshall Eriksen', 'marshmallow@outlook.com', 'lilypad');

/* insert locacao */
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL, 1, 6, '2015-06-05', '2015-06-06', 2200, 'Cliente pagou adiantado');
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL,);
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL,);
INSERT INTO locacao (idlocacao, id_carro, id_cliente, data_retirada, data_devolucao, valor, observacoes)
VALUES (NULL,);

/*--------------*/
/*UPDATE*/

UPDATE carro
SET ano = 2020
WHERE idcarro = 4;

UPDATE marca
SET descricao = 'Volksvwagen'
WHERE descricao = 'Volksvagen';

/*--------------------*/
/* DELETE */


/*mudar date*/
Select *, DATE_FORMAT(dia, '%d/%m/%y') AS data_formatada from timetest;