create database meu_mercado 
default character set utf8
default collate utf8_general_ci;

/*-------------------------------------------------------------*/

create table usuario(
	id_usuario int not null auto_increment,
	nome varchar(100),
    email varchar(100),
    senha varchar(50),
    endereco varchar(100),
    bairro varchar(50),
    cidade varchar(50),
    uf varchar(2),
    cep varchar(10),
    dt_cadastro datetime,
    
    primary key(id_usuario)
) default charset = utf8;


create table mercado(
	id_mercado int not null auto_increment,
	nome varchar(100),    
    endereco varchar(100),
    bairro varchar(50),
    cidade varchar(50),
    uf varchar(2),
    cep varchar(10),
    dt_cadastro datetime,
    vl_entrega decimal(5, 2),
    vl_compra_min decimal(9, 2),
    
    primary key(id_mercado)
) default charset = utf8;

create table produto_categoria(
	id_categoria int not null auto_increment,
    descricao varchar(100),
    ordem tinyint,
    	
    primary key(id_categoria)
) default charset = utf8;

create table produto(
	id_produto int not null auto_increment,
    id_categoria int not null,
	nome varchar(100),    
    descricao varchar(1000),
    unidade varchar(20),    
    preco decimal(9, 2),
    url_foto varchar(1000),
    id_mercado int not null,    
    	
    primary key(id_produto),
    foreign key(id_mercado) references mercado(id_mercado),
    foreign key(id_categoria) references produto_categoria(id_categoria)
) default charset = utf8;


create table pedido(
	id_pedido int not null auto_increment,
    id_mercado int not null,
    id_usuario int not null,	    
    dt_pedido datetime,
    vl_subtotal decimal(9,2),
    vl_entrega decimal(5, 2),
    vl_total decimal(9,2),
    
    endereco varchar(100),
    bairro varchar(50),
    cidade varchar(50),
    uf varchar(2),
    cep varchar(10),
        
    primary key(id_pedido),
    foreign key(id_mercado) references mercado(id_mercado),
    foreign key(id_usuario) references usuario(id_usuario)
) default charset = utf8;

create table pedido_item(
	id_item int not null auto_increment,
    id_pedido int not null,
    id_produto int not null,
    qtd decimal(9,3),
    vl_unitario decimal(9,2),
    vl_total decimal(9,2),
    
    primary key(id_item),
    foreign key(id_pedido) references pedido(id_pedido),
    foreign key(id_produto) references produto(id_produto)
) default charset = utf8;


/*-------------------------------------------------------------*/

insert into usuario(nome, email, senha, endereco, bairro, cidade, uf, cep, dt_cadastro)
values('Heber Stein Mazutti', 'heber@teste.com.br', '12345', 'Av Paulista, 1500', 'Bela Vista', 'São Paulo', 'SP', '03015-500', current_timestamp());

insert into usuario(nome, email, senha, endereco, bairro, cidade, uf, cep, dt_cadastro)
values('João Silva', 'joao@teste.com.br', '12345', 'Av Interlagos, 555', 'Interlagos', 'São Paulo', 'SP', '15850-010', current_timestamp());

insert into mercado(nome, endereco, bairro, cidade, uf, cep, dt_cadastro, vl_entrega, vl_compra_min)
values('Pão de Açúcar', 'Av. Interlagos, 850', 'Interlagos', 'São Paulo', 'SP', '05410-010', current_timestamp(), 8.50, 30);

insert into produto_categoria(descricao, ordem) values('Alimentos', 1);
insert into produto_categoria(descricao, ordem) values('Bebidas', 2);
insert into produto_categoria(descricao, ordem) values('Limpeza', 3);
insert into produto_categoria(descricao, ordem) values('Petshop', 4);
insert into produto_categoria(descricao, ordem) values('Papelaria', 5);
insert into produto_categoria(descricao, ordem) values('Brinquedos', 6);

insert into produto(id_categoria, nome, descricao, unidade, preco, url_foto, id_mercado)
values(1, 'Café Pilão Torrado e Moído', 'Café Pilão torrado e moído embalado a vacuo', '250g', 9.75,  
'https://static.paodeacucar.com/img/uploads/1/671/669671x200x200.jpg', 1);

insert into produto(id_categoria, nome, descricao, unidade, preco, url_foto, id_mercado)
values(1, 'Café 3 Corações Torrado e Moído', 'Café 3 Corações torrado e moído embalado a vacuo', '500g', 18.99,  
'https://static.paodeacucar.com/img/uploads/1/2/656002x200x200.png', 1);

insert into produto(id_categoria, nome, descricao, unidade, preco, url_foto, id_mercado)
values(2, 'Cerveja Heineken Lata', 'O processo de fermentação da Heineken, a exclusiva Levedura A é responsável pelo sabor característico e bem equilibrado, com notas frutadas sutis.', 
'350ml', 4.80,  'https://static.paodeacucar.com/img/uploads/1/623/17634623x200x200.png', 1);


insert into pedido(id_mercado, id_usuario, dt_pedido, vl_subtotal, vl_entrega, vl_total, endereco, bairro, cidade, uf, cep)
values(1, 1, current_timestamp(), 77.10, 8.50, 85.60, 'Av Paulista, 1500', 'Bela Vista', 'São Paulo', 'SP', '03015-500');

insert into pedido_item(id_pedido, id_produto, qtd, vl_unitario, vl_total) values(1, 1, 2, 9.75, 19.50);
insert into pedido_item(id_pedido, id_produto, qtd, vl_unitario, vl_total) values(1, 3, 12, 4.80, 57.60);

/*-------------------------------------------------------------*/

select * from usuario;
select * from mercado;
select * from produto_categoria;
select * from produto;
select * from pedido;
select * from pedido_item;







