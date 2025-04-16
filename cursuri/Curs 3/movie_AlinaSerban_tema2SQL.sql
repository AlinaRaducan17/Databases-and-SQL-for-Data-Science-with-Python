CREATE DATABASE IF NOT EXISTS movies;
USE movies;
CREATE TABLE languages (id_language INT PRIMARY KEY UNIQUE AUTO_INCREMENT, name_language VARCHAR(255));
CREATE TABLE director (id_director INT PRIMARY KEY UNIQUE AUTO_INCREMENT, name_director VARCHAR (255));
CREATE TABLE genre (id_genre INT PRIMARY KEY UNIQUE AUTO_INCREMENT, name_genre VARCHAR (255));
CREATE TABLE country (id_country INT PRIMARY KEY UNIQUE AUTO_INCREMENT, name_country VARCHAR(255));
CREATE TABLE movie (id_movie INT PRIMARY KEY UNIQUE AUTO_INCREMENT, title VARCHAR(255) NOT NULL, release_year INT, duration INT,
	buget DECIMAL (15,2), box_office DECIMAL(15,2), id_director INT, id_language INT, id_country INT,
    FOREIGN KEY (id_language) REFERENCES languages (id_language),
    FOREIGN KEY (id_director) REFERENCES director (id_director),
    FOREIGN KEY (id_country) REFERENCES country (id_country));
CREATE TABLE movie_genre (id_movie INT, id_genre INT, FOREIGN KEY (id_movie) REFERENCES movie (id_movie),
			FOREIGN KEY (id_genre) REFERENCES genre (id_genre));
DESCRIBE movie