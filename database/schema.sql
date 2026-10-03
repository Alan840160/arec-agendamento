-- Sistema de Gestão de Reservas AREC-Copasul
-- Módulo 3 - Banco de Dados e Controle de Versão

CREATE DATABASE IF NOT EXISTS arec_reservas
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE arec_reservas;

CREATE TABLE tipo_usuario (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE status_recurso (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE status_reserva (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario_id INT NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_tipo
        FOREIGN KEY (tipo_usuario_id)
        REFERENCES tipo_usuario(id_tipo)
);

CREATE TABLE recurso (
    id_recurso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    capacidade INT NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    status_id INT NOT NULL,
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_recurso_capacidade CHECK (capacidade > 0),
    CONSTRAINT fk_recurso_status
        FOREIGN KEY (status_id)
        REFERENCES status_recurso(id_status)
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_recurso INT NOT NULL,
    data_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    numero_pessoas INT NOT NULL,
    status_id INT NOT NULL,
    observacao TEXT,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_reserva_pessoas CHECK (numero_pessoas > 0),
    CONSTRAINT chk_reserva_horario CHECK (hora_fim > hora_inicio),
    CONSTRAINT fk_reserva_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),
    CONSTRAINT fk_reserva_recurso
        FOREIGN KEY (id_recurso)
        REFERENCES recurso(id_recurso),
    CONSTRAINT fk_reserva_status
        FOREIGN KEY (status_id)
        REFERENCES status_reserva(id_status)
);

CREATE INDEX idx_reserva_recurso_data
    ON reserva (id_recurso, data_reserva, hora_inicio, hora_fim);
