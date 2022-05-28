# DDL (DATA DEFINITION LANGUAGE) -> CREATE ALTER DROP --> ESTRUTURA
# DML (DATA MANIPULATION LANGUAGE) -> INSERT UPDATE DELETE *SELECT --> DADOS
# DTL (DATA TRANSACTION LANGUAGE) -> COMMIT ROLLBACK --> CHECKPOINTS DE DML

# update tbl set campo_novo="valor", ... where id=1;
# delete from tbl where id=1;


# Hard delete = deleta o dado diretamente
# Soft delete  = Insere uma nova coluna na tabela dizendo se o usuario foi excluido ou nâo de forma boleana

#DROP DATABASE cinema2022;

CREATE DATABASE cinema2022;

USE cinema2022;

CREATE TABLE  tbl_usuario (
	id_usuario int primary key auto_increment,
    email varchar(60) not null,
    senha varchar(20) not null,
    nome_usuario varchar(30) not null
);

CREATE TABLE tbl_ator (
    id_ator INT PRIMARY KEY AUTO_INCREMENT,
    nome_ator VARCHAR(45) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    dt_nascimento DATE NOT NULL
);  

CREATE TABLE tbl_diretor (
    id_diretor INT PRIMARY KEY AUTO_INCREMENT,
    nome_diretor VARCHAR(45) NOT NULL,
    nacionalidade VARCHAR(40) NOT NULL,
    dt_nascimento DATE NOT NULL
);

CREATE TABLE tbl_genero (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    genero VARCHAR(45) NOT NULL
);

CREATE TABLE tbl_filme (
    id_filme INT PRIMARY KEY AUTO_INCREMENT,
    nome_filme_PT VARCHAR(45) NOT NULL,
    nome_filme_EN VARCHAR(45),
    ano_lancamento INT NOT NULL,
    duracao INT NOT NULL,
    fk_id_genero INT NOT NULL,
    fk_id_diretor INT NOT NULL,
    CONSTRAINT fk_id_genero FOREIGN KEY (fk_id_genero)
        REFERENCES tbl_genero (id_genero),
    CONSTRAINT fk_id_diretor FOREIGN KEY (fk_id_diretor)
        REFERENCES tbl_diretor (id_diretor)
);


CREATE TABLE tbl_filme_has_tbl_ator (
    fk_id_filme INT,
    fk_id_ator INT,
    PRIMARY KEY (fk_id_filme , fk_id_ator),
    CONSTRAINT fk_id_filme FOREIGN KEY (fk_id_filme)
        REFERENCES tbl_filme (id_filme),
    CONSTRAINT fk_id_ator FOREIGN KEY (fk_id_ator)
        REFERENCES tbl_ator (id_ator)
);

# Exercicio de alter
alter table tbl_diretor add column sexo varchar(1) not null;
alter table tbl_diretor modify nacionalidade varchar(45) not null;
alter table tbl_filme drop nome_filme_EN;
alter table tbl_filme change nome_filme_PT nome_filme varchar(45) not null;
alter table tbl_filme_has_tbl_ator rename filme_e_ator;

# exemplos de possibilidades par a alteração das nossas tabelas.
/*
CREATE TABLE exemplo(
	id int primary key auto_increment,
    nome varchar(10) not null,
    cpf varchar(10) not null,
    idade varchar(20) not null,
    estado varchar(20) not null
);

# Acrescentar novas colunas a minha tabela.
alter table exemplo add column dt_nascimento date not null; 				# Alter serve para inserir um elemento em uma tabel.

desc exemplo; 																# Comando desc serve para ver a tabela em formato excel. {somente para estrutura)

# Excluir colunas das minhas tabelas.
alter table exemplo drop column dt_nascimento;								# Comando para excluir um elemento de uma tabelas

# Modificar um tipo de dado das colunas.
alter table exemplo modify cpf varchar(11) not null;						# Precisa colocar todas as caracteristicas, mesmo as antigas, pois, se perde

# Modificar o nome das colunas existentes em uma tabela.
alter table exemplo change estado estado_civil varchar(45) not null;		# Dois parametros, sendo nome antigo e novo nome

# Renomear as tabelas do banco.
alter table exemplo rename caju;											# nome_antigo RENAME novo_nome
*/



# INSERINDO DADOS

# exemplos de possibilidades par a alteração das nossas tabelas.
/*
CREATE TABLE exemplo(
	id int primary key auto_increment,
    nome varchar(10) not null,
    cpf varchar(10) not null,
    idade varchar(20) not null,
    estado varchar(20) not null
);


# Acrescentar novas colunas a minha tabela.
alter table exemplo add column dt_nascimento date not null; 				# Alter serve para inserir um elemento em uma tabel.

desc exemplo; 																# Comando desc serve para ver a tabela em formato excel. {somente para estrutura)

# Excluir colunas das minhas tabelas.
alter table exemplo drop column dt_nascimento;								# Comando para excluir um elemento de uma tabelas

# Modificar um tipo de dado das colunas.
alter table exemplo modify cpf varchar(11) not null;						# Precisa colocar todas as caracteristicas, mesmo as antigas, pois, se perde

# Modificar o nome das colunas existentes em uma tabela.
alter table exemplo change estado estado_civil varchar(45) not null;		# Dois parametros, sendo nome antigo e novo nome

# Renomear as tabelas do banco.
alter table exemplo rename caju;											# nome_antigo RENAME novo_nome
*/

/* Exemplos para o comando INSERT
Para vizualizar os dados use o comando SELECT *FROM tbl_nome;

Primeiro modo 
	INSERT INTO nome_tbl(campos),
		values(valores) # devem seguir a ordem que foi escrita os campos acima

Segundo modo # Melhor para inserção de varios dados
	INSERT INTO nome_tbl(campos),
    values
    (valores),
    (valores),
    (valores),

*/

/*
# Modo mais comum do INSERT
insert into tbl_ator(nome_ator, sexo, dt_nascimento)
	values('Will Smith', 'M', '1987-09-02');
insert into tbl_ator(nome_ator, sexo, dt_nascimento)
	values('Jhonny Depp', 'M', '1997-10-11');


# Insere varios dados de uma vez, colocando os dados sendo separados por vigula (sem repetir o comando VALUES)
insert into tbl_diretor(nacionalidade, dt_nascimento, sexo, nome_diretor)
	values
    ('Brasil', '2000-12-25', 'F', 'Ana Maria'),
	('Canada1', '1995-08-30', 'M', 'Roberto'),
	('Siria', '1988-04-15', 'M', 'Amarildo');

*/

insert into tbl_ator(nome_ator, sexo, dt_nascimento)
	values
		("Andrew Garfield", "M", "1983/8/20"),
		("Sandra Bullock", "F", "1964/6/26"),
		("Will Smith", "M", "1968/9/25"),
		("Harrison Ford", "M", "1942/7/13"),
		("Hugh Jackman", "M", "1968/10/12"),
		("Angelina Jolie", "F","1975/6/4"),
		("Keanu Reeves", "M", "1964/9/2"),
		("Jennifer Lawrence", "F", "1990/8/15"),
		("Sylvester Stallone", "M", "1946/7/6"),
		("James Mcavoy", "M", "1979/4/21"),
		("Brad Pitt", "M", "1963/12/18"),
		("Leonardo Dicaprio", "M", "1974/11/11"),
		("Vin Diesel", "M", "1967/7/18"),
		("Johnny Depp", "M", "1963/6/9"),
		("Robin Williams", "M", "1951/7/21"),
		("Robert Downey Jr.", "M", "1965/4/4"),
		("Patrick Stewart", "M", "1940/7/13"),
		("Sandra Bullock", "F", "1964/7/26"),
		("Jackie Chan", "M", "1954/4/7"),
		("Jennifer Aniston", "F", "1969/2/11"),
		("Jim Carrey", "M", "1962/1/17"),
		("Scarlett Johansson", "F", "1984/11/22"),
		("Megan Fox", "F", "1986/5/16"),
		("Ben Stiller", "M", "1965/11/30"),
		("Emma Stone", "F", "1988/11/6");


insert into tbl_diretor(nome_diretor, nacionalidade, dt_nascimento, sexo)
	values
	 ("Steven Spielberg", "Estados Unidos", "1946/12/18", "M"),
	 ("James Cameron", "Canada", "1954/8/16", "M"),
	 ("José Padilha", "Brasil", "1967/8/1", "M"),
	 ("George Lucas", "Estados Unidos", "1944/5/14", "M"),
	 ("Alan Rickman", "Inglaterra", "1946/2/21", "M"),
	 ("Fernando Meirelles", "Brasil", "1965/11/9", "M");


insert into tbl_genero(genero)
	values
	 ("Terror"),
	 ("Ação"),
	 ("Comedia"),
	 ("Drama"),
	 ("Suspense"),
	 ("Ficção"),
	 ("Romance"),
	 ("Animação");


insert into tbl_filme(nome_filme, ano_lancamento, duracao, fk_id_genero, fk_id_diretor)
	values
	 ("Viva: A Vida é Uma Festa", "2017", "105", "8", "5"),
	 ("Logan", "2017", "137", "2", "1"),
	 ("Um Sonho de Liberdade", "1995", "142", "4", "5"),
	 ("Matrix", "1999", "150", "6", "1"),
	 ("Jumanji", "1996", "104", "3", "6"),
	 ("Cidade de Deus", "2002", "135", "2", "3"),
	 ("O Resgate do Soldado Ryan", "1998", "170", "2", "6"),
	 ("Extraordinário", "2017", "113", "4", "5"),
	 ("O Poderoso Chefão", "1972", "178", "2", "2"),
	 ("Forrest Gump", "1994", "142", "7", "1"),
	 ("Truque de Mestre", "2013", "125", "2", "4"),
	 ("Fragmentado", "2017", "117", "4", "6"),
	 ("Avatar", "2009", "162", "6", "2"),
	 ("O Preço do Amanhã", "2011", "109", "2", "3"),
	 ("O Senhor dos Anéis: O Retorno do Rei", "2003", "200", "6", "5"),
	 ("Toy Story", "1995", "141", "8", "2"),
	 ("Star Wars: Os Últimos Jedi", "2017", "152", "6", "4"),
	 ("O Menino do Pijama Listrado", "2008", "94", "4", "1"),
	 ("O Lobo de Wall Street", "2013", "181", "4", "6"),
	 ("A Hora do Rush", "1998", "98", "3", "5"),
	 ("Piratas do Caribe - Maldição do Perola Negra", "2003", "143", "2", "4"),
	 ("Passengeiros", "2016", "116", "2", "1"),
	 ("Beleza Oculta", "2016", "97", "4", "2"),
	 ("It - A Coisa", "2017", "134", "1", "3"),
	 ("Rocky V", "1990", "111", "4", "4"),
	 ("Titanic", "1997", "195", "7", "4"),
	 ("Vingadores 4", "2019", "150", "2", "2"),
	 ("Velozes e Furiosos 8", "2017", "136", "2", "6"),
	 ("Transformers", "2007", "150", "2", "4"),
	 ("Ilha do Medo", "2010", "139", "5", "1");



# Comandos DQL
# Obs != == <> (True)
 
/*
# Exemplo de select para mostrar dados selecionados
select nome_ator, sexo from tbl_ator;

# Exemplo de select com dados selecionados com caso especifico
select nome_ator, sexo
	from tbl_ator where sexo = 'F';

select nome_filme, ano_lancamento ,duracao
	from tbl_filme where ano_lancamento <= '1980';

select nome_filme, duracao, ano_lancamento
	from tbl_filme where ano_lancamento between 2000 and 2015
		and duracao <= 170;
*/

# SELECIONE O NOME DO DIRETOR A A NACIONALIDADE DATA NASCIMENTO E SEXO PARA TODOS OS DIRETORES DO SECULO MASCULINO QUE NASCERAM NOS ESTADOS UNIDOS E NASCERAM DEPOIS DE 1945.
/*
select nome_diretor, nacionalidade, dt_nascimento, sexo
	from tbl_diretor where sexo = 'M' and nacionalidade = 'Estados Unidos' and dt_nascimento > '1945/00/00';
*/



# Funções de agregação 
/*
	sum()
    avg()
    min()
    max()
    count()
*/

# Exibir o total de duração dos filmes 
# select sum(duracao) from tbl_filme; # Sem titulo personalizado
# select sum(duracao) total_minutos from tbl_filme; # Com titulo personalizado


# Exibe a média
# select avg(duracao) media_minutos from tbl_filme;


# Exibe o menor numero 
# select min(duracao) menor_duracao from tbl_filme;

# Exibe o primeiro elemento em ordem alfabetica
# select min(nome_ator) from tbl_ator;


# Exibe o maior numero
# select max(duracao) maior_duracao from tbl_filme;

# Exibe o ultimo elemento em ordem alfabetica
# select max(nome_ator) from tbl_ator;


# Conta a quantidade de itens
# select count(nome_ator) Total_ator from tbl_ator;

# Seleciona quantos diretores nasceram no Brasil
# select count(nome_diretor) total_diretor from tbl_diretor
#	where nacionalidade = 'Brasil';

# Selecione a quantidade de filmes de ação lançados antes do ano 2000
#select count(nome_filme) qtd_filme from tbl_filme
#	where ano_lancamento <= 2000 and fk_id_genero = '2'; # id 2 = ação


# Média dos filmes depois de 2000
# select avg(duracao) media_filmes_2000 
#	from tbl_filme where ano_lancamento > 2000;

# Apresente a media e a soma da duracao dos files em um unico select
# select avg(duracao) media_duracao, sum(duracao) total_minutos
#	from tbl_filme where ano_lancamento > 2000;


# ORDER BY - Comando responsavel por realizar uma "ordenação por" determinado campo.
# selecione todos os filmes exibindo os em ordem alfabetica
# select * from tbl_filme order by nome_filme; 		# A a Z (comando ASC faz ordenar por padrão obs: defalt)
# select * from tbl_filme order by nome_filme desc; 	# Z a A (comando DESC faz ordenar de forma ao contraria)

# select * from tbl_filme order by ano_lancamento, duracao; # Caso tenha casos identicos ele tera uma segunda ordem de ordenação

# GROUP BY - Utilizado para agrupar determinado dados a partir de dados a sua escolha
# Exibir todos os paises dos diretores
# select nacionalidade from tbl_diretor; # Mostra dados repetidos

# select nacionalidade from tbl_diretor group by nacionalidade; # nao mostra os dados repetidos

# select count(nacionalidade) total_diretores, nacionalidade from tbl_diretor
#	group by nacionalidade; # Conta a quantidade de pessoas com a nacionalidade mostrando a mesma

# Informe quantos atores e atrizes temos
# select count(sexo) total_atores, sexo from tbl_ator
#	group by sexo;

# Contagem de atores que nasceram antes dos anos 80
# select count(sexo) total_atores, sexo from tbl_ator
#	where dt_nascimento < "1980-01-01"
#		group by sexo;


# Comando LIKE serve para selecionar um item sem precisar escrever exatamente o nome completo
# select * from tbl_diretor
#	where nome_diretor like "José %"; # A % significa um coringa para completar de acordo com a querie

# select * from tbl_diretor
#	where nome_diretor like "J%";


select * from tbl_usuario;

#1- Selecionar todos os atores que comecem com a letra "A".
select * from tbl_ator where nome_ator like "A%";

