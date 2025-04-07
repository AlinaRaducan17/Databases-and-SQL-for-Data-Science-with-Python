#SELECTARE FARA TABELA
SELECT 10;
SELECT 10 AS "Nota";
#nu functioneaza: CREATE DATABASE masini furate;
#dar ar tb sa mearga cu ghilimele, dar la mine nu merge: CREATE DATABASE "masini furate"; ghilimelele tb folosite mereu

USE personal;
#sau, mai putem accesa baza de date la crearea tabelului astfel:CREATE TABLE personal.people (); si apoi tb mentionat SELECT personal.people
CREATE TABLE people (first_name VARCHAR(255), 
last_name VARCHAR(255));
SELECT * FROM people;
#adaugarea unei noi coloane nu merge cu update
ALTER TABLE people ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT;
SELECT * FROM people;
INSERT INTO people SET first_name = "Duck", last_name = "Donald";
SELECT * FROM people;
INSERT INTO people SET first_name = "Mouse", last_name = "Mickey";
SELECT * FROM people;
INSERT INTO people SET first_name = "Duck", last_name = "Duffy";
SELECT * FROM people;
INSERT INTO people SET first_name = "Mouse", last_name = "Minnie";
SELECT * FROM people;
DELETE FROM people WHERE id=2;
SELECT * FROM people;
ALTER TABLE people ADD COLUMN varsta INT; 
SELECT * FROM people;
ALTER TABLE people ADD COLUMN retea VARCHAR(255) DEFAULT "Disney"; 
SELECT * FROM people;
ALTER TABLE people ADD COLUMN culoare VARCHAR(255), ADD dimensiune INT; 
SELECT * FROM people;
