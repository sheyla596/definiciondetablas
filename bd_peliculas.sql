-- 1. Crear una base de datos llamada "peliculas":
CREATE DATABASE bd_peliculas;

-- 2. Cargar ambos archivos a su tabla correspondiente y aplicar el truncado de estas:
--Se cargan archivos scv y se vizualizan los datos
CREATE TABLE peliculas ( id INT PRIMARY KEY, titulo VARCHAR, año_estreno INT, director VARCHAR );
CREATE TABLE reparto ( pelicula_id INT, actor VARCHAR, FOREIGN KEY (pelicula_id) REFERENCES peliculas(id) );
truncate peliculas;
truncate reparto;

copy peliculas from 'C:/sql/peliculas.csv' delimiter ',' csv header; 
copy reparto from 'C:/sql/reparto.csv' delimiter ',' csv header;

select * from peliculas;
select *from reparto;

-- 3. Obtener el ID de la película "Titanic":
SELECT id FROM peliculas WHERE titulo = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic":
SELECT Actor FROM reparto WHERE pelicula_id = ( SELECT id FROM peliculas WHERE titulo = 'Titanic');

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford:
SELECT COUNT(*) AS total_peliculas FROM reparto JOIN peliculas ON reparto.pelicula_id = peliculas.id WHERE reparto.actor = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente:
SELECT titulo FROM peliculas WHERE "año_estreno" BETWEEN 1990 AND 1999 ORDER BY titulo ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como "longitud_titulo":
SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas:
SELECT MAX(LENGTH(titulo)) AS longitud_mas_grande FROM peliculas;

