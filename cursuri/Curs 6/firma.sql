CREATE DATABASE IF NOT EXISTS firma;
use firma;
 
##Crearea tabelelor
 
CREATE TABLE IF NOT EXISTS departament
(id int unique auto_increment primary key,
nume char(20),
manager_id int);
 
CREATE TABLE IF NOT EXISTS angajat
(id int unique auto_increment primary key,
nume char(20),
prenume char(20),
departament_id int,
manager_id int ,
salariu int,
angajare date,
vechime date,
INDEX (departament_id),
FOREIGN KEY (departament_id) REFERENCES departament(id),
FOREIGN KEY(manager_id) REFERENCES angajat(id));



INSERT INTO departament (nume, manager_id) VALUES
('Achizitii', 1), ('QA', 2), ('IT', 3), ('Backend', 4), ('HR', 5), ('Suport', 6), ('Vanzari', 7);
 
 
INSERT INTO angajat
(nume, prenume, departament_id, manager_id, salariu, angajare)
VALUES
('Toma',    'Ion',    1, NULL, 9000, '2000-1-12'),
('Georgescu',     'Maria',   1, 1, 4000, '2003-5-6'),
('Marin',   'Vasile', 1, 1, 4500, '2004-6-3'),
('Ionescu',     'Andrei', 1, NULL, 3500, '2002-1-1'),
('Vasilescu',   'Ana',    2, NULL, 2500, '2006-3-3'),
('Albu',  'Dinu',   2, 5, 2000, '2004-11-12'),
('Adam',  'Adrian', 5, NULL, 3500, '2006-10-12'),
('Teodorescu',  'Matei',  3, NULL, 3000, '2005-1-12'),
('Popescu',     'Vasile', 3, 8, 4000, '2005-9-9'),
('Mateescu',    'Dumitru',3, 8, 3500, '2007-2-5'),
('Calinescu',   'Alin',   4, NULL, 3200, '2005-8-2'),
('Popescu',     'Mihaela',4, 12, 1800, '2005-4-8'),
('Gigi',    'Dan',7,13, 4500, '2005-02-25'),
('Damian',   'Alina',  6, NULL, 3200, '2005-8-2'),
('Achim',     'Calin',4, 12, 1800, '2005-4-8'),
('Ionescu',     'Diana',  5, NULL, 5500, '2001-1-12');

SELECT nume, prenume FROM angajat;
SELECT CONCAT(nume, ' ' ,prenume) AS "Nume complet" FROM angajat ORDER BY nume ASC;
SELECT id, nume, prenume FROM angajat ORDER BY nume DESC; #pt angajatii cu acelasi nume, adaug si id pt a fi unic
SELECT id, nume, prenume FROM angajat ORDER BY departament_id DESC, salariu ASC;
SELECT * FROM angajat;
SELECT * FROM departament;
SELECT id AS "id HR" FROM departament WHERE nume = 'HR';
SELECT id, nume, prenume FROM angajat WHERE departament_id=5;

SELECT * FROM angajat JOIN departament
ON angajat. departament_id = departament.id; /*tabela1fk = tabela2.pk*/

SELECT * FROM angajat JOIN departament
ON angajat. departament_id = departament.id WHERE nume = 'HR';
SELECT angajat.nume, angajat.prenume FROM angajat JOIN departament
ON angajat. departament_id = departament.id WHERE nume = 'HR';
SELECT COUNT(*) FROM angajat JOIN departament
ON angajat.departament_id = departament.id WHERE departament.nume != 'HR';
SELECT id, nume, prenume FROM angajat WHERE departament_id != 5;
SELECT id, nume, prenume FROM angajat WHERE salariu > 3000;
SELECT COUNT(*) FROM angajat WHERE salariu > 3000;
SELECT id, nume, prenume FROM angajat WHERE salariu = 3000;
SELECT id, nume, prenume FROM angajat WHERE salariu BETWEEN 3000 AND 5000;
SELECT id, nume, prenume FROM angajat WHERE manager_id IS NULL;
SELECT id, nume, prenume FROM angajat WHERE manager_id=1;
#enumerati angajatii ai caror manager este Toma Ion
SELECT id FROM angajat WHERE nume = 'Toma' AND prenume = 'Ion';
SELECT * FROM angajat JOIN angajat AS boss
ON angajat.manager_id = boss.id WHERE boss.nume = 'Toma' AND boss.prenume = 'Ion';

SELECT * FROM departament WHERE nume = 'Backend';
SELECT nume, prenume FROM angajat WHERE salariu > 2500 and departament_id = 4;

SELECT * FROM angajat JOIN departament
ON angajat.departament_id=departament.id WHERE salariu > 2500 AND departament.nume = 'Backend';

SELECT * FROM angajat AS sub JOIN angajat AS man
ON sub.manager_id = man.id WHERE man.nume != 'Toma' OR man.prenume != 'Ion';
-- SELECT * FROM angajat AS sub JOIN angajat AS man
-- ON man.manager_id = sub.id WHERE sub.nume != 'Toma' OR sub.prenume != 'Ion';

SELECT COUNT(*) FROM angajat AS sub JOIN angajat AS man
ON sub.manager_id = man.id WHERE man.nume != 'Toma' OR man.prenume != 'Ion';

SELECT * FROM angajat AS sub JOIN angajat AS man
ON sub.manager_id = man.id;

SELECT * FROM angajat AS sub LEFT JOIN angajat AS man
ON sub.manager_id = man.id;

SELECT COUNT(*) FROM angajat AS sub LEFT JOIN angajat AS man
ON sub.manager_id = man.id WHERE man.nume != 'Toma' OR man.prenume != 'Ion';

SELECT * FROM angajat AS sub LEFT JOIN angajat AS man
ON sub.manager_id = man.id WHERE (man.nume != 'Toma' OR man.prenume != 'Ion') OR sub.manager_id IS NULL;
SELECT COUNT(*) FROM angajat AS sub LEFT JOIN angajat AS man
ON sub.manager_id = man.id WHERE (man.nume != 'Toma' OR man.prenume != 'Ion') OR sub.manager_id IS NULL;

SELECT * FROM angajat AS s JOIN angajat AS m 
ON s.manager_id=m.id 
JOIN departament AS d 
ON s.departament_id = d.id;

SELECT * FROM angajat AS s JOIN departament AS d
ON s.departament_id = d.id;

CREATE VIEW amd AS 
	SELECT s.nume AS s_nume, s.prenume AS s_prenume, d.nume AS dep, m.nume AS m_nume, m.prenume AS m_prenume FROM
	angajat AS s JOIN angajat AS m 
	ON s.manager_id=m.id 
	JOIN departament AS d 
	ON s.departament_id = d.id;
SELECT * FROM amd;