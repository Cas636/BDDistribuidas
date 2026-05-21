-- Esquema para Nodo La Macarena
-- Incluye: PREGRADO, CURSO, GRUPO, ASIGNATURA, CLASIFICACION (replicada)

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

CREATE TABLE CLASIFICACIÓN (
    Categoría VARCHAR(50) PRIMARY KEY,
    Numero_Máximo_Horas INT,
    Sueldo DECIMAL(10,2)
);

-- Insertar datos para PREGRADO en La Macarena
INSERT INTO PREGRADO VALUES ('P003', 'Derecho', 180, 3.0, 'La Macarena');
INSERT INTO PREGRADO VALUES ('P004', 'Psicología', 150, 3.0, 'La Macarena');

-- Insertar datos para CURSO
INSERT INTO CURSO VALUES ('C001', 30);
INSERT INTO CURSO VALUES ('C002', 25);

-- Insertar datos para GRUPO
INSERT INTO GRUPO VALUES ('G001', 'C001', 'Derecho Penal', '2024-1');
INSERT INTO GRUPO VALUES ('G002', 'C002', 'Psicología Clínica', '2024-1');

-- Insertar datos para ASIGNATURA
INSERT INTO ASIGNATURA VALUES ('A003', 'Introducción al Derecho', 'P003', 'C001', 4);
INSERT INTO ASIGNATURA VALUES ('A004', 'Psicología General', 'P004', 'C002', 3);

-- Insertar datos para CLASIFICACIÓN (replicada)
INSERT INTO CLASIFICACIÓN VALUES ('Titular', 40, 5000000.00);
INSERT INTO CLASIFICACIÓN VALUES ('Asociado', 35, 4000000.00);