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