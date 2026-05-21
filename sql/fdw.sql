-- Configuración de Foreign Data Wrappers en Nodo Chapinero
-- Ejecutar esto en el contenedor de Chapinero después de iniciar los servicios

-- Crear extensión FDW
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- Crear servidores remotos
CREATE SERVER macarena_server FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'macarena', dbname 'universidad', port '5432');

CREATE SERVER ciudad_bolivar_server FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'ciudad_bolivar', dbname 'universidad', port '5432');

-- Crear mapeo de usuarios
CREATE USER MAPPING FOR postgres SERVER macarena_server
OPTIONS (user 'postgres', password 'password');

CREATE USER MAPPING FOR postgres SERVER ciudad_bolivar_server
OPTIONS (user 'postgres', password 'password');

-- Crear foreign tables para PREGRADO en otros nodos
CREATE FOREIGN TABLE pregrado_macarena (
    Cod_Pregrado VARCHAR(10),
    Nombre VARCHAR(100),
    Créditos INT,
    Nota_Mínima DECIMAL(3,1),
    Sede VARCHAR(50)
) SERVER macarena_server OPTIONS (table_name 'pregrado');

CREATE FOREIGN TABLE pregrado_ciudad_bolivar (
    Cod_Pregrado VARCHAR(10),
    Nombre VARCHAR(100),
    Créditos INT,
    Nota_Mínima DECIMAL(3,1),
    Sede VARCHAR(50)
) SERVER ciudad_bolivar_server OPTIONS (table_name 'pregrado');

-- Crear foreign tables para ASIGNATURA en otros nodos
CREATE FOREIGN TABLE asignatura_macarena (
    Cod_Asignatura VARCHAR(10),
    Nombre_Asignatura VARCHAR(100),
    Cod_Pregrado VARCHAR(10),
    Cod_Curso VARCHAR(10),
    Horas_Semanales INT
) SERVER macarena_server OPTIONS (table_name 'asignatura');

CREATE FOREIGN TABLE asignatura_ciudad_bolivar (
    Cod_Asignatura VARCHAR(10),
    Nombre_Asignatura VARCHAR(100),
    Cod_Pregrado VARCHAR(10),
    Cod_Curso VARCHAR(10),
    Horas_Semanales INT
) SERVER ciudad_bolivar_server OPTIONS (table_name 'asignatura');

-- Ejemplo de consulta distribuida
-- SELECT * FROM pregrado UNION SELECT * FROM pregrado_macarena UNION SELECT * FROM pregrado_ciudad_bolivar;