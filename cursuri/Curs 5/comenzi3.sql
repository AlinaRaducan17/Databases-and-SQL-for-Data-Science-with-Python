USE universitate;
SELECT * FROM profesor;
SELECT COUNT(*) AS "TOTAL" FROM profesor;
SELECT * FROM profesor ORDER BY nume;
SELECT * FROM profesor ORDER BY nume DESC;
SELECT * FROM profesor ORDER BY nume DESC LIMIT 3;
SELECT * FROM profesor ORDER BY nume DESC LIMIT 3 , 2;#sare peste primele 3 si afiseaza urmatoarele 2
SELECT CONCAT(nume, ' ' ,prenume) FROM profesor;
SELECT CONCAT(nume, ' ' ,prenume) AS "Nume complet" FROM profesor;
SELECT MAX(nume) FROM profesor;
SELECT MAX(data_nasterii) FROM profesor;
SELECT MIN(nume), MAX(data_nasterii), MIN(grad) FROM profesor;
SELECT DISTINCT grad FROM profesor;
SELECT COUNT(*) FROM profesor WHERE grad = "I";
SELECT COUNT(*) FROM profesor GROUP BY grad; #agregare