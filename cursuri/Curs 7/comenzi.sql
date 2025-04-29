DROP DATABASE IF EXISTS magazin_online;
CREATE DATABASE IF NOT EXISTS magazin_online;
USE magazin_online;
 
#Tabela adrese
CREATE TABLE IF NOT EXISTS adresa
(id int unique auto_increment primary key,
strada char(20),
oras char(20));
 
#Tabela clienti
CREATE TABLE IF NOT EXISTS client
(id int unique auto_increment primary key,
denumire char(50),
adresa_id int,
INDEX (adresa_id),
FOREIGN KEY (adresa_id) REFERENCES adresa(id));
 
#Tabela comenzi
 CREATE TABLE IF NOT EXISTS comanda
(id int unique auto_increment primary key,
data date,
client_id int,
INDEX (client_id),
FOREIGN KEY (client_id) REFERENCES client(id));
 
#Tabela articole
 CREATE TABLE IF NOT EXISTS articol
(id int unique auto_increment primary key,
descriere char(40),
pret  float);
 
# Tabela de legatura dintre comenzi si articole (un articol poate sa apara in mai multe comenzi, o comanda are mai
#multe articole
 CREATE TABLE IF NOT EXISTS comanda_articol
(id int unique auto_increment primary key,
comanda_id int,
articol_id int,
cantitate int,
INDEX (comanda_id),
INDEX (articol_id),
FOREIGN KEY (comanda_id) REFERENCES comanda(id),
FOREIGN KEY (articol_id) REFERENCES articol(id));
-- Popularea tabelelor cu date

INSERT INTO adresa (strada, oras) VALUES
('Magheru', 'Bucuresti'),
('Brasov',  'Bucuresti'),
('Elisabeta', 'Bucuresti'),
('Maniu', 'Brasov'),
('Aviatorilor', 'Bucuresti'),
('Balcescu', 'Buzau'),
('Mihalache', 'Bucuresti'),
('Horea', 'Cluj Napoca'),
('Macaralei', 'Barlad'),
('Minerului', 'Petrosani');
 
##
INSERT INTO client (denumire, adresa_id) VALUES
('SC LEON SRL', 1),
('GEOMIL', 2),
('LIBERTY', 3),
('MINERON', 10),
('AEROFUN', 4),
('MEDITEL', 5);
 
##
INSERT INTO comanda (data, client_id) VALUES
('2023-4-8', 1),
('2023-4-8', 1),
('2023-4-7', 2),
('2022-4-8', 2),
('2022-4-9', 3),
('2022-4-8', 4),
('2021-4-8', 5);
 
##
INSERT INTO articol (descriere, pret) VALUES
('stilou', 5),
('pix bila', 4),
('creion', 0.5),
('marker', 2),
('guma', 0.75),
('rigla', 1),
('echer', 1),
('penar', 2),
('top hartie', 9.5),
('top hartie gloss', 9.5),
('cutie cerneala', 2.25);
 
##
INSERT INTO comanda_articol (comanda_id, articol_id, cantitate) VALUES
 
(1,1,10),
(1,2,10),
(1,3,10),
 
 
(2,4,2),
(2,5,4),
(2,6,12),
 
(3,8,20),
(3,5,42),
 
 
(4,1,20),
(4,2,40),
(4,3,20),
(4,4,40),
(4,5,20),
(4,6,20),
 
(5,1,100),
(5,7,200),
 
(6,2,25),
(6,6,25),
(7,3,100);
SELECT * FROM comanda;
SELECT COUNT(*) AS nr_comenzi FROM comanda;
SELECT * FROM adresa;
SELECT COUNT(oras) AS 'Adrese din Bucuresti' FROM adresa WHERE oras = "Bucuresti";
SELECT DISTINCT oras FROM adresa; 
SELECT COUNT(DISTINCT oras) AS "Nr orase" FROM adresa; 
SELECT * FROM articol;
SELECT DISTINCT pret FROM articol;
SELECT COUNT(DISTINCT pret) AS "nr_pret" FROM articol;
SELECT DISTINCT oras FROM adresa; 
#calculati nr de orase din toate adresele al caror nume incepe cu litere diferite
SELECT SUBSTR(oras, 1, 1) FROM adresa;
SELECT LEFT(oras, 1) FROM adresa;
SELECT COUNT(DISTINCT LEFT(oras, 1)) AS "Nr litere de inceput" FROM adresa;
SELECT * FROM articol;
SELECT MAX(pret) FROM articol;
SELECT MAX(pret), MIN(pret) FROM articol;
SELECT MAX(cantitate), MIN(cantitate) FROM comanda_articol;
#care este pretul minim al articolelor al caror nume incepe cu "p"
SELECT * FROM articol WHERE LEFT(descriere, 1) = "p";
SELECT MIN(pret) FROM articol WHERE LEFT(descriere, 1) = "p";
SELECT * FROM articol WHERE descriere LIKE 'p%';
SELECT * FROM articol WHERE descriere LIKE '%e%'; #care sa contina e la interior
#pretul maxim al articolelor din comanda nr 3
SELECT MAX(pret) FROM articol AS a JOIN comanda_articol AS c
ON c.articol_id=a.id
WHERE comanda_id = 3;
SELECT COUNT(pret) FROM articol WHERE pret = (SELECT MAX(pret) FROM articol);
#SET @@sql_safe_updates = 0/1; #variabile de sistem

#imi pot defini o variabila proprie
#varianta - cea mai buna 
SET @variabila_mea = 20;
SELECT @variabila_mea;

#varianta - similara de setare dar atentie este cu :=
SET @variabila_mea := 23; #arata acelasi lucru ca la egal dar := inseamna ca si atribuie. 
SELECT @variabila_mea;

#aici nu se seteaza valoarea
SELECT @variabila_mea = 777;
SELECT @variabila_mea;

#alta varianta pentru count articole cu pret maxim
SET @max_pret = (SELECT MAX(pret) FROM articol);
SELECT COUNT(pret) FROM articol WHERE pret = @max_pret;

SELECT COUNT(pret) FROM articol WHERE pret = (SELECT MIN(pret) FROM articol);
SELECT MAX(pret) - MIN(pret) FROM articol;
SELECT MAX(pret), MIN(pret) FROM articol;

SET @max_pret = (SELECT MAX(pret) FROM articol);
SET @min_pret = (SELECT MIN(pret) FROM articol);
SELECT @max_pret - @min_pret;

#suma comenzii nr 3, dar tb sa fac cantitate ori pret 
SELECT SUM(pret) FROM articol;
SELECT SUM(pret*cantitate) FROM articol AS a JOIN comanda_articol AS c
ON c.articol_id=a.id
WHERE comanda_id = 3;

#calculati pretul mediu al articolelor; pretul mediu ponderat
SELECT AVG(pret) AS pret_mediu FROM articol;

#care este initiala clientului cu ultimul nume, in ordine alfabetica
SELECT * FROM client;
SELECT * FROM client ORDER BY denumire DESC LIMIT 1;
SELECT LEFT(denumire, 1) FROM client ORDER BY denumire DESC LIMIT 1;

#max(denumire) le seteaza automat ASC si il ia pe ultimul
SELECT MAX(denumire) FROM client;  
SELECT LEFT(MAX(denumire), 1) FROM client;