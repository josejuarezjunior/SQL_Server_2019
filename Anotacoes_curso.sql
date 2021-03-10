/*Utilizando Empresa X*/

select * from funcionario
select nome,cargo from funcionario
select nome + ' trabalha como ' + cargo from funcionario

/*O exemplo abaixo gera um erro, ao tentar concatenar um string � um tipo num�rico*/
select nome + ' recebe ' + salario from funcionario

/*Abaixo a forma correta de concatenar um string e um tipo num�rico*/
select concat(nome,' recebe R$ ',salario)from funcionario

select nome, salario,salario * 0.35 as 'Adcional noturno' from funcionario;
select nome, cidade from funcionario where cidade = 'S�o Paulo'
select nome, cidade from funcionario where cidade != 'S�o Paulo'

/*Aula 10 - Distinct*/

SELECT * FROM venda
SELECT DISTINCT marca_vend FROM venda

/*Aula 11 - Exibindo a estrutura de uma tabela*/

/*sp_help funcionario*/

/*Aula 12 - Restringindo a exibi��o de dados
//Cl�usula WHERE*/

SELECT * FROM funcionario WHERE salario > 1250
SELECT * FROM funcionario WHERE salario >= 1250
SELECT nome, nascimento, salario FROM funcionario WHERE salario > 3500
SELECT nome, nascimento, cargo FROM funcionario WHERE cargo = 'Vendedor'
SELECT * FROM funcionario WHERE cidade = 'S�o Paulo'
SELECT * FROM funcionario WHERE data_contratacao = '2010-10-10'
SELECT * FROM funcionario WHERE data_contratacao < '2010-10-10'
SELECT * FROM funcionario WHERE data_contratacao >= '2010-10-10'

/*Aula 13 - Especificando um intervalo a ser testado*/
/*Cl�usula BETWEEN*/

SELECT * FROM funcionario WHERE salario BETWEEN 1500 AND 2500
SELECT * FROM funcionario WHERE salario NOT BETWEEN 1500 AND 2500

SELECT * FROM funcionario WHERE data_contratacao BETWEEN '2009-01-01' AND '2010-10-10'

SELECT * FROM produto

SELECT nome_prod,estoque FROM produto WHERE estoque BETWEEN 0 AND 50

/*Aula 14 - Especificando uma lista a ser testada*/
/*Cl�usula IN*/

SELECT * FROM funcionario WHERE salario IN(1250,2500,3500)
SELECT * FROM funcionario WHERE id IN(5,8,10)
SELECT * FROM funcionario WHERE id NOT IN(5,8,10)
/* "<>" significa "diferente de"*/
SELECT * FROM funcionario WHERE id <> 1
/*Semelhante ao "<>", temos o "!=" que quer dizer "n�o � igual"*/
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

/*Aula 17 - Definindo condi��es em uma busca utilizando operadores l�gicos*/

SELECT * FROM venda WHERE quantidade > 100 AND marca_vend = 'Dolly'
SELECT * FROM funcionario
SELECT * FROM funcionario WHERE cargo = 'Gerente' AND cidade = 'S�o Paulo'
SELECT * FROM funcionario WHERE cargo = 'Gerente' OR cidade = 'S�o Paulo'
SELECT * FROM funcionario WHERE salario > 3000 AND cidade = 'S�o Paulo'
SELECT * FROM funcionario WHERE cargo = 'Gerente' OR cargo = 'Vendedor'
SELECT * FROM funcionario WHERE (cargo = 'Vendedor' OR cargo = 'Gerente') AND salario > 2500
SELECT * FROM funcionario WHERE (data_contratacao > '2000-01-01' AND data_contratacao < '2013-01-01') AND cidade = 'Araras'
SELECT * FROM funcionario WHERE NOT cargo = 'Gerente'
SELECT * FROM funcionario WHERE salario NOT IN (1500,2500,3500)
SELECT * FROM funcionario WHERE cargo NOT IN ('Vendedor', 'Gerente')

/*Aula 18 - Classificando dados retornados em uma consulta SQL
**Abaixo a consulta ser� ordenada pelo campo "id". Como n�o foi informado se a exibi��o ser� ascendente(ASC)
**ou decrescente(DESC), a ordem seguir� o padr�o, que � ascendente.
*/
SELECT * FROM funcionario ORDER BY id
SELECT * FROM funcionario ORDER BY id DESC
SELECT * FROM funcionario ORDER BY salario DESC
SELECT * FROM funcionario WHERE salario > 2500 ORDER BY salario DESC
SELECT * FROM funcionario WHERE salario NOT BETWEEN 1500 AND 2500 ORDER BY salario
/*� poss�vel tamb�m informar o n�mero do campo(coluna) ao inv�s do nome do campo. Nesse caso "3"que � "nascimento".*/
SELECT * FROM funcionario ORDER BY 3
SELECT nome, nascimento, salario, (salario * 0.35) AS Abono FROM funcionario ORDER BY Abono DESC

/*Aula 19 - Manipula��o de caracteres*/
SELECT CONCAT('Ol� mundo',' tudo bem?') AS resposta
SELECT CONCAT(nome, ' nasceu em ',cidade) AS resposta FROM funcionario
SELECT SUBSTRING('Ol� mundo',1,3) AS Mensagem
SELECT nome, SUBSTRING(nome,1,8) AS Login FROM funcionario
SELECT REPLACE('Jack and Jue','J','Bl')
SELECT nome, REPLACE(nome,'a','*') AS Troca FROM funcionario
SELECT nome, LEN(nome) AS Caracteres FROM funcionario
SELECT nome, LEN(nome) AS Caracteres FROM funcionario ORDER BY Caracteres DESC

/*Aula 20 - Manipula��o de caracteres(continua��o)*/
SELECT LOWER('Ol� mundo')
SELECT nome,LOWER(nome) AS Resposta FROM funcionario
SELECT UPPER('Ol� mundo')
SELECT nome,UPPER(nome) AS Resposta FROM funcionario
SELECT nome,REPLACE(UPPER(nome),' ','') AS Login FROM funcionario
SELECT LTRIM('      espa�os em branco      ')
SELECT RTRIM('      espa�os em branco      ')
SELECT RTRIM(LTRIM('      espa�os em branco      '))
SELECT STUFF('Meu exemplo',4,0,' maior')

/*Aula 21 - Fun��es Matem�ticas*/

/*Arredondamento*/
SELECT ROUND(1322.56,-1)

/*Transforma��o em n�meros absoulutos(Negativo em positivo)*/
SELECT ABS(-15)

/*o "RAND" gera um n�mero aleat�rio entre 0 e 1.*/
SELECT RAND()
SELECT RAND()*500
SELECT id,nome, RAND()*500 AS Senha FROM funcionario

/*Sem casas decimais*/
SELECT id,nome, CONCAT('ABC',FLOOR(RAND()*500)) AS Senha FROM funcionario WHERE id = 10

/*Ra�z quadrada*/
SELECT SQRT(81) AS Resultado

/*Potencia��o*/
SELECT POWER(2,3) AS Pot�ncia

/*Aula 21 - Fun��es Matem�ticas - Continua��o*/

/*Soma*/
SELECT SUM(salario) AS 'Soma de s�l�rio' FROM funcionario
/*M�dia*/
SELECT AVG(salario) AS 'M�dia de sal�rio' FROM funcionario
/*M�nimo*/
SELECT MIN(salario) AS 'Menor sal�rio' FROM funcionario
/*M�ximo*/
SELECT MAX(salario) AS 'Maior sal�rio' FROM funcionario

/*Aula 23 - Fun��es para manipula��es de datas*/

/*Data atual no formato do sistema.*/
SELECT GETDATE()

/*Ano, m�s ou dia de uma data*/
SELECT nome, nascimento, DATEPART(MONTH,nascimento) AS 'M�s de anivers�rio' FROM funcionario
SELECT nome, nascimento, DATEPART(DAY,nascimento) AS 'Dia de anivers�rio' FROM funcionario
SELECT nome, nascimento, DATEPART(YEAR,nascimento) AS 'Ano de anivers�rio' FROM funcionario

/*Adcionando dias � uma data. Pode ser �til para definir por exemplo uma data de vencimento.*/
SELECT data_contratacao, DATEADD(DAY,5000,data_contratacao) AS '5000 dias de empresa' FROM funcionario

SELECT DATEADD(DAY,60,GETDATE()) AS '60 days from today'
SELECT DATEADD(MONTH,5,GETDATE()) AS '5 months from today'
SELECT DATEADD(YEAR,2,GETDATE()) AS '2 years from today'

/*Diferen�a entre datas*/
SELECT nome,nascimento, DATEDIFF(DAY,data_contratacao,GETDATE()) AS 'Dias na empresa' FROM funcionario
SELECT nome,nascimento, DATEDIFF(YEAR,data_contratacao,GETDATE()) AS 'Anos na empresa' FROM funcionario
SELECT DATEDIFF(DAY,'1989-02-08',GETDATE())

/*Utilizando m�scara de formata��o*/
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

/*Selecionando a coluna "produto_vend" da tabela "venda", e inserindo as informa��es do produto, 
origin�rias da tabela "produto".*/
SELECT * FROM produto WHERE nome_prod IN (SELECT produto_vend FROM venda WHERE quantidade > 150)
SELECT * FROM produto WHERE nome_prod NOT IN (SELECT produto_vend FROM venda WHERE quantidade > 150)

/*Se��o 21 - Join*/
/*Usando empresa "Y".*/

SELECT * FROM pedido JOIN produto ON pedido.idProduto=produto.idProduto
SELECT * FROM pedido JOIN vendedor ON PEDIDO.idVendedor=vendedor.idVendedor
SELECT * FROM pedido JOIN cliente ON PEDIDO.idCliente=cliente.idCliente

SELECT pedido.idPedido, pedido.Quantidade,pedido.Valor, cliente.Nome FROM pedido JOIN cliente ON pedido.idCliente=cliente.idCliente

/*Reduzindo o c�digo*/
SELECT p.idPedido, p.Quantidade,p.Valor, c.Nome FROM pedido AS p JOIN cliente AS c ON p.idCliente=c.idCliente

SELECT p.idPedido, p.idVendedor, p.quantidade, v.nome FROM pedido AS p JOIN vendedor AS v ON p.idVendedor=v.idVendedor

/*Utilizando mais de duas tabelas*/
SELECT p.idPedido,p.idVendedor,p.idCliente,p.quantidade,v.nome,c.nome FROM pedido AS p JOIN vendedor AS v 
ON p.idVendedor=v.idVendedor JOIN cliente AS c
ON p.idCliente=c.idCliente

/*Se��o 22 - Left Join*/
/*Sem o "LEFT" n�o � poss�vel visualizar h� vendedores associados � uma venda
**que n�o constam na tabela de cadastro de vendedores.*/
/*Utilizando Empresa X*/
SELECT * FROM venda JOIN funcionario ON venda.vendedor = funcionario.nome
/*Com o "LEFT JOIN" � poss�vel verificar vendedores n�o cadastrados.*/
SELECT * FROM venda LEFT JOIN funcionario ON venda.vendedor = funcionario.nome
SELECT * FROM venda LEFT JOIN funcionario ON venda.vendedor = funcionario.nome WHERE funcionario.nome IS NULL

/*Se��o 23 - Right Join*/

SELECT * FROM venda RIGHT JOIN funcionario ON venda.vendedor = funcionario.nome WHERE funcionario.cargo = 'Vendedor' AND venda.vendedor IS NULL

/*Se��o 24 - Criando uma view*/

SELECT * FROM View_Vendedor_sem_venda

SELECT nome, nascimento, data_contratacao, cidade FROM View_Vendedor_sem_venda WHERE cidade = 'S�o Paulo'

SELECT nome, nascimento, data_contratacao, cidade, salario FROM View_Vendedor_sem_venda WHERE salario > 2500

/*Se��o 25 - Group By*/

SELECT * FROM funcionario

SELECT COUNT(cidade) FROM funcionario

SELECT cidade,COUNT(cidade) AS Quantidade FROM funcionario GROUP BY cidade
SELECT cargo, SUM(salario) AS Sal�rios FROM funcionario GROUP BY cargo
SELECT cidade, SUM(salario) AS Sal�rios FROM funcionario GROUP BY cidade

/*Se��o 26*/
/*Aula 34*/
/*Usando empresa "X".*/
SELECT * FROM funcionario

SELECT nome, data_contratacao,

CASE YEAR(data_contratacao)

WHEN 2015 THEN 'Contratado em 2015'
WHEN 2015 THEN 'Contratado em 2010'
WHEN 2015 THEN 'Contratado em 2001'

ELSE 'N�o classificado'

END AS 'Ano refer�ncia' FROM funcionario

/*-------------------------------------*/

SELECT nome, salario, salario =

CASE
WHEN salario >= 3500 THEN '�timo sal�rio'
WHEN salario <3500 AND salario >= 1500 THEN 'Bom sal�rio'
WHEN salario < 1500 THEN 'Sal�rio ruim'
END

FROM funcionario

/*-------------------------------------*/

/*Fun��o aninhada*/

SELECT salario,
IIF (salario >= 2500, 'Bom salario','Sal�rio ruim') AS Resultado FROM funcionario

/*-------------------------------------*/
/*Aula 35*/
SELECT nome, cargo, cidade, salario,
CASE 
	WHEN cidade ='S�o Paulo' THEN
	CASE WHEN salario >= 3500 THEN 'Bom sal�rio'
	ELSE 'Sal�rio ruim'
	END
WHEN cidade = 'Araras' THEN
	CASE WHEN salario >= 2500 THEN 'Bom sal�rio'
	ELSE 'Sal�rio ruim'
	END
END AS Resultado FROM funcionario


