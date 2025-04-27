import csv
with open("DBSP5_movies_04.csv","r", encoding="utf-8-sig") as freader:
    csv_reader = csv.DictReader(freader)
    print(csv_reader)
    for row in csv_reader:
        print(row)
    print(row['language'])