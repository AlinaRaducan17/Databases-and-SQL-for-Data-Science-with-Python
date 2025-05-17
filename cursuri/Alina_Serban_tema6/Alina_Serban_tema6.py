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

cur.execute("SHOW DATABASES")
for db in cur:
    print(db)
    
if(cnx == None):
  print("There is no connection to database.")
else:
  print("Connection to database is created.")

cur.execute('USE movies')

query = """SELECT genre.name_genre, movie.buget  FROM movie
JOIN movie_genre ON movie.id_movie = movie_genre.id_movie
JOIN genre ON movie_genre.id_genre = genre.id_genre;"""

df = pd.read_sql_query(query, cnx)
print(df)

print(df.columns)

df_buget_genre = df.groupby('name_genre')['buget'].mean()
print(df_buget_genre)

print(df.describe())

query_2 = "SELECT id_movie, title, buget FROM movie"
df_movie = pd.read_sql(query_2, cnx)
 # Displaying the first 5 rows of data
print(df_movie.head())

df_grouped = df_movie.groupby("buget")["id_movie"].count()

plt.figure(figsize=(10, 6))
sns.barplot(x=df_buget_genre.index, y=df_buget_genre.values, palette="viridis")
plt.title('Bugetul Mediu al Filmelor pe Gen')
plt.xlabel('Gen')
plt.ylabel('Buget Mediu')
plt.xticks(rotation=45)

# Rotating labels if there are many
plt.show()
































