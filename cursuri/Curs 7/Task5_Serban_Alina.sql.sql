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
DESCRIBE movie;
SELECT * FROM languages;
SELECT * FROM director;
SELECT * FROM genre;
SELECT * FROM country;
SELECT * FROM movie;
SELECT * FROM movie_genre;

INSERT INTO 
languages (name_language) 
VALUES 
('English'),
('Japanese'),
('Danish'),
('Korean'),
('French'),
('Silent'),
('Portuguese'),
('Spanish'),
('German');
SELECT * FROM languages;
INSERT INTO 
languages (name_language) 
VALUES 
('Italian');
SELECT * FROM languages;
SELECT * FROM country;
INSERT INTO
country (name_country)
VALUES
('USA'),
('Japan'),
('UK'),
('France'),
('Denmark'),
('Germany'),
('South Korea'),
('Ireland'),
('Australia'),
('Canada');
SELECT * FROM country;
SELECT * FROM genre;
INSERT INTO genre (name_genre)
VALUES
('Action'),
('Adventure'),
('Fantasy'),
('Animation'),
('Comedy'),
('Drama'),
('Musical'),
('Sci-Fi'),
('Crime'),
('Thriller');
SELECT * FROM genre;
SELECT * FROM director;
INSERT INTO director (name_director)
VALUES
('James Cameron'),
('Jon Watts'),
('Greta Gerwig'),
('Joseph Kosinski'),
('Kyle Balda'),
('Haruo Sotozaki'),
('Matt Reeves'),
('Joel Crawford'),
('Ridley Scott'),
('Doug Liman');
SELECT * FROM director;
SELECT * FROM movie;
INSERT INTO movie
(title, release_year, duration, buget, box_office, id_director, id_language, id_country)
VALUES
('Avatar: The Way of Water','2022','192','460000000','2320000000','1','1','1'),
('Spider-Man: No Way Home','2021','148','200000000','1910000000','2','1','1'),
('Barbie','2023','114','145000000','1440000000','3','1','1'),
('Top Gun: Maverick','2022','130','170000000','1490000000','4','1','1'),
('Minions: The Rise of Gru','2022','87','80000000','939000000','5','1','1'),
('Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train','2020','117','15000000','507000000','6','2','2'),
('The Batman','2022','176','185000000','770000000','7','1','1'),
('Puss in Boots: The Last Wish','2022','102','90000000','484000000','8','1','1'),
('The Last Duel','2021','153','100000000','30000000','9','1','1'),
('Chaos Walking','2021','109','100000000','27000000','10','1','1');
SELECT * FROM movie;
UPDATE genre 
SET name_genre = "SF" 
WHERE id_genre = '8';
SELECT * FROM genre;

SET SQL_SAFE_UPDATES = 0;
UPDATE country 
SET name_country = "UNITED STATES OF AMERICA" 
WHERE name_country = "USA";
SELECT * FROM country;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE from movie WHERE duration < 110;
SELECT COUNT(*) FROM movie;
SELECT * FROM movie;
SET SQL_SAFE_UPDATES = 1;

SELECT title, duration, buget FROM movie ORDER BY buget ASC;
SELECT COUNT(*) FROM movie WHERE duration BETWEEN 120 AND 150;
SELECT title, buget FROM movie WHERE duration BETWEEN 120 AND 150 AND BUGET > 200000;
SELECT * FROM movie;
SELECT * FROM languages;
SELECT * FROM director;
SELECT * FROM genre;
SELECT * FROM country;
SELECT * FROM movie_genre;
EXPLAIN
SELECT title FROM movie WHERE buget > (SELECT AVG(buget) FROM movie);
EXPLAIN
SELECT id_country, COUNT(*) AS nr_filme 
FROM movie
GROUP BY id_country;

SELECT * FROM movie_genre;
INSERT INTO movie_genre (id_movie, id_genre)
VALUES
(1, 1), 
(1, 2), 
(1, 8),
(2, 1), 
(2, 2), 
(3, 3), 
(3, 5), 
(4, 1), 
(4, 6), 
(6, 1), 
(6, 4), 
(7, 1), 
(7, 6),
(7, 9),
(9, 6);

EXPLAIN
SELECT id_genre, COUNT(*) AS filme_pergen
FROM movie_genre 
GROUP BY id_genre
HAVING COUNT(*) >3;

SELECT * FROM movie;
EXPLAIN
SELECT title, box_office FROM movie
ORDER BY box_office DESC
LIMIT 10;

EXPLAIN
SELECT title, duration FROM movie
ORDER BY duration ASC
LIMIT 5;

SELECT * FROM movie;
SELECT SUM(box_office) AS total_sum
FROM movie; 

SELECT AVG(duration) AS durata_medie
FROM movie; 

SELECT MAX(buget), MIN(buget) FROM movie; 

SELECT UPPER(title) AS titlu_mare
FROM movie
WHERE LENGTH(title) > 15;

SELECT SUBSTRING(title, 1, 5) AS primele5car 
FROM movie;