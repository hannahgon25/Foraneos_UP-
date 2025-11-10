# UP Foráneos

## backend-dev

Hola esta es mi rama.

### Progreso

| Cosa  | Estado | Comentario                                                   |
| :---- | :----: | ------------------------------------------------------------ |
| API   |  75%   | Ya ligado al `.yml` y al contenedor de mysql, faltan queries y seguridad. |
| MySQL |  99%   | Faltan usuarios que no sean root.                            |

## Como iniciar los contenedores con Docker

1. Clona el repositorio
   - `git clone https://github.com/hannahgon25/Foraneos_UP-.git`
2. Navega hacia la carpeta `Foraneos_UP-`
3. Levanta los contenedores de Docker
   - Ejecuta en tu consola `docker compose up --build`
   - El contenedor de mySQL se tarda un rato en importar los `.sql` de `/db-init/` si es la primera ves que se inicia.

## Como correr queries en el contenedor de mySQL

1. En Docker Desktop, expande el conjunto `foraneos_up-` y en el apartado de acciones selecciona `View detais`.
2. Muévete al apartado `Exec`.
   - Ejecuta `mysql -u root -p`.
   - Ingresa la contraseña `root`.
3. Ejecuta su queries :).
