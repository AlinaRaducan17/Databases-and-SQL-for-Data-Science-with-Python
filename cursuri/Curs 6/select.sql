DROP DATABASE IF EXISTS social_media;
CREATE DATABASE social_media;
USE social_media;
CREATE TABLE utilizator(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255));
#DROP TABLE postare;
CREATE TABLE postare (id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(255),
id_user INT,
 FOREIGN KEY (id_user) REFERENCES utilizator(id));
INSERT INTO utilizator (name) VALUES ("albatros"), ("bibilic"), ("coif"), ("dormitor");
SELECT * FROM utilizator;
INSERT INTO postare (title, id_user) VALUES ("Vacanta", 1);
INSERT INTO postare (title, id_user) VALUES ("AMuzant", 3);
INSERT INTO postare (title, id_user) VALUES ("Gluma de seara", 3);
INSERT INTO postare (title, id_user) VALUES ("Neverosimil", 4);
INSERT INTO postare (title, id_user) VALUES ("A ramas interzis", 1);
INSERT INTO postare (title, id_user) VALUES ("Cat e cozonacul", 3);
INSERT INTO postare (title, id_user) VALUES ("Cand cade 1 mai", 4);
SELECT * FROM postare;
DELETE FROM postare WHERE id = 3;
SELECT * FROM postare;
DELETE FROM postare WHERE id = 9;
SELECT COUNT(*) AS "Nr postari" FROM postare;
SELECT * FROM utilizator;
SELECT * FROM postare;
SELECT * FROM utilizator JOIN postare;
SELECT * FROM postare JOIN utilizator;
SELECT * FROM postare JOIN utilizator
ON postare.id_user =utilizator.id;
SELECT postare.id, title, name FROM postare INNER JOIN utilizator
ON postare.id_user =utilizator.id;
#INNER JOIN este defaultul la JOIN
SELECT * FROM postare LEFT JOIN utilizator
ON postare.id_user =utilizator.id;
SELECT * FROM postare RIGHT JOIN utilizator
ON postare.id_user =utilizator.id;
INSERT INTO postare (title) VALUES ("Totul e pustiu"), ("Ce inseamna nimic?");
SELECT * FROM postare;
SELECT * FROM utilizator LEFT JOIN postare
ON postare.id_user =utilizator.id;
SELECT * FROM utilizator RIGHT JOIN postare
ON postare.id_user =utilizator.id;
SELECT * FROM utilizator JOIN postare
ON postare.id_user =utilizator.id;
