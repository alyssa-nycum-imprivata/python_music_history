--#1 Query all of the entries in the Genre table
SELECT * FROM Genre;

--#2 Using the INSERT statement, add one of your favorite artists to the Artist table.
SELECT * FROM Artist;
INSERT INTO Artist(ArtistName, YearEstablished) VALUES("The Maine", 2007);

--#3 Using the INSERT statement, add one, or more, albums by your artist to the Album table.
SELECT * FROM Album;
INSERT INTO Album VALUES(23, "You Are Okay", "03/29/2019", 2673, "Self-Released", 28, 2);

--#4 Using the INSERT statement, add some songs that are on that album to the Song table.
SELECT * FROM Song;
INSERT INTO Song VALUES(22, "Slip The Noose", 243, "03/29/2019", 2, 28, 23), (23, "My Best Habit", 234, "03/29/2019", 2, 28, 23), (24, "Heaven, We're Already Here", 279, "03/29/2019", 2, 28, 23);

--#5 Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT b.ArtistName, a.Title, s.Title
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN Artist b ON b.ArtistId = s.ArtistId
WHERE b.ArtistName LIKE "the maine";

--#6 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title, COUNT(s.SongId) AS 'Song Count'
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;

--#7 Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT b.ArtistName, COUNT(s.SongId) AS 'Song Count'
FROM Song s 
LEFT JOIN Artist b ON s.ArtistId = b.ArtistId
GROUP BY s.ArtistId;

--#8 Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT(s.SongId) AS 'Song Count'
FROM Song s 
LEFT JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.GenreId;

--#9 Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT b.ArtistName, a.Title AS AlbumTitle, MAX(a.AlbumLength) AS AlbumLength
FROM Album a 
LEFT JOIN Artist b ON a.ArtistId = b.ArtistId;

--#10 Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, MAX(SongLength) AS SongLength
FROM Song;

--#11 Modify the previous query to also display the title of the album.
SELECT b.ArtistName, a.Title AS AlbumTitle, s.Title AS SongTitle, MAX(s.SongLength) AS SongLength
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN Artist b ON s.ArtistId = b.ArtistId;

