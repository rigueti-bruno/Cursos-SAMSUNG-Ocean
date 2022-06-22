-- DDL - Data Definition Language/Linguagem de Descrição de Dados:

SHOW DATABASES; -- Mostra os Bancos de Dados no SGBD

CREATE DATABASE escola; -- Cria a Tabela escola

use escola; -- Indica a tabela que será manipulada

SHOW TABLES; -- Indica as tabelas no Banco de Dados em uso

CREATE TABLE IF NOT EXISTS aluno ( -- Verifica se a tabela já existe no BD antes de criá-la
id int not null auto_increment primary key,
nome varchar(30) not null,
telefone int not null
);

select * from aluno;

DESCRIBE aluno; -- Exibe a estrutura da tabela especificada

ALTER TABLE aluno
add column altura decimal not null; -- Adiciona uma coluna à tabela

ALTER TABLE aluno
DROP COLUMN altura; -- Esclui uma coluna na tabela

ALTER TABLE aluno
add column altura decimal not null after id; -- Adiciona uma nova coluna à tabela em uma posição especíca, após outra coluna especificada

ALTER TABLE aluno
modify column altura decimal(3,2) not null; -- Altera as especificações de uma coluna da tabela

ALTER TABLE aluno
CHANGE COLUMN telefone telefone_celular bigint not null; -- Muda o nome de uma coluna da tabela e os seus atributos

ALTER TABLE aluno
RENAME TO aluno_ocean; -- Renomeia uma Tabela

CREATE TABLE teste (
	id int not null);
    
DROP TABLE IF EXISTS teste; -- Verifica se uma tabela existe no Banco de Dados e a exclui

DESCRIBE aluno_ocean;

ALTER TABLE aluno_ocean
DROP COLUMN altura;

-- DML - Data Manipulation Language/Linguagem de Manipulação de Dados:

INSERT INTO aluno_ocean (nome, telefone_celular) values ("Douglas", 51985479866); -- Insere um registro na tabela

INSERT INTO aluno_ocean (nome, telefone_celular) -- Insere mais de um registro na tabela
values
("Leticia", 11987479886),
("Joenio", 81981479826);

select * from aluno_ocean;

UPDATE aluno_ocean -- Altera o valor de um campo em um registro específico
SET nome = "Bruno"
WHERE id = 1;

DELETE FROM aluno_ocean -- Exclui um registro específico da tabela
WHERE id = 3;

-- DQL - Data Query Language/Linguagem de Consulta de Dados:

SELECT * FROM aluno_ocean -- Ordena os registros pelo campo nome e os exibe
ORDER BY nome;

SELECT * FROM aluno_ocean -- Ordena os registros em ordem decrescente pelo campo nome e os exibe
ORDER BY nome DESC;

SELECT nome, telefone_celular FROM aluno_ocean; -- Retorna apenas os campos espeificados dos registros da tabela aluno_ocean

SELECT nome, telefone_celular FROM aluno_ocean -- Retorna os campos especificados do registro com o id = 2
WHERE id = 2;

use sakila;

SELECT * FROM rental -- Seleciona os registros onde o valor do campo inventory_id é igual a 1044 e os ordena pelo campo customer_id
WHERE inventory_id = 1044
ORDER BY customer_id;

SELECT * FROM rental -- Seleciona os registros onde o valor do campo inventory_id é maior que 500 e os ordena pelo campo customer_id
WHERE inventory_id > 500
ORDER BY customer_id;

SELECT * FROM rental -- Seleciona os registros onde o valor do campo inventory_id está entre 500 e 1000 e os ordena pelo campo customer_id
WHERE inventory_id BETWEEN 500 and 1000
ORDER BY customer_id;

use escola;

-- Funções de Agregação:

SELECT COUNT(nome) FROM aluno_ocean; -- Conta os registros em uma coluna da tabela

SELECT MAX(telefone_celular) FROM aluno_ocean; -- Retorna o maior valor em uma coluna da tabela

SELECT MIN(telefone_celular) FROM aluno_ocean; -- Retorna o menor valor em uma coluna da tabela

SELECT SUM(telefone_celular) FROM aluno_ocean; -- Retorna a soma dos valores de uma coluna da tabela

-- Relacionamento entre Tabelas:

describe aluno_ocean;
CREATE TABLE IF NOT EXISTS curso (
	id_curso int not null auto_increment primary key,
    nome varchar(30) not null,
    dia varchar(30) not null,
    id_aluno int,
    CONSTRAINT fk_alunocurso foreign key (id_aluno) references aluno_ocean(id) -- Estabelece a Chave Estrangeira que cria a relação entre as tabelas
    );

INSERT INTO aluno_ocean (nome, telefone_celular)
values
("Carlos", 22995438713),
("Maria", 36886456173);

select * from aluno_ocean;

INSERT INTO curso (nome, dia, id_aluno)
values
("SQL", "Segunda", 1),
("Python", "Terça", 2),
("GIT", "Quarta", 5),
("Docker", "Quinta", 4);

-- JOINS:

-- INNER JOIN:

SELECT * FROM aluno_ocean
INNER JOIN curso -- Retorna a Intercessão entre as duas tabelas
ON aluno_ocean.id = curso.id_aluno; -- Estabelece a relação entre as tabelas com os dados equivalentes nas duas

INSERT INTO aluno_ocean (nome, telefone_celular) values ("João", 56489756312);
INSERT INTO curso (nome, dia) values ("JavaScript", "Sabado");

-- LEFT JOIN:

SELECT * FROM aluno_ocean
LEFT JOIN curso -- Retorna Todos os Registros da Tabela da Esquerda (aluno_ocean) e os dados correspondentes na Tabela da Direita (curso)
ON aluno_ocean.id = curso.id_aluno;

-- RIGHT JOIN:

SELECT * FROM aluno_ocean
RIGHT JOIN curso -- Retorna Todos os Registros da Tabela da Direita (curso) e os dados correspondentes na Tabela da Esquerda (aluno_ocean)
ON aluno_ocean.id = curso.id_aluno;

-- FULL JOIN:

SELECT * FROM aluno_ocean
FULL JOIN curso -- Retorna Todos os Registros das Duas Tabelas
ON aluno_ocean.id = curso.id_aluno;

-- FULL JOIN No MySQL:

SELECT * FROM aluno_ocean
LEFT JOIN curso -- Retorna Todos os Registros da Tabela da Esquerda (aluno_ocean) e os dados correspondentes na Tabela da Direita (curso)
ON aluno_ocean.id = curso.id_aluno
UNION
SELECT * FROM aluno_ocean
RIGHT JOIN curso -- Retorna Todos os Registros da Tabela da Direita (curso) e os dados correspondentes na Tabela da Esquerda (aluno_ocean)
ON aluno_ocean.id = curso.id_aluno;