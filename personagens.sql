CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes (
    id_classe BIGINT AUTO_INCREMENT,
    nome_classe VARCHAR(50) NOT NULL,
    armamento VARCHAR(255),
    PRIMARY KEY (id_classe)
);

CREATE TABLE tb_personagens (
    id_personagem BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    poder INT NOT NULL,
    id_classe BIGINT,
    PRIMARY KEY (id_personagem),
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

INSERT INTO tb_classes (nome_classe, armamento) VALUES
("Guerreiro", "Machado"),
("Mago", "Cajado"),
("Arqueiro", "Arco e Flecha"),
("Assassino", "Adaga"),
("Paladino", "Espada");

INSERT INTO tb_personagens (nome, nivel, poder, id_classe) VALUES
("Arthur", 20, 1500, 1),
("Merlin", 18, 2000, 2),
("Legolas", 25, 1750, 3),
("Ezio", 22, 1600, 4),
("Lancelot", 19, 1450, 1),
("Gandalf", 30, 2500, 2),
("Robin", 20, 1800, 3),
("Altair", 21, 1550, 4);

SELECT * FROM tb_personagens;

SELECT * FROM tb_personagens WHERE poder > 2000;

SELECT * FROM tb_personagens WHERE poder > 1000 OR poder < 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

SELECT tb_personagens.nome, tb_personagens.nivel, tb_personagens.poder, 
tb_classes.nome_classe, tb_classes.armamento FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe;

SELECT tb_personagens.nome, tb_personagens.nivel, tb_personagens.poder, 
tb_classes.nome_classe, tb_classes.armamento FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe
WHERE tb_classes.nome_classe = "Arqueiro";
