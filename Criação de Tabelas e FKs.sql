CREATE DATABASE biblioteca_universitaria;
USE biblioteca_universitaria;

CREATE TABLE tipo_obra (
    id_tipo_obra INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_area_conhecimento INT NOT NULL,
    tipo_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE obra (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_obra INT NOT NULL,
    id_categoria INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    data_publicacao DATE,
    isbn VARCHAR(20)
);

CREATE TABLE obra_autor (
    id_obra INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_obra, id_autor)
);

CREATE TABLE exemplar (
    rfid VARCHAR(100) PRIMARY KEY,
    id_obra INT NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE tipo_usuario (
    id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY,
    tipo_usuario VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_usuario INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE,
    matricula VARCHAR(30) UNIQUE,
    curso VARCHAR(100),
    rfid VARCHAR(100) UNIQUE
);

CREATE TABLE telefone_usuario (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    telefone VARCHAR(20),
    tipo VARCHAR(30)
);

CREATE TABLE endereco_usuario (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    rua VARCHAR(150),
    bairro VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    cep VARCHAR(10),
    tipo VARCHAR(30)
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    rfid_exemplar VARCHAR(100) NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(30)
);

CREATE TABLE multa (
    id_multa INT AUTO_INCREMENT PRIMARY KEY,
    id_emprestimo INT NOT NULL,
    valor DECIMAL(10,2),
    desconto DECIMAL(10,2),
    data_pagamento DATE,
    status VARCHAR(30)
);

CREATE TABLE notificacao (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_emprestimo INT NOT NULL,
    id_multa INT,
    mensagem VARCHAR(255),
    status VARCHAR(30),
    data_envio DATETIME
);

CREATE TABLE area_conhecimento (
    id_area_conhecimento INT AUTO_INCREMENT PRIMARY KEY,
    nome_area VARCHAR(100) NOT NULL
);

ALTER TABLE obra
ADD CONSTRAINT fk_obra_tipo
FOREIGN KEY (id_tipo_obra)
REFERENCES tipo_obra(id_tipo_obra);

ALTER TABLE obra
ADD CONSTRAINT fk_obra_categoria
FOREIGN KEY (id_categoria)
REFERENCES categoria(id_categoria);

ALTER TABLE obra_autor
ADD CONSTRAINT fk_obra_autor_obra
FOREIGN KEY (id_obra)
REFERENCES obra(id_obra);

ALTER TABLE obra_autor
ADD CONSTRAINT fk_obra_autor_autor
FOREIGN KEY (id_autor)
REFERENCES autor(id_autor);

ALTER TABLE exemplar
ADD CONSTRAINT fk_exemplar_obra
FOREIGN KEY (id_obra)
REFERENCES obra(id_obra);

ALTER TABLE categoria
ADD CONSTRAINT fk_categoria_area
FOREIGN KEY (id_area_conhecimento)
REFERENCES area_conhecimento(id_area_conhecimento);

ALTER TABLE usuario
ADD CONSTRAINT fk_usuario_tipo
FOREIGN KEY (id_tipo_usuario)
REFERENCES tipo_usuario(id_tipo_usuario);

ALTER TABLE telefone_usuario
ADD CONSTRAINT fk_telefone_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario);

ALTER TABLE endereco_usuario
ADD CONSTRAINT fk_endereco_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario);

ALTER TABLE emprestimo
ADD CONSTRAINT fk_emprestimo_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario);

ALTER TABLE emprestimo
ADD CONSTRAINT fk_emprestimo_exemplar
FOREIGN KEY (rfid_exemplar)
REFERENCES exemplar(rfid);

ALTER TABLE multa
ADD CONSTRAINT fk_multa_emprestimo
FOREIGN KEY (id_emprestimo)
REFERENCES emprestimo(id_emprestimo);

ALTER TABLE notificacao
ADD CONSTRAINT fk_notificacao_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario);

ALTER TABLE notificacao
ADD CONSTRAINT fk_notificacao_emprestimo
FOREIGN KEY (id_emprestimo)
REFERENCES emprestimo(id_emprestimo);

ALTER TABLE notificacao
ADD CONSTRAINT fk_notificacao_multa
FOREIGN KEY (id_multa)
REFERENCES multa(id_multa);