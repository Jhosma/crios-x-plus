CREATE DATABASE crios_x_plus;

USE crios_x_plus;

CREATE TABLE nodo_iot (
    id_nodo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150),
    estado VARCHAR(20) NOT NULL
);

CREATE TABLE telemetria (
    id_telemetria INT AUTO_INCREMENT PRIMARY KEY,
    id_nodo INT NOT NULL,
    temperatura DECIMAL(5,2),
    humedad DECIMAL(5,2),
    presion DECIMAL(7,2),
    intensidad_lluvia DECIMAL(6,2),
    fecha_hora DATETIME NOT NULL,

    FOREIGN KEY (id_nodo)
        REFERENCES nodo_iot(id_nodo)
);

CREATE TABLE alerta (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    id_nodo INT NOT NULL,
    tipo_evento VARCHAR(50) NOT NULL,
    porcentaje_confianza DECIMAL(5,2),
    nivel_riesgo VARCHAR(20),
    fecha_hora DATETIME NOT NULL,

    FOREIGN KEY (id_nodo)
        REFERENCES nodo_iot(id_nodo)
);

CREATE TABLE actuacion (
    id_actuacion INT AUTO_INCREMENT PRIMARY KEY,
    id_alerta INT NOT NULL,
    tipo_accion VARCHAR(100) NOT NULL,
    estado_malla VARCHAR(30),
    fecha_hora DATETIME NOT NULL,

    FOREIGN KEY (id_alerta)
        REFERENCES alerta(id_alerta)
);