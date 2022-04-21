#drop database biblioteca;

create database biblioteca;

use biblioteca;

create table tbl_bibliotecario(
     codigo_bibliotecario int(11) primary key auto_increment,
     nome_bibliotecario varchar(45) not null,
     nasc_bibliotecario date not null,
     telefone varchar(45) not null,
     FK_biblio_responsavel int(11) not null,
     constraint FK_biblio_responsavel foreign key(FK_biblio_responsavel) references tbl_bibliotecario(codigo_bibliotecario)
     
);

create table tbl_cliente(
     codigo_cliente int(11) primary key auto_increment,
     nome_cliente varchar(45) not null,
     cpf_cliente varchar(45) not null,
     nasc_cliente date not null,
     email varchar(45) not null
     
);

create table tbl_emprestimo(
	codigo_emprestimo int(11) primary key auto_increment,
    retirada datetime not null,
    devolucao datetime not null,
    FK_bibliotecario int(11) not null,
    FK_cliente int(11) not null,
    constraint FK_bibliotecario foreign key(FK_bibliotecario) references tbl_bibliotecario(codigo_bibliotecario),
    constraint FK_cliente foreign key(FK_cliente) references tbl_cliente(codigo_cliente)
    
);
create table tbl_editora(
	codigo_editora int(11) primary key auto_increment,
    nome_editora varchar(100) not null,
    cnpj varchar(45) not null,
    email varchar(100) not null
);

create table tbl_categoria(
	codigo_categoria int(11) primary key auto_increment,
    nome_categoria varchar(45) not null
    
);

create table tbl_livros(
     codigo_livro int(11) primary key auto_increment,
     nome_livro varchar(45) not null,
     data_publicacao date not null,
     paginas int(11) not null,
     valor_unitario decimal(6,2) not null,
	 FK_categoria int(11) not null,
     FK_editora int(11) not null,
     constraint FK_categoria foreign key(FK_categoria) references tbl_categoria(codigo_categoria),
     constraint FK_editora foreign key(FK_editora) references tbl_editora(codigo_editora)
);




create table livro_emprestimo(
     FK_livro int(11) not null,
     FK_emprestimo int(11) not null,
     constraint FK_livro foreign key(FK_livro) references tbl_livros(codigo_livro),
     constraint FK_emprestimo foreign key(FK_emprestimo) references tbl_emprestimo(codigo_emprestimo)
);





create table tbl_autor(
	codigo_autor int(11) primary key auto_increment,
    nome_autor varchar(45) not null,
    nasc_autor date not null,
    nacionalidade varchar(45) not null
);

create table autor_livro(
	FK_autor int(11) ,
    Fk_livro int(11) ,
    constraint FK_autor foreign key(FK_autor) references tbl_autor(codigo_autor),
    constraint FK_livro1 foreign key(FK_livro) references tbl_livros(codigo_livro)
);

select * from tbl_livros;

desc tbl_livros;
