DROP DATABASE IF EXISTS imdb;
CREATE DATABASE IF NOT EXISTS imdb;

USE imdb;

CREATE TABLE IF NOT EXISTS actor (
    actor_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    CONSTRAINT PK_actor_id PRIMARY KEY (actor_id)
);

CREATE TABLE IF NOT EXISTS film (
    film_id INT AUTO_INCREMENT,
    title VARCHAR(255),
    description TEXT,
    release_year INT,
    CONSTRAINT PK_film_id PRIMARY KEY (film_id)
);

CREATE TABLE IF NOT EXISTS film_actor (
	film_actor_id INT,
    actor_id INT,
    film_id INT,
    CONSTRAINT PK_film_actor_id PRIMARY KEY (film_actor_id)
);

-- Agregar columna last_update a la tabla actor
ALTER TABLE actor
ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Agregar columna last_update a la tabla film
ALTER TABLE film
ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Agregar foreign keys film_actor
ALTER TABLE film_actor
ADD CONSTRAINT FK_actor_id FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
ADD CONSTRAINT FK_film_id FOREIGN KEY (film_id) REFERENCES film(film_id);

-- Insert 1: Datos de un actor
INSERT INTO actor (actor_id, first_name, last_name) VALUES ('1', 'Tom', 'Hanks');

-- Insert 2: Datos de una película
INSERT INTO film (film_id, title, description, release_year) VALUES ('1', 'Forrest Gump', 'Un hombre con discapacidad intelectual vive una vida extraordinaria', 1994);

-- Insert 3: Relación entre actor y película
INSERT INTO film_actor (actor_id, film_id) VALUES (1, 1);