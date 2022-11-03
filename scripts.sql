CREATE SCHEMA `leiturasdamia`;

CREATE TABLE autor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    senha VARCHAR(50),
    tipoDeUsuario VARCHAR(50)
)

CREATE TABLE moderador (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    senha VARCHAR(50),
    tipoDeUsuario VARCHAR(50)
)

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    senha VARCHAR(50),
    tipoDeUsuario VARCHAR(50)
)

CREATE TABLE postagem (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    texto VARCHAR(5000),
    nome_autor VARCHAR(50),
    id_autor INT,
		CONSTRAINT fk_id_autor
		FOREIGN KEY (id_autor) REFERENCES autor(id)
)

CREATE TABLE comentario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(1000),
    id_postagem INT,
		CONSTRAINT fk_comentario_id_postagem
		FOREIGN KEY (id) REFERENCES postagem(id),
    nome_autor VARCHAR(50),
    id_autor INT,
		CONSTRAINT fk_comentario_id_autor
		FOREIGN KEY (id) REFERENCES usuario(id),
	moderado BOOLEAN
)

INSERT INTO autor (username, senha, tipoDeUsuario) VALUES ("Mia", "121212", "autor");

INSERT INTO moderador (username, senha, tipoDeUsuario) VALUES ("Moderador", "moderador", "moderador");

INSERT INTO usuario (username, senha, tipoDeUsuario) VALUES ("Ana", "ana123", "usuario");
INSERT INTO usuario (username, senha, tipoDeUsuario) VALUES ("Bruna", "bruna123", "usuario");
INSERT INTO usuario (username, senha, tipoDeUsuario) VALUES ("Carol", "carol123", "usuario");

INSERT INTO postagem (titulo, texto, nome_autor, id_autor) VALUES ("A Montanha Mágica",
"A Montanha Mágica (no original em alemão Der Zauberberg) é um livro escrito por Thomas Mann em 1924.",
"Mia", 1);

INSERT INTO postagem (titulo, texto, nome_autor, id_autor) VALUES ("Demian",
"Demian é um livro escrito por Hermann Hesse, ganhador do Nobel de Literatura de 1946. Considerada por muitos críticos a principal obra de Hesse, Demian mostra a influência que este sofreu dos escritos de Nietzsche e a aplicação de seus conhecimentos de psicanálise na elaboração do drama ético e da enorme confusão mental de um jovem que toma consciência da fragilidade da moral, da família e do Estado.",
"Mia", 1);

INSERT INTO postagem (titulo, texto, nome_autor, id_autor) VALUES ("O Lobo da Estepe",
"O Lobo da Estepe é um livro de Hermann Hesse, publicado em 1927. É considerado um dos melhores dos livros de Hesse e um dos romances mais representativos da literatura alemã.",
"Mia", 1);

INSERT INTO postagem (titulo, texto, nome_autor, id_autor) VALUES ("Os Sofrimentos do Jovem Werther",
"Os sofrimentos do jovem Werther ou no original em língua alemã Die Leiden des jungen Werthers (1774) é um romance de Johann Wolfgang von Goethe.",
"Mia", 1);

INSERT INTO postagem (titulo, texto, nome_autor, id_autor) VALUES ("Fausto (Goethe)",
"Fausto (em alemão: Faust) é um poema trágico do escritor alemão Johann Wolfgang von Goethe, dividido em duas partes. Está redigido como uma peça de teatro com diálogos rimados, pensado mais para ser lido que para ser encenado. É considerado uma das grandes obras-primas da literatura alemã.",
"Mia", 1);

INSERT INTO comentario (texto, id_postagem, nome_autor, id_autor, moderado) VALUES 
("Adorei ler A Montanha Mágica", 1, "Ana", 1, false);

INSERT INTO comentario (texto, id_postagem, nome_autor, id_autor, moderado) VALUES 
("Demian é muito sombrio", 2, "Bruna", 2, false);

/*
SELECT * FROM autor;
SELECT * FROM moderador;
SELECT * FROM usuario;
SELECT * FROM postagem;
SELECT * FROM comentario;
*/