import csv
with open("profesori_backup.csv","r") as freader:
    csv_reader = csv.DictReader(freader)
    #print(csv_reader)
    for row in csv_reader:
        #print(row)
        print(f'INSERT INTO profesor SET idprofesor={row["idprofesor"]}, nume=\"{row["nume"]}\", prenume=\"{row["prenume"]}\", adresa={row["adresa"]}, data_nasterii=\"{row["data_nasterii"]}\", grad=\"{row["grad"]}\"')