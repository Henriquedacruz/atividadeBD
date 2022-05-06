#drop database atividade;
create database atividade;

use atividade;

create table tbl_ator(
	id_ator int primary key auto_increment,#banco de dados vai gerenciar esse campo
	nome_ator varchar(45) not null,
	sexo enum('F','M') not null,
    dt_nascimento date  not null
);
create table tbl_diretor(
	id_diretor int primary key auto_increment,
    nome_diretor varchar(45)not null,
    nacionalidade varchar(45) not null,
    dt_nascimento date not null,
    sexo enum('F','M') not null
);
create table tbl_genero(
	id_genero int primary key auto_increment,
    genero varchar(45) not null
);
create table tbl_filme(
	id_filme int primary key auto_increment,
    nome_filme_pt varchar(45) not null,
    ano_lancamento int not null,
    duracao int not null,
    FK_id_genero int not null,
    FK_id_diretor int not null,
    constraint FK_id_genero foreign key (FK_id_genero) references tbl_genero(id_genero),
    foreign key (FK_id_diretor) references tbl_diretor(id_diretor)
);
create table Filme_e_Ator(
FK_id_filme int not null,
FK_id_ator int not null,
primary key(FK_id_filme, Fk_id_ator),
constraint FK_id_filme foreign key (FK_id_filme) references tbl_filme(id_filme),
foreign key (FK_id_ator) references tbl_ator(id_ator)
);

insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Andrew Garfield' ,'M','1983-08-20');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Sandra Bullock'	, 'F' , '1964-06-26');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Will Smith'	, 'M' , '	1968-09-25');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Harrison Ford'	, 'M' , '	1942-07-13');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Hugh Jackman'	, 'M' , '	1968-10-12');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Angelina Jolie'	, 'F' , '	1975-06-04');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Keanu Reeves'	, 'M' , '	1964-09-02');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Jennifer Lawrence'	, 'F' , '	1990-08-15');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Sylvester Stallone'	, 'M' , '	1946-07-06');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('James Mcavoy'	, 'M' , '	1979-04-21');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Brad Pitt'	, 'M' , '	1963-12-18');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Leonardo Dicaprio'	, 'M' , '	1974-11-11');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Vin Diesel'	, 'M' , '	1967-07-18');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Johnny Depp'	, 'M' , '	1963-06-09');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Robin Williams'	, 'M' , '	1951-07-21');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Robert Downey Jr.'	, 'M' , '	1965-04-04');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Patrick Stewart'	, 'M' , '	1940-07-13');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Sandra Bullock'	, 'F' , '	1964-07-26');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Jackie Chan'	, 'M' , '	1954-04-07');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Jennifer Aniston'	, 'F' , '	1969-02-11');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Jim Carrey'	, 'F' , '	1962-01-17');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Scarlett Johansson'	, 'F' , '	1984-11-22');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Megan Fox'	, 'F' , '	1986-05-16');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Ben Stiller'	, 'F' , '	1965-11-30');
insert into tbl_ator(nome_ator, sexo, dt_nascimento) values('Emma Stone'	, 'F' , '	1988-11-06');

insert into tbl_diretor(nome_diretor,nacionalidade,dt_nascimento,sexo)
	values('Steven Spielberg', 'Estados Unidos', '1946/12/18', 'M'),
	('James Cameron', 'Canada', '1954/08/16', 'M'),
	('José Padilha', 'Brasil', '1967/08/01', 'M'),
	('Alan Rickman', 'Inglaterra', '1946/02/21', 'M'),
	('George Lucas', 'Estados Unidos', '1944/05/14', 'M'),
	('Fernando Meirelles', 'Brasil', '1965/11/09', 'M');
    
insert into tbl_genero(genero)
	values('Terror'),
	('Ação'),
	('Comedia'),
	('Drama'),
	('Suspense'),
	('Ficção'),
	('Romance'),
	('Animação');
    
insert into tbl_filme(nome_filme_pt,ano_lancamento,duracao,FK_id_genero,FK_id_diretor)
	values('Viva: A Vida é Uma Festa', '2017', '105', '8', '5'),
	('Logan', '2017', '137', '2', '1'),
	('Um Sonho de Liberdade', '1995', '142', '4', '5'),
	('Matrix', '1999', '150', '6', '1'),
	('Jumanji', '1996', '104', '3', '6'),
	('Cidade de Deus', '2002', '135', '2', '3'),
	('O Resgate do Soldado Ryan', '1998', '170', '2', '6'),
	('Extraordinário', '2017', '113', '4', '5'),
	('O Poderoso Chefão', '1972', '178', '2', '2'),
	('Forrest Gump', '1994', '142', '7', '1'),
	('Truque de Mestre', '2013', '125', '2', '4'),
	('Fragmentado', '2017', '117', '4', '6'),
	('Avatar', '2009', '162', '6', '2'),
	('O Preço do Amanhã', '2011', '109', '2', '3'),
	('O Senhor dos Anéis: O Retorno do Rei', '2003', '200', '6', '5'),
	('Toy Story', '1995', '141', '8', '2'),
	('Star Wars: Os Últimos Jedi', '2017', '152', '6', '4'),
	('O Menino do Pijama Listrado', '2008', '94', '4', '1'),
	('O Lobo de Wall Street', '2013', '181', '4', '6'),
	('A Hora do Rush', '1998', '98', '3', '5'),
	('Piratas do Caribe - Maldição do Perola Negra', '2003', '143', '2', '4'),
	('Passengeiros', '2016', '116', '2', '1'),
	('Beleza Oculta', '2016', '97', '4', '2'),
	('It - A Coisa', '2017', '134', '1', '3'),
	('Rocky V', '1990', '111', '4', '4'),
	('Titanic', '1997', '195', '7', '4'),
	('Vingadores 4', '2019', '150', '2', '2'),
	('Velozes e Furiosos 8', '2017', '136', '2', '6'),
	('Transformers', '2007', '150', '2', '4'),
	('Ilha do Medo', '2010', '139', '5', '1');
    
update tbl_ator set nome_ator = 'Elizabeth Olsen' where id_ator = 18;
update tbl_ator set sexo = 'M' where id_ator = 21;
update tbl_ator set sexo = 'M' where id_ator = 24;

#select * from tbl_ator;

#select nome_ator, sexo from tbl_ator;

#select nome_ator, sexo from tbl_ator where sexo = 'F';

#select nome_filme_pt, duracao from  tbl_filme where ano_lancamento = '2017';

#sinais funcionam para a clausula where
# | pipe
# trocar sinais <   >  <=  >= <>

#select nome_filme_pt, duracao, ano_lancamento from  tbl_filme where ano_lancamento <> '2017';
#and / or

#sem between
#select nome_filme_pt, duracao, ano_lancamento from tbl_filme where duracao < '170' and ano_lancamento >= '2000' and ano_lancamento <='2015';

#Clausula between  permite retornar intervalos de dados especificados em um filtro
#select * from tbl_filme where duracao < '170' and ano_lancamento between '2000' and '2015';


#exibir o total de duração dos filmes

#select sum(duracao) from tbl_filme;

select sum(duracao) total_minutos from tbl_filme;

#media
select avg(duracao) from tbl_filme where ano_lancamento > 2000;

select sum(duracao) total_minutos,  avg(duracao) ano_lancamento from tbl_filme;

select min(duracao) from tbl_filme;

select min(nome_ator) from tbl_ator;

