insert into Cliente (Nome,Sobrenome,Email,AceitaComunicados) values('Paulo','Ricardo','paulo@gmail.com',1)

select* from Cliente where Nome = 'Paulo'

update Cliente set Email = 'email@gmail.com' where Id = 17

delete Cliente where Id = 16

begin tran
rollback

create table Produtos (
	Id int identity(1,1) primary key not null,
	Nome varchar(255) not null,
	Cor varchar(50) null,
	Preco decimal(13,2) not null,
	Tamanho varchar(5) null,
	Genero char(1) null
)

select MAX(Preco),Nome Total from Produtos

select upper(Nome) Nome, Format(DataCadastro,'dd/MM/yyyy') DataCadastro  from Produtos

alter table Produtos
add DataCadastro datetime2

alter table Produtos
drop column DataCadastro

update Produtos set DataCadastro = GETDATE()

create table Enderecos(
	Id int primary key identity(1,1) not null,
	IdCliente int null,
	Rua varchar(255) null,
	Bairro varchar(255) null,
	Cidade varchar(255) null,
	Estado char(2) null,

	constraint FK_Enderecos_Cliente foreign key(IdCliente)
	references Cliente(Id)
)

insert into Enderecos values(3,'Rua X','Zona Rural','Vicosa','CE')

select* from Cliente inner join Enderecos on Cliente.Id = Enderecos.IdCliente where Cliente.Id = 3
