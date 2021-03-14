/*Utilizando Empresa X*/
USE Empresa_X;
select * from funcionario
select nome,cargo from funcionario
select nome + ' trabalha como ' + cargo from funcionario

/*O exemplo abaixo gera um erro, ao tentar concatenar um string à um tipo numérico*/
select nome + ' recebe ' + salario from funcionario

/*Abaixo a forma correta de concatenar um string e um tipo numérico*/
select concat(nome,' recebe R$ ',salario)from funcionario

select nome, salario,salario * 0.35 as 'Adcional noturno' from funcionario;
select nome, cidade from funcionario where cidade = 'São Paulo'
select nome, cidade from funcionario where cidade != 'São Paulo'

/*Aula 10 - Distinct*/

SELECT * FROM venda
SELECT DISTINCT marca_vend FROM venda

/*Aula 11 - Exibindo a estrutura de uma tabela*/

/*sp_help funcionario*/

/*Aula 12 - Restringindo a exibição de dados
//Cláusula WHERE*/

SELECT * FROM funcionario WHERE salario > 1250
SELECT * FROM funcionario WHERE salario >= 1250
SELECT nome, nascimento, salario FROM funcionario WHERE salario > 3500
SELECT nome, nascimento, cargo FROM funcionario WHERE cargo = 'Vendedor'
SELECT * FROM funcionario WHERE cidade = 'São Paulo'
SELECT * FROM funcionario WHERE data_contratacao = '2010-10-10'
SELECT * FROM funcionario WHERE data_contratacao < '2010-10-10'
SELECT * FROM funcionario WHERE data_contratacao >= '2010-10-10'

/*Aula 13 - Especificando um intervalo a ser testado*/
/*Cláusula BETWEEN*/

SELECT * FROM funcionario WHERE salario BETWEEN 1500 AND 2500
SELECT * FROM funcionario WHERE salario NOT BETWEEN 1500 AND 2500

SELECT * FROM funcionario WHERE data_contratacao BETWEEN '2009-01-01' AND '2010-10-10'

SELECT * FROM produto

SELECT nome_prod,estoque FROM produto WHERE estoque BETWEEN 0 AND 50

/*Aula 14 - Especificando uma lista a ser testada*/
/*Cláusula IN*/

SELECT * FROM funcionario WHERE salario IN(1250,2500,3500)
SELECT * FROM funcionario WHERE id IN(5,8,10)
SELECT * FROM funcionario WHERE id NOT IN(5,8,10)
/* "<>" significa "diferente de"*/
SELECT * FROM funcionario WHERE id <> 1
/*Semelhante ao "<>", temos o "!=" que quer dizer "não é igual"*/
SELECT * FROM funcionario WHERE id != 10

/*Aula 15 - Operador LIKE - Testando uma cadeia de caracteres*/

SELECT * FROM funcionario WHERE nome LIKE 'Maria%'
SELECT * FROM funcionario WHERE nome LIKE '%silva%'
SELECT * FROM funcionario WHERE nome LIKE '___s%'
SELECT * FROM funcionario WHERE nome LIKE '___s_n%'
SELECT * FROM funcionario WHERE data_contratacao LIKE '2015%'
SELECT * FROM funcionario WHERE nome LIKE '[A-C]%'
SELECT * FROM funcionario WHERE nome LIKE '[^A-F]%'

/*Aula 16 - Valores nulos (NULL)*/

SELECT * FROM venda WHERE quantidade IS NULL
SELECT * FROM venda WHERE quantidade IS NOT NULL

/*Aula 17 - Definindo condições em uma busca utilizando operadores lógicos*/

SELECT * FROM venda WHERE quantidade > 100 AND marca_vend = 'Dolly'
SELECT * FROM funcionario
SELECT * FROM funcionario WHERE cargo = 'Gerente' AND cidade = 'São Paulo'
SELECT * FROM funcionario WHERE cargo = 'Gerente' OR cidade = 'São Paulo'
SELECT * FROM funcionario WHERE salario > 3000 AND cidade = 'São Paulo'
SELECT * FROM funcionario WHERE cargo = 'Gerente' OR cargo = 'Vendedor'
SELECT * FROM funcionario WHERE (cargo = 'Vendedor' OR cargo = 'Gerente') AND salario > 2500
SELECT * FROM funcionario WHERE (data_contratacao > '2000-01-01' AND data_contratacao < '2013-01-01') AND cidade = 'Araras'
SELECT * FROM funcionario WHERE NOT cargo = 'Gerente'
SELECT * FROM funcionario WHERE salario NOT IN (1500,2500,3500)
SELECT * FROM funcionario WHERE cargo NOT IN ('Vendedor', 'Gerente')

/*Aula 18 - Classificando dados retornados em uma consulta SQL
**Abaixo a consulta será ordenada pelo campo "id". Como não foi informado se a exibição será ascendente(ASC)
**ou decrescente(DESC), a ordem seguirá o padrão, que é ascendente.
*/
SELECT * FROM funcionario ORDER BY id
SELECT * FROM funcionario ORDER BY id DESC
SELECT * FROM funcionario ORDER BY salario DESC
SELECT * FROM funcionario WHERE salario > 2500 ORDER BY salario DESC
SELECT * FROM funcionario WHERE salario NOT BETWEEN 1500 AND 2500 ORDER BY salario
/*É possível também informar o número do campo(coluna) ao invés do nome do campo. Nesse caso "3"que é "nascimento".*/
SELECT * FROM funcionario ORDER BY 3
SELECT nome, nascimento, salario, (salario * 0.35) AS Abono FROM funcionario ORDER BY Abono DESC

/*Aula 19 - Manipulação de caracteres*/
SELECT CONCAT('Olá mundo',' tudo bem?') AS resposta
SELECT CONCAT(nome, ' nasceu em ',cidade) AS resposta FROM funcionario
SELECT SUBSTRING('Olá mundo',1,3) AS Mensagem
SELECT nome, SUBSTRING(nome,1,8) AS Login FROM funcionario
SELECT REPLACE('Jack and Jue','J','Bl')
SELECT nome, REPLACE(nome,'a','*') AS Troca FROM funcionario
SELECT nome, LEN(nome) AS Caracteres FROM funcionario
SELECT nome, LEN(nome) AS Caracteres FROM funcionario ORDER BY Caracteres DESC

/*Aula 20 - Manipulação de caracteres(continuação)*/
SELECT LOWER('Olá mundo')
SELECT nome,LOWER(nome) AS Resposta FROM funcionario
SELECT UPPER('Olá mundo')
SELECT nome,UPPER(nome) AS Resposta FROM funcionario
SELECT nome,REPLACE(UPPER(nome),' ','') AS Login FROM funcionario
SELECT LTRIM('      espaços em branco      ')
SELECT RTRIM('      espaços em branco      ')
SELECT RTRIM(LTRIM('      espaços em branco      '))
SELECT STUFF('Meu exemplo',4,0,' maior')

/*Aula 21 - Funções Matemáticas*/

/*Arredondamento*/
SELECT ROUND(1322.56,-1)

/*Transformação em números absoulutos(Negativo em positivo)*/
SELECT ABS(-15)

/*o "RAND" gera um número aleatório entre 0 e 1.*/
SELECT RAND()
SELECT RAND()*500
SELECT id,nome, RAND()*500 AS Senha FROM funcionario

/*Sem casas decimais*/
SELECT id,nome, CONCAT('ABC',FLOOR(RAND()*500)) AS Senha FROM funcionario WHERE id = 10

/*Raíz quadrada*/
SELECT SQRT(81) AS Resultado

/*Potenciação*/
SELECT POWER(2,3) AS Potência

/*Aula 21 - Funções Matemáticas - Continuação*/

/*Soma*/
SELECT SUM(salario) AS 'Soma de sálário' FROM funcionario
/*Média*/
SELECT AVG(salario) AS 'Média de salário' FROM funcionario
/*Mínimo*/
SELECT MIN(salario) AS 'Menor salário' FROM funcionario
/*Máximo*/
SELECT MAX(salario) AS 'Maior salário' FROM funcionario

/*Aula 23 - Funções para manipulações de datas*/

/*Data atual no formato do sistema.*/
SELECT GETDATE()

/*Ano, mês ou dia de uma data*/
SELECT nome, nascimento, DATEPART(MONTH,nascimento) AS 'Mês de aniversário' FROM funcionario
SELECT nome, nascimento, DATEPART(DAY,nascimento) AS 'Dia de aniversário' FROM funcionario
SELECT nome, nascimento, DATEPART(YEAR,nascimento) AS 'Ano de aniversário' FROM funcionario

/*Adcionando dias à uma data. Pode ser útil para definir por exemplo uma data de vencimento.*/
SELECT data_contratacao, DATEADD(DAY,5000,data_contratacao) AS '5000 dias de empresa' FROM funcionario

SELECT DATEADD(DAY,60,GETDATE()) AS '60 days from today'
SELECT DATEADD(MONTH,5,GETDATE()) AS '5 months from today'
SELECT DATEADD(YEAR,2,GETDATE()) AS '2 years from today'

/*Diferença entre datas*/
SELECT nome,nascimento, DATEDIFF(DAY,data_contratacao,GETDATE()) AS 'Dias na empresa' FROM funcionario
SELECT nome,nascimento, DATEDIFF(YEAR,data_contratacao,GETDATE()) AS 'Anos na empresa' FROM funcionario
SELECT DATEDIFF(DAY,'1989-02-08',GETDATE())

/*Utilizando máscara de formatação*/
SELECT nome, data_contratacao, FORMAT(data_contratacao,'dd/MM/yyyy') AS 'Data formatada' FROM funcionario

/*Aula 24 - Subconsultas*/

SELECT * FROM funcionario WHERE salario = (SELECT MAX(salario) FROM funcionario)
SELECT * FROM funcionario WHERE salario = (SELECT MIN(salario) FROM funcionario)
SELECT * FROM funcionario WHERE salario <> (SELECT MIN(salario) FROM funcionario)

SELECT * FROM funcionario WHERE salario > (SELECT AVG(salario) FROM funcionario)
SELECT * FROM funcionario WHERE salario < (SELECT AVG(salario) FROM funcionario)

/*Utilizando duas tabelas na subconsulta*/
SELECT * FROM funcionario
SELECT * FROM venda

SELECT * FROM funcionario WHERE nome = (SELECT vendedor FROM venda WHERE quantidade = (SELECT MAX(quantidade) FROM venda))

/*Aula 25 - Subconsultas(IN, NOT IN)*/.

SELECT * FROM produto
SELECT * FROM venda

/*Selecionando a coluna "produto_vend" da tabela "venda", e inserindo as informações do produto, 
originárias da tabela "produto".*/
SELECT * FROM produto WHERE nome_prod IN (SELECT produto_vend FROM venda WHERE quantidade > 150)
SELECT * FROM produto WHERE nome_prod NOT IN (SELECT produto_vend FROM venda WHERE quantidade > 150)

/*Seção 21 - Join*/
/*Usando empresa "Y".*/
USE Empresa_Y
SELECT * FROM pedido JOIN produto ON pedido.idProduto=produto.idProduto
SELECT * FROM pedido JOIN vendedor ON PEDIDO.idVendedor=vendedor.idVendedor
SELECT * FROM pedido JOIN cliente ON PEDIDO.idCliente=cliente.idCliente

SELECT pedido.idPedido, pedido.Quantidade,pedido.Valor, cliente.Nome FROM pedido JOIN cliente ON pedido.idCliente=cliente.idCliente

/*Reduzindo o código*/
SELECT p.idPedido, p.Quantidade,p.Valor, c.Nome FROM pedido AS p JOIN cliente AS c ON p.idCliente=c.idCliente

SELECT p.idPedido, p.idVendedor, p.quantidade, v.nome FROM pedido AS p JOIN vendedor AS v ON p.idVendedor=v.idVendedor

/*Utilizando mais de duas tabelas*/
SELECT p.idPedido,p.idVendedor,p.idCliente,p.quantidade,v.nome,c.nome FROM pedido AS p JOIN vendedor AS v 
ON p.idVendedor=v.idVendedor JOIN cliente AS c
ON p.idCliente=c.idCliente

/*Seção 22 - Left Join*/
/*Sem o "LEFT" não é possível visualizar há vendedores associados à uma venda
**que não constam na tabela de cadastro de vendedores.*/
/*Utilizando Empresa X*/
USE Empresa_X;
SELECT * FROM venda JOIN funcionario ON venda.vendedor = funcionario.nome
/*Com o "LEFT JOIN" é possível verificar vendedores não cadastrados.*/
SELECT * FROM venda LEFT JOIN funcionario ON venda.vendedor = funcionario.nome
SELECT * FROM venda LEFT JOIN funcionario ON venda.vendedor = funcionario.nome WHERE funcionario.nome IS NULL

/*Seção 23 - Right Join*/

SELECT * FROM venda RIGHT JOIN funcionario ON venda.vendedor = funcionario.nome WHERE funcionario.cargo = 'Vendedor' AND venda.vendedor IS NULL

/*Seção 24 - Criando uma view*/

SELECT * FROM View_Vendedor_sem_venda

SELECT nome, nascimento, data_contratacao, cidade FROM View_Vendedor_sem_venda WHERE cidade = 'São Paulo'

SELECT nome, nascimento, data_contratacao, cidade, salario FROM View_Vendedor_sem_venda WHERE salario > 2500

/*Seção 25 - Group By*/

SELECT * FROM funcionario

SELECT COUNT(cidade) FROM funcionario

SELECT cidade,COUNT(cidade) AS Quantidade FROM funcionario GROUP BY cidade
SELECT cargo, SUM(salario) AS Salários FROM funcionario GROUP BY cargo
SELECT cidade, SUM(salario) AS Salários FROM funcionario GROUP BY cidade

/*Seção 26*/
/*Aula 34*/
/*Usando empresa "X".*/
USE Empresa_X;
SELECT * FROM funcionario

SELECT nome, data_contratacao,

CASE YEAR(data_contratacao)

WHEN 2015 THEN 'Contratado em 2015'
WHEN 2015 THEN 'Contratado em 2010'
WHEN 2015 THEN 'Contratado em 2001'

ELSE 'Não classificado'

END AS 'Ano referência' FROM funcionario

/*-------------------------------------*/

SELECT nome, salario, salario =

CASE
WHEN salario >= 3500 THEN 'Ótimo salário'
WHEN salario <3500 AND salario >= 1500 THEN 'Bom salário'
WHEN salario < 1500 THEN 'Salário ruim'
END

FROM funcionario

/*-------------------------------------*/

/*Função aninhada*/

SELECT salario,
IIF (salario >= 2500, 'Bom salario','Salário ruim') AS Resultado FROM funcionario

/*-------------------------------------*/
/*Aula 35*/
SELECT nome, cargo, cidade, salario,
CASE 
	WHEN cidade ='São Paulo' THEN
	CASE WHEN salario >= 3500 THEN 'Bom salário'
	ELSE 'Salário ruim'
	END
WHEN cidade = 'Araras' THEN
	CASE WHEN salario >= 2500 THEN 'Bom salário'
	ELSE 'Salário ruim'
	END
END AS Resultado FROM funcionario

/* Seção 27 - Insert*/
/* Aula 36 */
USE Empresa_X;
sp_help funcionario

INSERT INTO funcionario(nome,nascimento,data_contratacao,cargo,cidade,salario)
VALUES('João Salgado','1979-10-10','2015-10-10','Vendedor','São Paulo',6500);

SELECT * FROM funcionario;

DELETE FROM funcionario WHERE id = 23

/*Atualiza o id da tabela, caso esteja errado(caso registros tenham sido deletados
a contagem de id estaria errada. No último argumento deve ser informado o último id
em uso na tabela*/
DBCC CHECKIDENT ('funcionario', RESEED,22)	

USE Empresa_Y;

INSERT INTO pedido (idProduto,idVendedor,idCliente, Quantidade,Valor)
VALUES(1,3,1,30,500);

INSERT INTO Vendedor(Nome)VALUES('Roberto Carlos');

SELECT * FROM Produto
SELECT * FROM Vendedor
SELECT * FROM Cliente
SELECT * FROM Pedido

/* Aula 37 - Realizando o Insert à partir de uma consulta*/
USE Empresa_Y;

INSERT INTO Pedido(idVendedor, idCliente, idProduto, Quantidade, Valor)
SELECT Vendedor.idVendedor, Cliente.idCliente,Produto.idProduto, 1500, 6500 FROM Vendedor, Cliente, Produto 
WHERE Vendedor.Nome = 'Roberto Carlos' AND Cliente.Nome = 'José da Silva' AND Produto.Descrição = 'iPAD';

SELECT * FROM Pedido;

/* Seção 28 - UPDATE */
/* Aula 38 */

USE Empresa_X;

SELECT * FROM funcionario;

UPDATE funcionario SET nome = 'Josias da Silva' WHERE id = 1;

UPDATE funcionario SET nascimento='1985-10-10', cargo = 'Gerente', salario = 1500 WHERE id = 6; 

UPDATE funcionario SET salario = salario * 1.1 WHERE salario = 1250;

/*Consulta*/
SELECT MIN(salario) FROM funcionario;
/*Subconsulta*/
SELECT * FROM funcionario WHERE salario = (SELECT MIN(salario) FROM funcionario);
/*UPDATE com subconsulta*/
UPDATE funcionario SET salario = salario * 1.5 WHERE salario = (SELECT MIN(salario) FROM funcionario);

/* Seção 29 - DELETE */
/* Aula 39 */

USE Empresa_X;
SELECT * FROM produto;
DELETE FROM produto WHERE id = 6;
DELETE FROM produto WHERE estoque > 100;

INSERT INTO produto (nome_prod,marca,validade,estoque,preco)
VALUES('Refrigerante','Coca-Cola','2021-03-13',660,7.9);

/*40*/
/*COMMIT / ROLLBACK*/

USE Empresa_X;

SELECT * FROM venda;
/*O ROLLBACK TRANSACTION cria uma "Transação" que permite
desfazer um DELETE. Para isso, o ROLLBACK deve ter sido criado antes
do DELETE*/
BEGIN TRANSACTION exemplo;
DELETE FROM venda WHERE quantidade > 150;
/*Desfazendo o DELETE:*/
ROLLBACK TRANSACTION exemplo;

BEGIN TRANSACTION exemplo2;
/*Deletando todos os registros da tabela:*/
DELETE FROM venda;
/*O COMMIT TRANSACTIO confirma a deleção feita*/
COMMIT TRANSACTION exemplo2;
/*Como foi confirmada a deleção, não é possível utilizar o 
ROLLBACK TRANSACTION para desfazer o que foi feito. Essa transação 
já não existe mais(exemplo2). Será apresentada uma mensagem de erro.*/
ROLLBACK TRANSACTION exemplo2;

/*Seção 30*/
/*Aula 41 - CREATE DATABASE, CREATE TABLE*/

CREATE DATABASE Empresa_Z;
USE Empresa_Z;

CREATE TABLE clientes
(
Id INTEGER IDENTITY(1,1) PRIMARY KEY  NOT NULL,
Nome VARCHAR(50) NOT NULL,
Endereco VARCHAR(50) NOT NULL,
Email VARCHAR(50),
Data_Nascimento DATE
);

sp_help clientes;

/*Aula 42 - Chaves estrangeiras*/
USE Empresa_Z;

CREATE TABLE produtos
(
Id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
Produto VARCHAR(50)NOT NULL,
Quantidade INTEGER NOT NULL,
Preco DECIMAL(18,2) NOT NULL
);

CREATE TABLE pedido
(
Id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
Id_prod INTEGER CONSTRAINT FK_Ped_Prod REFERENCES produtos(Id),
Id_clie INTEGER CONSTRAINT FK_Ped_Clie REFERENCES clientes(Id),
Quantidade INTEGER,
);

sp_help pedido