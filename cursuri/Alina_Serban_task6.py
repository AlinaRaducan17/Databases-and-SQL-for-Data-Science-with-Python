import mysql.connector

cnx = mysql.connector.connect(
    host="127.0.0.1",
    port=3306,
    user="root",
    password="Poli@FSA1782")

cur = cnx.cursor()

cur.execute("SHOW DATABASES")

for db in cur:
    print(db)
    
 # Checking if the connection was successfully established
if(cnx == None):
  print("There is no connection to database.")
else:
  print("Connection to database is created.")
  
cur.execute('USE movies')

genre_buget = """SELECT genre.name_genre, movie.buget  FROM movie
JOIN movie_genre ON movie.id_movie = movie_genre.id_movie
JOIN genre ON movie_genre.id_genre = genre.id_genre;"""

cur.execute("INSERT INTO director (name_director) VALUES ('Nicolae Corjos')")
cur.execute("SELECT * FROM director")
for dir in cur:
    print(dir)

cur.execute("INSERT INTO languages (name_language) VALUES ('romana')")
cur.execute("SELECT * FROM languages")
for lb in cur:
    print(lb)
    
cur.execute("INSERT INTO country (name_country) VALUES ('Romania')")
cur.execute("SELECT * FROM country")
for tara in cur:
    print(tara)

cur.execute('INSERT INTO movie SET title = "Liceenii", release_year = "1986", duration = "95", buget = "12300", box_office = "20000", id_director=17, id_language = 13, id_country = 13')
cur.execute("SELECT * FROM movie")
for movie in cur:
    print(movie)

cur.execute("SELECT COUNT(*) FROM movie")
total_movies = cur.fetchone()[0]
print(total_movies)

import pandas as pd

query_2 = "SELECT id_movie, title, buget FROM movie"
df_movie = pd.read_sql(query_2, cnx)
 # Displaying the first 5 rows of data
print(df_movie.head())

df_grouped = df_movie.groupby("buget")["id_movie"].count()
print(df_grouped)

import matplotlib.pyplot as plt

plt.hist(df_movie['release_year'], color='red', edgecolor='black')
plt.xlabel("Release year")
plt.ylabel("Number of movies")
plt.title("Distribution of Movies by Year")
plt.show()

cnx.commit()
cur.close()
cnx.close()

print("Database connection closed.")