CREATE DATABASE IF NOT EXISTS foraneos;
USE foraneos;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    correo VARCHAR(150) UNIQUE,
    contrasena VARCHAR(150),
    foto_perfil VARCHAR(255),
    fecha_registro DATETIME,
    ultimo_login DATETIME
);

CREATE TABLE tip (
    id_tip INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    titulo VARCHAR(200),
    contenido TEXT,
    categoria VARCHAR(100),
    fecha_publicacion DATETIME,
    estado VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE lugar (
    id_lugar INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200),
    direccion VARCHAR(255),
    categoria VARCHAR(100),
    descripcion TEXT,
    coordenadas VARCHAR(100)
);

CREATE TABLE descuento (
    id_descuento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    descripcion TEXT,
    vigencia DATE,
    categoria VARCHAR(100)
);

CREATE TABLE comentario_lugar (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_lugar INT,
    contenido TEXT,
    fecha_comentario DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_lugar) REFERENCES lugar(id_lugar)
);

-- Favoritos (una sola para evitar repeticiones)
CREATE TABLE favorito (
    id_favorito INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tipo ENUM('tip','lugar'),
    id_objeto INT,
    fecha_guardado DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);


CREATE TABLE guardado (
    id_guardado INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tipo ENUM('tip','lugar'),
    id_objeto INT,
    fecha_guardado DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
