-- Esquema para Nodo Central: Chapinero
-- Incluye: PREGRADO (Chapinero), ASIGNATURA, CURSO, GRUPO, PROFESOR, CLASIFICACION, DICTAR

CREATE TABLE PREGRADO (
    Cod_Pregrado VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Créditos INT,
    Nota_Mínima DECIMAL(3,1),
    Sede VARCHAR(50)
);

CREATE TABLE CURSO (
    Cod_Pregrado_Curso VARCHAR(10) PRIMARY KEY,
    Capacidad_Estudiantes INT
);

CREATE TABLE GRUPO (
    Cod_Grupo VARCHAR(10) PRIMARY KEY,
    Cod_Pregrado_Curso VARCHAR(10),
    Curso VARCHAR(100),
    Semestre VARCHAR(10),
    FOREIGN KEY (Cod_Pregrado_Curso) REFERENCES CURSO(Cod_Pregrado_Curso)
);

CREATE TABLE ASIGNATURA (
    Cod_Asignatura VARCHAR(10) PRIMARY KEY,
    Nombre_Asignatura VARCHAR(100),
    Cod_Pregrado VARCHAR(10),
    Cod_Curso VARCHAR(10),
    Horas_Semanales INT,
    FOREIGN KEY (Cod_Pregrado) REFERENCES PREGRADO(Cod_Pregrado),
    FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Pregrado_Curso)
);

CREATE TABLE PROFESOR (
    Nombre VARCHAR(100),
    Dirección VARCHAR(200),
    Categoría VARCHAR(50),
    Teléfono VARCHAR(20),
    E_Mail VARCHAR(100),
    Número_Documento VARCHAR(20) PRIMARY KEY
);

CREATE TABLE CLASIFICACIÓN (
    Categoría VARCHAR(50) PRIMARY KEY,
    Numero_Máximo_Horas INT,
    Sueldo DECIMAL(10,2)
);

CREATE TABLE DICTAR (
    Cod_Asignatura VARCHAR(10),
    Cod_Profesor VARCHAR(20),
    N_Horas INT,
    PRIMARY KEY (Cod_Asignatura, Cod_Profesor),
    FOREIGN KEY (Cod_Profesor) REFERENCES PROFESOR(Número_Documento),
    FOREIGN KEY (Cod_Asignatura) REFERENCES ASIGNATURA(Cod_Asignatura)
);

-- Insertar datos para PREGRADO en Chapinero
INSERT INTO PREGRADO VALUES ('P001', 'Ingeniería de Sistemas', 160, 3.0, 'Chapinero');
INSERT INTO PREGRADO VALUES ('P002', 'Administración de Empresas', 140, 3.0, 'Chapinero');

-- Insertar datos para CURSO en Chapinero
INSERT INTO CURSO VALUES ('C001', 35);
INSERT INTO CURSO VALUES ('C002', 30);

-- Insertar datos para GRUPO en Chapinero
INSERT INTO GRUPO VALUES ('G001', 'C001', 'Programación I', '2024-1');
INSERT INTO GRUPO VALUES ('G002', 'C002', 'Administración General', '2024-1');

-- Insertar datos para ASIGNATURA en Chapinero
INSERT INTO ASIGNATURA VALUES ('A001', 'Algoritmos y Estructuras de Datos', 'P001', 'C001', 4);
INSERT INTO ASIGNATURA VALUES ('A002', 'Administración de Empresas I', 'P002', 'C002', 3);

-- Insertar datos para PROFESOR
INSERT INTO PROFESOR VALUES ('Juan Pérez', 'Calle 123', 'Titular', '3001234567', 'juan@universidad.edu', '12345678');
INSERT INTO PROFESOR VALUES ('María López', 'Carrera 456', 'Asociado', '3009876543', 'maria@universidad.edu', '87654321');

-- Insertar datos para CLASIFICACIÓN
INSERT INTO CLASIFICACIÓN VALUES ('Titular', 40, 5000000.00);
INSERT INTO CLASIFICACIÓN VALUES ('Asociado', 35, 4000000.00);

-- Insertar datos para DICTAR (asociando con asignaturas, asumiendo códigos)
INSERT INTO DICTAR VALUES ('A001', '12345678', 20);
INSERT INTO DICTAR VALUES ('A002', '87654321', 15);