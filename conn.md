
---

# 1. Entrar al contenedor Chapinero

```bash id="1j5zc9"
sudo docker exec -it postgres_chapinero bash
```

Ahora estarás dentro del contenedor.

---

# 2. Entrar a PostgreSQL

Dentro del contenedor ejecuta:

```bash id="w1cv7h"
psql -U admin -d universidad
```

---

# 3. Crear el FDW

Ahora puedes pegar directamente los comandos SQL.

Ejemplo mínimo:

```sql id="8is4cu"
CREATE EXTENSION IF NOT EXISTS postgres_fdw;
```

---

# 4. Conectar con Macarena

```sql id="2ptmxj"
CREATE SERVER macarena_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'postgres_macarena',
    dbname 'universidad',
    port '5432'
);
```

---

# 5. Crear usuario remoto

```sql id="4k4d6i"
CREATE USER MAPPING FOR admin
SERVER macarena_server
OPTIONS (
    user 'admin',
    password 'admin'
);
```

---

# 6. Importar tablas remotas

Ejemplo:

```sql id="hdtpt9"
IMPORT FOREIGN SCHEMA public
FROM SERVER macarena_server
INTO public;
```

---

# 7. Repetir para Ciudad Bolívar

```sql id="g7kk6s"
CREATE SERVER ciudad_bolivar_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'postgres_ciudad_bolivar',
    dbname 'universidad',
    port '5432'
);
```

```sql id="zzmp0k"
CREATE USER MAPPING FOR admin
SERVER ciudad_bolivar_server
OPTIONS (
    user 'admin',
    password 'admin'
);
```

```sql id="1yqls6"
IMPORT FOREIGN SCHEMA public
FROM SERVER ciudad_bolivar_server
INTO public;
```

---

# 8. Verificar

Dentro de PostgreSQL:

```sql id="b4uz0t"
\det
```

Muestra foreign tables.

---

# 9. Probar consulta distribuida

```sql id="w4d4rq"
SELECT * FROM pregrado;
```

o:

```sql id="owq1br"
SELECT * FROM profesor;
```

---

# Alternativa más limpia (recomendada)

Crear el archivo:

```text id="p3omca"
sql/fdw.sql
```

y ejecutarlo así:

```bash id="9zhldg"
sudo docker exec -i postgres_chapinero \
psql -U admin -d universidad < sql/fdw.sql
```

Eso es mejor para:

* el informe,
* reproducibilidad,
* entregar el proyecto.
