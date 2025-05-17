import mysql.connector
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

cnx = mysql.connector.connect(
    host="127.0.0.1",
    port=3306,
    user="root",
    password="Poli@FSA1782")
cur = cnx.cursor()

if(cnx == None):
  print("There is no connection to database.")
else:
  print("Connection to database is created.")
  
cur.execute('USE movies')

query = "SELECT title, buget, box_office FROM movie"
df = pd.read_sql(query, cnx)

buget_mediu = df['buget'].mean()
print(buget_mediu)

df['castig'] = df['box_office'] - df['buget']
print(df['castig'])

plt.figure(figsize=(10, 6))
plt.scatter(df["buget"], df["castig"], color='teal', edgecolors='black')
plt.title("Scatter Plot: Buget vs Castig")
plt.xlabel("Buget")
plt.ylabel("Castig (Box Office - Buget)")
plt.grid(True)
plt.savefig("scatter_buget_castig.png")
plt.show()

#in general filmele cu un buget mai mare au un castig mai mare; cu o exceptie din ce iese din datele mele unde nu neaparat un buget mai mare a si generat un castig mai mare

import pandas as pd
correlation = df[['buget','castig']].corr().iloc[0,1]
print(f"Corelatia Pearson intre buget si castig: {correlation:.2f}")

#0.76 reprezinta o corelatie puternica indicand faptul ca exista o legatura puternic pozitiva intre bugetul filmelor si profitul obtinut

query1 = """SELECT c.name_country, AVG(box_office - buget) AS castig_mediu FROM movie AS m
JOIN country AS c ON m.id_country = c.id_country
GROUP BY c.name_country
ORDER BY castig_mediu DESC
LIMIT 3;"""

df_country = pd.read_sql(query1, cnx)

plt.figure(figsize=(8, 5))
plt.bar(df_country['name_country'], df_country['castig_mediu'], color='orange', edgecolor='black')
plt.title('Top 3 Țări cu Câștig Mediu pe Film')
plt.xlabel('Țară')
plt.ylabel('Câștig Mediu')
plt.tight_layout()
plt.savefig("top3_castig_pe_tara.png")
plt.show()
