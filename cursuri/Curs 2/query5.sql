CREATE DATABASE IF NOT EXISTS online_store ;
USE online_store;
CREATE TABLE computer_parts (id INT PRIMARY KEY AUTO_INCREMENT, Cod_dispozitiv VARCHAR (5), Tip_dispozitiv VARCHAR (255) DEFAULT "Electronic", 
nume_dispozitiv VARCHAR(100) UNIQUE NOT NULL, pret_dispozitiv DECIMAL (7,2));
SELECT* FROM computer_parts;
INSERT INTO computer_parts SET nume_dispozitiv ="cablu", pret_dispozitiv=54.23;
SELECT* FROM computer_parts;