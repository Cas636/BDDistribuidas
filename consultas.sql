/*Ful scan a los datos de la tabla macarena*/
SELECT * FROM pregrado_macarena;

/*  Full Scan a las Tablas distribuidas*/
SELECT * FROM pregrado
UNION
SELECT * FROM pregrado_macarena
UNION
SELECT * FROM pregrado_ciudad_bolivar;


/* Contar programas por sede */
SELECT sede, COUNT(*)
FROM (
    SELECT sede FROM pregrado
    UNION ALL
    SELECT sede FROM pregrado_macarena
    UNION ALL
    SELECT sede FROM pregrado_ciudad_bolivar
) t
GROUP BY sede;

/* Mostrar programas por sede */

SELECT Nombre, Sede
FROM pregrado
UNION
SELECT Nombre, Sede
FROM pregrado_macarena
UNION
SELECT Nombre, Sede
FROM pregrado_ciudad_bolivar;


SELECT * FROM pregrado;


SELECT srvname FROM pg_foreign_server;

SELECT * FROM asignatura_macarena;

SELECT * FROM asignatura;





