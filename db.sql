-- Eliminar la base de datos existente si existe
DROP DATABASE IF EXISTS vuelo_db;

-- Crear una nueva base de datos
CREATE DATABASE vuelo_db;

-- Conectarse a la nueva base de datos
\c vuelo_db;

CREATE TABLE vehiculo_aereo (
    matricula VARCHAR(10) PRIMARY KEY,
    modelo VARCHAR(50),
    serie VARCHAR(50),
    capacidad INT,
    color VARCHAR(20),
    estado VARCHAR(20),
    antiguedad INT,
    tiempo_aire INT,
    llantas INT,
    tanque INT,
    distancia INT
);

CREATE TABLE avion (
    matricula VARCHAR(10) PRIMARY KEY,
    aerolinea VARCHAR(50),
    tipo_motor VARCHAR(50),
    puertas INT,
    tipo_avion VARCHAR(20),
    FOREIGN KEY (matricula) REFERENCES vehiculo_aereo(matricula)
);

CREATE TABLE avioneta (
    matricula VARCHAR(10) PRIMARY KEY,
    numero_motores INT,
    tipo_pista VARCHAR(50),
    clasificacion VARCHAR(50),
    tipo_concesionaria VARCHAR(50),
    FOREIGN KEY (matricula) REFERENCES vehiculo_aereo(matricula)
);

CREATE TABLE helicoptero (
    matricula VARCHAR(10) PRIMARY KEY,
    numero_helices INT,
    tipo_helicoptero VARCHAR(50),
    FOREIGN KEY (matricula) REFERENCES vehiculo_aereo(matricula)
);

CREATE TABLE pasajero (
    id_pasajero VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    direccion VARCHAR(100),
    fecha_nacimiento DATE,
    discapacidad VARCHAR(50),
    nacionalidad VARCHAR(50)
);

CREATE TABLE tripulacion (
    id_tripulacion VARCHAR(10) PRIMARY KEY,
    antiguedad INT,
    turno VARCHAR(20),
    hrs_vuelo INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nac DATE,
    genero CHAR(1)
);

CREATE TABLE piloto (
    id_tripulacion VARCHAR(10) PRIMARY KEY,
    rango_piloto VARCHAR(50),
    licencia VARCHAR(50),
    tipo_aeronave VARCHAR(50),
    salud_mental VARCHAR(20),
    FOREIGN KEY (id_tripulacion) REFERENCES tripulacion(id_tripulacion)
);

CREATE TABLE copiloto (
    id_tripulacion VARCHAR(10) PRIMARY KEY,
    rango_copiloto VARCHAR(50),
    tiempo_restante_piloto INT,
    FOREIGN KEY (id_tripulacion) REFERENCES tripulacion(id_tripulacion)
);

CREATE TABLE sobrecargo (
    id_tripulacion VARCHAR(10) PRIMARY KEY,
    idiomas VARCHAR(100),
    certificados VARCHAR(100),
    FOREIGN KEY (id_tripulacion) REFERENCES tripulacion(id_tripulacion)
);

CREATE TABLE aeropuerto (
    clave_aeropuerto VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    num_pistas INT,
    tipo_avion VARCHAR(50)
);

CREATE TABLE terminal (
    clave_terminal VARCHAR(10) PRIMARY KEY,
    capacidad INT,
    disponible BOOLEAN
);

CREATE TABLE equipaje (
    id_equipaje SERIAL PRIMARY KEY,
    peso DECIMAL(5,2),
    altura DECIMAL(5,2),
    ancho DECIMAL(5,2),
    id_pasajero VARCHAR(10),
    tipo_equipaje VARCHAR(50),
    FOREIGN KEY (id_pasajero) REFERENCES pasajero(id_pasajero)
);

CREATE TABLE vuelo (
    id_vuelo VARCHAR(10) PRIMARY KEY,
    clave_terminal VARCHAR(10),
    matricula_aereo VARCHAR(10),
    origen VARCHAR(100),
    destino VARCHAR(100),
    duracion INT,
    hora_salida TIME,
    hora_llegada TIME,
    FOREIGN KEY (clave_terminal) REFERENCES terminal(clave_terminal),
    FOREIGN KEY (matricula_aereo) REFERENCES vehiculo_aereo(matricula)
);

CREATE TABLE boleto (
    id_boleto SERIAL PRIMARY KEY,
    id_pasajero VARCHAR(10),
    vuelo_id VARCHAR(10),
    asiento VARCHAR(10),
    costo DECIMAL(10,2),
    FOREIGN KEY (id_pasajero) REFERENCES pasajero(id_pasajero),
    FOREIGN KEY (vuelo_id) REFERENCES vuelo(id_vuelo)
);

CREATE TABLE vuelo_tripulacion (
    id_vuelo VARCHAR(10),
    id_tripulacion VARCHAR(10),
    PRIMARY KEY (id_vuelo, id_tripulacion),
    FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo),
    FOREIGN KEY (id_tripulacion) REFERENCES tripulacion(id_tripulacion)
);

INSERT INTO vehiculo_aereo (matricula, modelo, serie, capacidad, color, estado, antiguedad, tiempo_aire, llantas, tanque, distancia)
VALUES 
('123ABC', 'Boeing 747', 'S12345', 416, 'Blanco', 'Operativo', 10, 5000, 18, 200, 8000),
('124ABC', 'Boeing 747', 'S12345', 10, 'Blanco', 'Operativo', 2, 10, 3, 200, 10000),
('H1', 'ModeloX', 'S67890', 15, 'Blanco', 'Operativo', 5, 3000, 4, 150, 5000);

INSERT INTO avion (matricula, aerolinea, tipo_motor, puertas, tipo_avion)
VALUES 
('123ABC', 'Aeromexico', 'Turbofan', 4, 'Comercial');

INSERT INTO avioneta (matricula, numero_motores, tipo_pista, clasificacion, tipo_concesionaria)
VALUES 
('123ABC', 4, 'Turbofan', 'Comercial', 'Aeromexico');

INSERT INTO helicoptero (matricula, numero_helices, tipo_helicoptero)
VALUES 
('H1', 4, 'Rescate');

INSERT INTO tripulacion (id_tripulacion, antiguedad, turno, hrs_vuelo, nombre, apellido, fecha_nac, genero)
VALUES
('1', 10, 'Diurno', 550, 'Ayrton', 'Senna', '1980-01-01', 'M'),
('2', 8, 'Diurno', 300, 'Juan', 'Fangio', '1985-02-01', 'M'),
('3', 5, 'Diurno', 240, 'Jim', 'Clark', '1990-03-01', 'F'),
('4', 4, 'Diurno', 150, 'Alain', 'Prost', '1992-04-01', 'F');

INSERT INTO piloto (id_tripulacion, rango_piloto, licencia, tipo_aeronave, salud_mental)
VALUES 
('1', 'Capitán', 'L1234', 'Boeing 747', 'Apto');

INSERT INTO copiloto (id_tripulacion, rango_copiloto, tiempo_restante_piloto)
VALUES 
('2', 'Primero', 2);

INSERT INTO sobrecargo (id_tripulacion, idiomas, certificados)
VALUES 
('3', 'Inglés, Español', 'Certificado A'),
('4', 'Francés, Español', 'Certificado B');

INSERT INTO pasajero (id_pasajero, nombre, apellido, direccion, fecha_nacimiento, discapacidad, nacionalidad)
VALUES
('P1', 'Pablo', 'Sosa', 'Av. Siempre Viva 123', '1995-05-01', 'Ninguna', 'Mexicana'),
('P2', 'Amanda', 'Perez', 'Calle Falsa 456', '1988-06-02', 'Invalido', 'Mexicana'),
('P3', 'Vicente', 'Ramirez', 'Av. Principal 789', '1990-07-03', 'Ninguna', 'Mexicana'),
('P4', 'Maria', 'DB', 'Calle 10 1010', '1985-08-04', 'Ninguna', 'Mexicana'),
('P5', 'Michael', 'Schumacher', 'Calle 20 2020', '1992-09-05', 'Ninguna', 'Mexicana'),
('P6', 'Jackie', 'Martinez', 'Calle 30 3030', '1998-10-06', 'Ninguna', 'Mexicana'),
('P7', 'Sofia', 'Gonzalez', 'Calle 40 4040', '1993-11-07', 'Ninguna', 'Mexicana'),
('P8', 'Javier', 'Stewart', 'Calle 50 5050', '1997-12-08', 'Ninguna', 'Mexicana'),
('P9', 'Fernando', 'Torres', 'Calle 60 6060', '1994-01-09', 'Ninguna', 'Mexicana'),
('P10', 'Ramiro', 'Ruiz', 'Calle 70 7070', '1996-02-10', 'Ninguna', 'Mexicana');

INSERT INTO terminal (clave_terminal, capacidad, disponible)
VALUES
('T1', 1000, TRUE),
('D2', 10, TRUE),
('A3', 15, TRUE);

INSERT INTO vuelo (id_vuelo, clave_terminal, matricula_aereo, origen, destino, duracion, hora_salida, hora_llegada)
VALUES
('V1', 'T1', '123ABC', 'Nuevo Leon', 'Miami', 5, '10:00', '15:00'),
('V2', 'D2', '123ABC', 'CDMX', 'Nueva York', 5, '06:00', '10:00'),
('V3', 'A3', 'H1', 'Puebla', 'Cancun', 5, '09:00', '13:00');

INSERT INTO vuelo_tripulacion (id_vuelo, id_tripulacion)
VALUES
('V1', '1'),
('V1', '2'),
('V1', '3'),
('V1', '4'),
('V2', '1'),
('V2', '2'),
('V2', '3'),
('V2', '4'),
('V3', '1'),
('V3', '2'),
('V3', '3'),
('V3', '4');

INSERT INTO aeropuerto (clave_aeropuerto, nombre, num_pistas, tipo_avion)
VALUES 
('MEX', 'Aeropuerto Internacional CDMX', 4, 'Comercial');


INSERT INTO equipaje (peso, altura, ancho, id_pasajero, tipo_equipaje)
VALUES
(23.5, 55.0, 35.0, 'P1', 'Maleta de mano'),
(20.0, 50.0, 30.0, 'P2', 'Maleta de mano'),
(18.0, 45.0, 25.0, 'P3', 'Equipaje de cabina');

INSERT INTO boleto (id_boleto, id_pasajero, vuelo_id, asiento, costo)
VALUES
(1, 'P1', 'V1', '1A', 500.00);

INSERT INTO copiloto (id_tripulacion, rango_copiloto, tiempo_restante_piloto)
VALUES 
('3', 'Primero', 2);