-- CRIAÇÃO DAS TABELAS (DDL) --

create table endereco(
	id serial primary key not null,
	CEP varchar(8) not null,
	estado varchar(2) not null,
	cidade text not null,
	bairro text not null,
	rua text not null,
	numero varchar(10) not null,
	complemento text
);

create table usuario(
	id serial primary key not null,
	nome text not null,
	sexo char(1) not null check(sexo in ('M', 'F')),
	telefone varchar,
	celular varchar not null,
	login varchar unique not null,
	email varchar(255) unique not null,
	senha varchar(50) not null,
	cpf varchar unique not null,
	data_nascimento date not null,
	id_endereco integer not null,
	foreign key (id_endereco) references endereco(id)
);

create table categoria(
	id serial primary key not null,
	nome text not null,
	descricao text not null
);

/*
create table estoque(
	id serial primary key not null,  -- Tabela estoque deixou de existir, porque ela é obtida de forma DQL  --
	qtd_estoque integer not null
);
*/

create table produto(
	id serial primary key not null,
	id_vendedor integer not null,
	foreign key (id_vendedor) references usuario(id),
	id_categoria integer not null,
	foreign key (id_categoria) references categoria(id),
--	id_estoque integer not null,
--	foreign key (id_estoque) references estoque(id), -- Chave que se refere ao estoque não existe mais --
	nome text not null not null,
	descricao text not null,
	data_fabricacao date not null
);

create table produto_usuario(
	id serial primary key not null,
	id_usuario integer not null,
	foreign key (id_usuario) references usuario(id),
	id_produto integer not null,
	foreign key (id_produto) references produto(id),
	qtd_produto integer not null,
	preco_unidade integer not null,
	data_compra date not null
);


-- INSERÇÃO DE DADOS (DML) --



insert into endereco (CEP, estado, cidade, bairro, rua, numero, complemento) values 
(12753923, 'MT', 'Cuiabá', 'São José', 'Santa Luzia', 8955, 'Loja 6'),
(58701375, 'PB', 'Paraíba', 'Patos', 'Maternidade', 692, 'null'),
(57062340, 'AL', 'Maceió', 'Petrópolis', 'Alameda Professora Alzira Rocha de Lima', 379, 'Conjunto 2'),
(67724192, 'DF', 'Brasília', 'Industrial', 'Quinze de Novembro', 5347, 'Galeria 6'),
(69203278, 'RO', 'Ariquemes', 'São José', 'Bela Vista', 6639, 'Fazenda 8'),
(65417145, 'AM', 'Itacoatiara', 'São Cristóvão', 'Sergipe', 7285, 'Casa 3'),
(29220080, 'PB', 'Paraíba', 'Boa Vista', 'Rua Pedro Barbosa', 12, 'do lado da padaria do joao'),
(35405144, 'SP', 'Campinas', 'Americanas', 'Vila Mimosa', 1040, 'depois da loja 10'),
(77452033, 'BA', 'Bahia', 'Salvador', 'Cajazeiras', 302, 'perto do acaraje da dona cleide'),
(60534151, 'CE', 'Fortaleza', 'Vila Corveta', 'Parque Genibaú', 122, 'bloco 4'),
(76901456, 'RO', 'Paraná', 'Copas Verdes', 'Rua Elvira Evangelista da Silva', 300, 'rua c'),
(64034407, 'PI', 'Teresina', 'Angelim', 'Rua Campolândia', '766', 'lote 20');

insert into endereco(CEP, estado, cidade, bairro, rua, numero, complemento) values
(20453040, 'RJ', 'Centro', 'Tijuca', 'Avenida Tim Maia', 42, '310 A'),
(87632134, 'RS', 'Santa Rosa', 'Tatuape', 'Rua dos Baixinhos', 24, '1023 C'),
(23145232, 'ES', 'Cachoeiro de Itapemirim', 'Tatuamao', 'Avenida do Rei', 12, '202 B'),
(20455020, 'RJ', 'Niterói','Itaipu','Rua N','55', null),
(32398621, 'RN', 'Maxaranguape','Maracajáu','Rua São Luiz','59580','apt 101'),
(32398621, 'PR', 'Londrina','Quebec','Rua Maiba Tahan','268', null);

      -- USUÁRIOS --

insert into usuario (nome, sexo, telefone, celular, login, email, senha, cpf, data_nascimento, id_endereco) values 
('Martin Davi Levi Campos', 'M', 7529655349, 75989018524, 'martindavilevicampos', 'martindavilevicampos-71@transportadoratransdel.com.brr', 'pO7$%2WsO', 72185772457,  '1993-09-17', 1),
('Andrea Camila Campos', 'F', 8329447303, 83982771804, 'andrea_camila', 'andreacamilacampos_@brf-br.com', 'ADgkopPmDd', 34601891264, '2002-12-23', 2),
('Heloisa Beatriz Daiane', 'M', null, 82981281066, 'helo_bia', 'heloisabeatrizdaianedaconceicao@estruturalbr.com.br', 'Sfzmb0EAqE', 81390458024,  '1995-09-21', 3),
('Carlos Moreira Barbosa', 'M', 84895162723, 84949118805, 'carlos-moreira-barbosa', 'francisco@francisco.com.br', 'yX8#E4*e6', 65188345, '2001-09-17' ,4),
('Antonio Ferreira Nunes', 'M', 'null', 21925931508, 'antonionunes27', 'antonio@ferreira.com.br', 'pO5&g@kSv', 99988408218, '2003-09-17', 5),
('Sofia Almeida Lima', 'F', 61614157809, 61975292944, 'sofiaalmeida123', 'sofia@todas.com', 'bW5^Nvo2Z', 16374532152, '1996-09-17', 6),
('Tereza Mirella Marcela Aparício', 'F', 1138387629, 11993662868, 'Tereza22', 'terezamirellamarcelaaparicio@baltico.com.br', 'WGfXFWW1al', 95556098964, '1942-04-12', 7),
('Sandra Esther Renata Sales', 'F', 6725256286, 67982418061, 'sasandra', 'ssandraestherrenatasales@yahooo.com.br', 'WGfXFWW1al', 49105491371, '1992-04-11', 8),
('João Isaac Teixeira', 'M', null, 27989367699, 'texeiramatanub', 'joaoisaacteixeira@disparco.com.br', 'EpSWcT0MdZ', 22473270449, '1952-05-12', 9),
('Cláudia Silvana Cristiane da Costa', 'F', 8529043354, 85993480138, 'clausilva12', 'claudiasilvanacristianedacosta-93@alanamaral.com.br', '9ZKMTETCUH', 13298172812, '1994-09-15', 10),
('Luiz Davi Rodrigues', 'M', null, 6998728-9006, 'Luizdrig45', 'luizdavirodrigues-75@supercarioca.com', 'M8pytwjytU', 90571709737, '1995-11-09', 11),
('Isabelle Sônia Alves', 'M', 8635554847, 86996372302, 'bellealves35', 'isabellesoniaalves@hotmaill.com', 'XMSLoO4IQR', 10849740371, '1961-04-13', 12),

insert into usuario (nome, sexo, telefone, celular, login, email, senha, cpf, data_nascimento, id_endereco) values 
('Antônio Fagundes de Souza','M', 44028922, 2120269102,'Anthumfag','Antomsouza02@hotmail.com','Sbk1042', 113815639, '1979-07-24', 13),
('Mariana Ribeira de Alburquerque','F', null, 8461271621,'MariMari7','mari_rib102@outlook.com','jesus1mito',310292911, '1990-10-07', 14),
('João Paulo Gutierres','M',23154311, 4330269102,'JpGut_10','jp_gutierres10@gmail.com','Vasco2001', 225113685, '1984-03-12', 15),
('Tim Maia', 'M', 22478543, 988473521, 'Maiao', 'tim_maia@convidao.com', 'senahashs12', 834213765, '1942-09-28', 16),
('Xuxa', 'F', 22482418, 992435879, 'Adoradora_do_cao', 'rainha_dos_baixinhos@outlook.com', 'asidu124', 666042162, '1963-03-27', 17),
('Roberto Carlos', 'M', 22371712, 988351243, 'O_Rei', 'rei_da_jovemguarda@hotmail.com','275s4d1', 832146320, '1941-04-19', 18);


      -- CATEGORIAS --

insert into categoria(nome, descricao) values 
('Celulares e Comunicação', 'Celulares e acessórios em geral');

insert into categoria (nome, descricao) values 
('Eletrodoméstico', 'Móveis com muita tecnologia.'),
('Alpinismo', 'Atividade de escalar'),
('Moda', 'Diversas vestimentas'),
('Gift Card', 'Vale presente virtual para conteúdo em plataformas e jogos'),
('Pé de pato', 'Acessórios para piscina');

      -- PRODUTOS --

insert into produto(id_vendedor, id_categoria, nome, descricao, data_fabricacao, qtd_estoque, preco) values
(2, 1, 'XIAOMI 7622 Pulseira Smart Mi Band 6', 'Á prova dágua e também pode identificar de forma inteligente os quatro principais estilos de natação.', '2020-03-11', 5, 249.99),
(1, 1, 'Capa protetora iPhone XR, TPU flexível nas extremidades, transparente', 'Protege tanto a parte de trás quanto a borda do aparelho, permitindo acesso aos botões e câmera facilmente.', '2021-01-07', 8, 39.90);

insert into produto(id_vendedor, id_categoria, nome, descricao, data_fabricacao, qtd_estoque, preco) values 
(7, 2, 'Geladeira TecPix 2.0', 'Geladeira TecPix 2.0 com 3 portas de triplas refrigeração. Tira foto, grava videos e faz suco geladinho!', '2021-10-10', 8, 1999.98),
(9, 2, 'Aspirador de pó MP5', 'Aspirador de pó MP5,Com jato de água para lavar seu pé na hora de entrar em casa. Toca música e transmite filme projetado! Ótimo custo benéfico. Possui SO android 45 e suporte para NETFLIX, PRIME VIDEO, GLOBOPLAY, NICKELODEON, TV SENADO, ENTRE OUTROS.', '2020-10-18',  7, 1499.99),
(4, 3, 'Capacete', 'Equipamento utilizado para segurança.', '2020-06-03', 8, 459.99),
(5, 3, 'Cadeirinha', 'Equipamento utilizado para sentar durante a escalada.', '2020-09-09', 6, 500.00),
(10, 4, 'Casaco', 'Roupa para o frio', '2021-05-16', 70, 180.99),
(12, 4, 'Bermuda', 'Roupa utilizada para usar no calor', '2020-02-29', 65, 122.90),
(6, 5, 'Gift Card Spotify de R$30,00', 'Vale presente virtual para a plataforma Spotify com o valor de 30 reais','2021-09-17', 50, 30.00),
(12, 5, 'Gift Card Steam de R$50,00', 'Vale presente virtual para a plataforma Steam com o valor de 50 reais','2021-09-17', 40, 50.00),
(8, 6, 'Pé de pato', 'Acessórios para piscina', '2021-08-03', 20, 120.30),
(3, 6, 'Sunga', 'Acessórios para piscina', '2020-08-12', 130, 93.90);


      -- PEDIDOS --


insert into produto_usuario(id_usuario, id_produto, qtd_produto, preco_unidade, data_compra) values
(5, 9, 1, 30.00, '2021-09-18'),
(2, 9, 2, 30.00, '2021-09-23'),
(9, 10, 1, 50.00, '2021-09-20'),
(9, 3, 1, 1999.98, '2021-10-10'), 
(8, 4, 1, 1499.99, '2020-10-18'),
(7, 3, 2, 3999.96, '2021-12-02'),
(6, 1, 9, 459.99,'2020-08-02'),
(5, 2, 7, 500.00,'2020-11-14'),
(4, 10, 8, 459.99,'2020-10-09');

insert into produto_usuario(id_usuario, id_produto, qtd_produto, preco_unidade, data_compra) values
(12, 7, 1, 180.99, '2021-07-20'),
(11, 8, 1, 180.99, '2021-09-23'),
(10, 5, 2, 122.99, '2020-03-24');


-- MODIFICAÇÃO DE DADOS (DML) --


UPDATE usuario
SET celular = '69987289006'
where  celular = '6989722';

UPDATE produto
SET id = 1
where  id = 13;

UPDATE produto
SET id = 2
where  id = 14;

update produto 
set id = 3 
WHERE id = 35; 

update produto 
set id = 4 
WHERE id = 36;

UPDATE produto
SET id = 7
WHERE id = 39;

UPDATE produto
SET id = 8
WHERE id = 40;

UPDATE produto
set id = 5
where id =37;

UPDATE produto
set id = 6
where id =38;

UPDATE produto
SET id = 11
WHERE id = 43;

UPDATE produto
SET id = 12
WHERE id = 44;

UPDATE produto
set id = 9
where id = 41;

UPDATE produto
set id = 10
where id = 42;

ALTER TABLE produto ADD COLUMN qtd_estoque integer not null check (qtd_estoque >= 0); -- Quantidade em estoque vinculado ao produto --

ALTER TABLE produto ADD COLUMN preco numeric(6,2) not null check (preco > 0); -- Preço do produto vinculado ao produto --

alter table produto_usuario ADD COLUMN preco_unidade numeric(6,2); -- Preço da unidade passa a ser do tipo numérico para não arredondar o valor --


-- DELEÇÃO DE DADOS (DML) --


ALTER TABLE produto DROP COLUMN id_estoque;

ALTER TABLE produto_usuario DROP COLUMN preco_unidade;

DROP table estoque;

DELETE FROM usuario
WHERE telefone = '44028922'

-- CONSULTA DE DADOS (DQL) -- 

       -- ESTOQUE --

select id, nome, qtd_estoque
from produto;

        -- FRETE --

select id,
(select nome Destinatário from usuario where id = id_usuario),
(select nome Produto from produto where id = id_produto),
(select endereco Endereço from endereco where id = id_usuario),
qtd_produto quantidade,
preco_unidade preço,
data_compra registro
from produto_usuario

      -- NOTA FISCAL --

select u.nome comprador, p.nome produto, pu.qtd_produto quantidade, pu.preco_unidade preço, pu.data_compra registro, p.id_vendedor
from produto_usuario pu, usuario u, produto p
where pu.id_usuario = u.id
and p.id = pu.id_produto
order by u.nome

      -- QUANTIDADE DE COMPRAS POR USUÁRIO --

select count (pu.id) as quantidade_compras, u.nome
from usuario u
inner join produto_usuario pu on pu.id_usuario = u.id
group by pu.id_usuario, u.nome
order by quantidade_compras

       -- LOGIN DE USUÁRIOS CADASTRADOS --

select email, login, senha
from usuario
