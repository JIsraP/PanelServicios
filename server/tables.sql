DROP DATABASE IF EXIST panelServicios;
CREATE DATABASE panelServicios;

USE panelServicios;

SET sql_mode = '';

-- Creacion de tablas

CREATE TABLE usuario (
    id_usuario        VARCHAR(50)  NOT NULL,
    nombre            VARCHAR(50)  NOT NULL,
    apellido_pat      VARCHAR(50)  NOT NULL,
    apellido_mat      VARCHAR(50)  NOT NULL,
    calle             VARCHAR(30)  NOT NULL,
    numero            INT          NOT NULL,
    colonia           VARCHAR(30)  NOT NULL,
    municipio         VARCHAR(30)  NOT NULL,
    estado            VARCHAR(30)  NOT NULL,
    email             VARCHAR(50)  NOT NULL,
    contrasena        VARCHAR(16)  NOT NULL,
    telefono          VARCHAR(10)  NOT NULL,
    rfc               VARCHAR(13)  NOT NULL,
    tipo_persona      VARCHAR(10)  NOT NULL,
    regimen_fiscal    VARCHAR(50)  NOT NULL,
    nombre_comercial  VARCHAR(100) NOT NULL,
    csf               BLOB         NOT NULL,   

    PRIMARY KEY 
)
