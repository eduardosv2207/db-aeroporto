CREATE TABLE aeronaves(
	id serial PRIMARY key,
	modelo VARCHAR(100) not null,
	codigo_cauda VARCHAR(10) UNIQUE not null,
	capacidade int CHECK (capacidade > 0) not null
)

create TABLE pilotos(
	id serial PRIMARY key,
	nome VARCHAR(100) not null,
	codigo_anac varchar(6) UNIQUE not null,
	horas_voo int DEFAULT 0 CHECK (horas_voo >= 0)
)

CREATE TABLE voos(
	id serial PRIMARY key,
	aeronave_id INT REFERENCES aeronaves(id),
	piloto_id int REFERENCES pilotos(id),
	numero_voo varchar(100) not null,
	origem varchar(100) not null,
	destino varchar(100) not null,
	data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(50) default 'Agendado' CHECK (status in('Agendado', 'Em Voo', 'Concluido', 'Cancelado'))
)

CREATE table passageiros(
	id serial PRIMARY key,
	nome VARCHAR(100) not null,
	cpf VARCHAR(11) UNIQUE not null,
	email VARCHAR(100) UNIQUE not null
)

CREATE TABLE passagens(
	id serial PRIMARY key,
	voo_id int REFERENCES voos(id),
	passageiro_id int REFERENCES passageiros(id),
	assento varchar(4) not null,
	classe VARCHAR(50) default 'Economica' CHECK (classe in( 'Economica', 'Executiva')),
	valor decimal (10, 2) check (valor > 0) not null
)

insert into aeronaves (modelo, codigo_cauda, capacidade) VALUES
('Boing-200', 'ABC-111', 300),
('Boing-300', 'ABC-222', 150),
('Boing-400', 'ABC-333', 40),
('Boing-500', 'ABC-444', 500),
('Boing-600', 'ABC-555', 70)

INSERT INTO pilotos (nome, codigo_anac , horas_voo) VALUES
('Eduardo', '111111', '40' ),
('Arthur', '222222', '10' ),
('Bruno', '333333', '100' ),
('Ravi', '444444', '9' ),
('Joaquin', '555555', '10' )


INSERT INTO passageiros (nome, email, cpf) VALUES
('Ana', 'ana@gmail.com','11111111111'),
('Marcelo', 'marcelo@gmail.com','22222222222'),
('Sofia', 'sofia@gmail.com','33333333333'),
('João', 'joao@gmail.com','44444444444'),
('Willer', 'willer@gmail.com','55555555555')


INSERT INTO voos (piloto_id, aeronave_id, numero_voo, origem, destino, status) VALUES
(1, 1, '111', 'salvador', 'São paulo', 'Agendado'),
(2, 2,'222', 'salvador', 'Florianópolis', 'Em Voo'),
(3, 3,'333', 'Florianópolis', 'São paulo', 'Concluido'),
(4, 4,'444', 'São paulo', 'Amazonas', 'Agendado'),
(5, 5,'555', 'Amazonas', 'São paulo', 'Cancelado')

INSERT INTO passagens (voo_id, passageiro_id, assento, classe, valor) VALUES
(1, 2, 'A1', 'Economica', 100.00),
(2, 3, 'C2', 'Executiva', 200.00),
(3, 4, 'A3', 'Economica', 100.00),
(4, 5, 'C4', 'Executiva', 200.00),
(5, 1, 'A2', 'Economica', 100.00)

