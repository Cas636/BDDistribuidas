# Proyecto Base de Datos Distribuida - Universidad Distrital

Este proyecto implementa una base de datos distribuida para la Universidad Distrital Francisco José de Caldas utilizando PostgreSQL y Docker Compose.

## Arquitectura

- **Nodo Central (Chapinero)**: Gestiona su fragmento académico local para Chapinero (Ingeniería de Sistemas, Administración, sus asignaturas, cursos y grupos) y además maneja la parte administrativa centralizada (PROFESOR, DICTAR, CLASIFICACION).
- **Nodo La Macarena**: Maneja programas de pregrado, cursos, grupos y asignaturas para la sede La Macarena.
- **Nodo Ciudad Bolívar**: Maneja programas de pregrado, cursos, grupos y asignaturas para la sede Ciudad Bolívar.

## Tecnologías

- PostgreSQL 13
- Docker Compose
- postgres_fdw para consultas distribuidas

## Instalación y Ejecución

1. Asegúrate de tener Docker y Docker Compose instalados.

2. Clona o navega al directorio del proyecto.

3. Ejecuta `sudo docker-compose up -d` para iniciar los contenedores.

4. Los contenedores se inicializarán con los esquemas y datos desde los archivos .sql.

5. Para configurar los foreign data wrappers, conecta al contenedor de Chapinero y ejecuta el contenido de `sql/fdw.sql`.

## Puertos

- Chapinero: 5432
- La Macarena: 5433
- Ciudad Bolívar: 5434

Usuario: postgres
Contraseña: password
Base de datos: universidad

## Consultas Distribuidas

Una vez configurados los FDW, puedes realizar consultas distribuidas desde Chapinero, como:

```sql
SELECT * FROM pregrado
UNION
SELECT * FROM pregrado_macarena
UNION
SELECT * FROM pregrado_ciudad_bolivar;
```

## Estructura del Proyecto

- `docker-compose.yml`: Configuración de los contenedores Docker.
- `sql/`: Archivos SQL para esquemas y datos.
  - `chapinero.sql`: Esquema y datos para Chapinero.
  - `macarena.sql`: Esquema y datos para La Macarena.
  - `ciudad_bolivar.sql`: Esquema y datos para Ciudad Bolívar.
  - `fdw.sql`: Configuración de foreign data wrappers.