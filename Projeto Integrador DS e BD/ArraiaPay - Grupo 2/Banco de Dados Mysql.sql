CREATE DATABASE arraiapay;

USE arraiapay;


-- arraiapay.usuario

CREATE TABLE usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  matricula VARCHAR(50),
  cpf VARCHAR(14),
  tipo_usuario VARCHAR(30) NOT NULL,
  saldo DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);


-- arraiapay.operador

CREATE TABLE operador (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  login VARCHAR(50) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);


-- arraiapay.caixa

CREATE TABLE caixa (
  id INT NOT NULL AUTO_INCREMENT,
  numero INT NOT NULL,
  id_operador INT NOT NULL,
  status VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_operador) REFERENCES operador(id)
);


-- arraiapay.transacao

CREATE TABLE transacao (
  id INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_caixa INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  forma_pagamento VARCHAR(30),
  data_hora DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id),
  FOREIGN KEY (id_caixa) REFERENCES caixa(id)
);