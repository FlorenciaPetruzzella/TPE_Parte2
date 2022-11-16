# API REST para un taller mecánico

## Importar la base de datos
- Importar desde PHPMyAdmin (o cualquiera) database/db_taller_mecanico.sql

## Pueba con postman
- El endpoint de la API es: http://localhost/Web2/Parte_II/taller-mecanico-rest/api/cars

## Pueba con postman
- Ejemplos de uso:
    - [GET] .../api/cars (accede a un listado de todos los autos) 
    - [GET] .../api/cars/40 (accede al auto con id 40) 
    - [POST] .../api/cars (lee el contenido del body y agrega un nuevo auto) 
    - [PUT] .../api/cars/17 (lee el contenido del body y edita los datos del auto seleccionado) 
    - [DELETE] .../api/cars/27 (borra al auto con el id 27)

- Para hacer un POST o un PUT se deben ingresar los datos con el siguiente formato: { "patente": "AAA000", "duenio": "Florencia Petruzzella", "modelo": "Fiat Uno" }

## Otras herramientas:

- Ascendente: .../api/cars?sort=modelo&order=asc (Ordena los modelos de forma ascendente)
- Descendente: .../api/cars?sort=id_auto&order=desc (Ordena los id descendente)
- Filtro: .../api/cars?filterOwner=flor (Muestra solo las columnas que contengan el nombre flor)
- Paginación: .../api/cars?page=2&limit=3 (Muestra 3 elementos (limit) de la pagina 2 (page))
