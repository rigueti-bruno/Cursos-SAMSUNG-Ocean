CREATE TABLE IF NOT EXISTS aluno ( -- Verifica se a tabela já existe no BD antes de criá-la
id_aluno int not null auto_increment primary key,
nome varchar(30) not null,
telefone int not null
);

CREATE TABLE IF NOT EXISTS curso ( -- Verifica se a tabela já existe no BD antes de criá-la
id_curso int not null auto_increment primary key,
nome varchar(30) not null,
dia varchar(30) not null,
id_aluno int, 
CONSTRAINT fk_AlunoCurso foreign key (id_aluno) references aluno (id_aluno)
);

describe curso;

ALTER TABLE aluno
CHANGE COLUMN telefone telefone_celular bigint not null;


INSERT INTO aluno (nome, telefone_celular) -- Insere mais de um registro na tabela
values
("Leticia",11987479886),
("Joenio", 81981479826),
("Bruno", 51854948648),
("Denise", 31985885648);

INSERT INTO curso (nome, dia, id_aluno) -- Insere mais de um registro na tabela
values
("SQL","Segunda", 2),
("Python", "Terça", 1),
("GIT", "Quarta", 3),
("Docker", "Quinta", 4);

select aluno.nome, curso.nome from aluno inner join curso on aluno.id_aluno = curso.id_curso;
select aluno.nome, curso.nome from aluno left join curso on aluno.id_aluno = curso.id_curso;
select aluno.nome, curso.nome from aluno right join curso on aluno.id_aluno = curso.id_curso;

select * from aluno inner join curso on aluno.id_aluno = curso.id_aluno;
select * from aluno left join curso on aluno.id_aluno = curso.id_aluno;
select * from aluno right join curso on aluno.id_aluno = curso.id_aluno;





