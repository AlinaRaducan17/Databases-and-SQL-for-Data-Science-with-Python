USE universitate;
SELECT * FROM profesor;
SELECT idprofesor, nume, prenume FROM profesor;
SELECT nume prenume FROM profesor;
SELECT nume FROM profesor;
SELECT nume AS 'Nume de familie' FROM profesor; #comanda merge si fara AS, dar e mai putin intuitiv
SELECT nume prenume FROM profesor; #la fel se intampla si aici, preia numele ca prenume (fiind fara virgula). Cd am un grup de cuvinte cu spatiu, tb sa pun intre ghilimele ca la "nume de familie"