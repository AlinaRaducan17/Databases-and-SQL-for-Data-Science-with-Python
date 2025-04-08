CREATE DATABASE IF NOT EXISTS facultate;
USE facultate;
CREATE TABLE student (idstudent INT PRIMARY KEY AUTO_INCREMENT, 
nume VARCHAR(255) NOT NULL UNIQUE,
prenume VARCHAR(255) NOT NULL UNIQUE,
grupa INT NOT NULL CHECK (grupa in (1,2,3,4)),
email VARCHAR(255) UNIQUE,
data_inscrierii DATETIME DEFAULT CURRENT_TIMESTAMP,
statut VARCHAR(10) DEFAULT "neevaluat" CHECK (statut in ("admis", "respins", "neevaluat")));
SELECT * FROM student;
INSERT INTO student SET nume = "Georgescu", prenume = "George", grupa = 1, email ="george@facultate.ro";
SELECT * FROM student;