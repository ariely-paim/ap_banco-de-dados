create database db_AtividadePontuada;

use db_AtividadePontuada;

create table cliente(
	id int primary key not null identity,
	nome varchar(100) not null, 
	bonus bit not null
)

create table telefoneCliente(
	id int primary key not null identity,
	cliente_id int not null,
	numero int not null,
	constraint fk_telefoneCliente_cliente foreign key (cliente_id) references cliente(id),
)

create table enderecoCliente(
	id int primary key not null identity,
	cidade varchar(200) not null, 
	bairro varchar(200) not null, 
	rua varchar(200) not null, 
	cep int not null, 
	numero int not null, 
	cliente_id int not null,
	constraint fk_enderecoCliente_cliente foreign key (cliente_id) references cliente(id)
)

create table funcionario(
	id int primary key not null identity,
	nome varchar(100) not null, 
	cpf varchar(11) not null unique,
	carga_horaria int not null,
	endereço varchar(400) not null, 
)

create table telefoneFuncionario(
	id int primary key not null identity,
	funcionario_id int not null,
	numero int not null,
	constraint fk_telefoneFuncionario_funcionario foreign key (funcionario_id) references funcionario(id),
)

create table compra(
	id int primary key not null identity,
	datac date not null,
	funcionario_id int not null,
	cliente_id int not null,
	constraint fk_compra_cliente foreign key (cliente_id) references cliente(id),
	constraint fk_compra_funcionario foreign key (funcionario_id) references funcionario(id)
)

create table fornecedor(
	id int primary key not null identity,
	nome varchar(100) not null, 
	localização varchar(500) not null,
)

create table produto(
	id int primary key not null identity,
	nome varchar(100) not null, 
	estoque varchar(50) not null, 
	validade date not null,
	valor smallmoney not null,
	fornecedor_id int not null,
	constraint fk_produto_fornecedor foreign key (fornecedor_id) references fornecedor(id)
)

create table produtoCompra(
	id int primary key not null identity,
	compra_id int not null,
	produto_id int not null,
	constraint fk_produtoCompra_compra foreign key (compra_id) references compra(id),
	constraint fk_produtoCompra_produto foreign key (produto_id) references produto(id)
)

alter table cliente add idade int not null;

SET IDENTITY_INSERT cliente ON
insert into cliente values(0, 'José', 0, 33);
insert into cliente values(0, 'Carlos', 1, 45);
insert into cliente values(0, 'Andreia', 0, 30);
insert into cliente values(0, 'Breno', 1, 27);
insert into cliente values(0, 'Maya', 1, 25);

insert into telefoneCliente values(1,1,081957156834);
insert into telefoneCliente values(2,2,058964821389);
insert into telefoneCliente values(3,3,015934189242);
insert into telefoneCliente values(4,4,053924586325);
insert into telefoneCliente values(5,5,046931586314);

insert into enderecoCliente values(0, 'Foz do Iguaçu', 'São Cristóvão', 'Santa Catarina', 49065881, 255, 1);
insert into enderecoCliente values(0, 'Santo Antônio de Jesus', 'Planalto', 'Rio de Janeiro', 72904502, 3799, 2);
insert into enderecoCliente values(0, 'Dourados', 'Bela Vista', 'Santa Luzia', 72886730, 6773, 3);
insert into enderecoCliente values(0, 'Cachoeiro de Itapemirim', 'Boa Vista', 'da Paz', 72822736, 1035, 4);
insert into enderecoCliente values(0, 'Santa Bárbara do Oeste', 'Bela Vista', 'Bela Vista', 34551731, 480, 5);

insert into funcionario values(0, 'Clara', '02554535245', 7, 'Avenida Governador José Malcher, Nº12');
insert into funcionario values(0, 'Leonardo', '12545556235', 6, 'Avenida Afonso Pena, Nº 94');
insert into funcionario values(0, 'Caitano', '63352500284', 8, 'Rua Pereira Estéfano, Nº 47');
insert into funcionario values(0, 'Lohanna', '33652456256', 6, 'Rua Maria Luísa do Val Penteado, Nº 81');
insert into funcionario values(0, 'Victorio', '32562383156', 7, 'Rua Arthur Santos, Nº6');

insert into telefoneFuncionario values(1, 1, 017938555054);
insert into telefoneFuncionario values(2, 2, 047926124751);
insert into telefoneFuncionario values(3, 3, 071930517715);
insert into telefoneFuncionario values(4, 4, 053938517774);
insert into telefoneFuncionario values(5, 5, 063938173278);

insert into compra values(0, 25-03-2019, 1, 1);
insert into compra values(0, 03-11-2021, 2, 2);
insert into compra values(0, 16-08-2020, 3, 3);
insert into compra values(0, 31-10-2022, 4, 4);
insert into compra values(0, 07-05-2020, 5, 5);

insert into fornecedor values(0,  'Hiper bom', 'Rua Quinze de Outubro');
insert into fornecedor values(0,  'Compre Bem', 'Praça Vereador Euclides Feliciano da Silva');
insert into fornecedor values(0,  'Preço Mini', 'Rua Duque de Caxias');
insert into fornecedor values(0,  'Quinta estrela', 'Praça Ayrton Senna');
insert into fornecedor values(0,  'Boas Compras', 'Rua Hanna Salin Amin');

alter table produto drop column estoque;
alter table produto add estoque int not null;

insert into produto values('leite condensado', 14, '22/12/2022', 9.00, 1);
insert into produto values(0, 'macarrão instantaneo', 27, '07/01/2023', 14.00, 2);
insert into produto values(0, 'biscoito', 31, '11/11/2022', 4.50, 3);
insert into produto values(0, 'polpa de fruta', 23, '23/11/2022', 1.99, 4);
insert into produto values(0, 'garrafa de água', 19, '13/05/2023', 5.50, 5);

insert into produtoCompra values(1, 1, 1);
insert into produtoCompra values(2, 2, 2);
insert into produtoCompra values(3, 3, 3);
insert into produtoCompra values(4, 4, 4);
insert into produtoCompra values(5, 5, 5);

update cliente set nome = 'Andre' where id = 1;
update telefoneCliente set numero = 081957156838 where id = 1;
update enderecoCliente set numero = 258 where id = 1;
update funcionario set nome = 'Clara Luisa' where id = 1;
update telefoneFuncionario set numero = 017938555056 where id = 1;
update compra set datac = 25-03-2024 where id = 1;
update fornecedor set nome = 'Hiper bom preço' where id = 1;
update produto set nome = 'creme de leite' where id = 1;
update produtoCompra set produto_id = 258 where id = 1;

delete from cliente where id = 5;
delete from telefoneCliente where id = 5;
delete from enderecoCliente where id = 5;
delete from funcionario where id = 5;
delete from telefoneFuncionario where id = 5;
delete from compra where id = 5;
delete from fornecedor where id = 5;
delete from produto where id = 5;
delete from produtoCompra where id = 5;
