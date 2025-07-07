---IMDB Movie Dataset Analysis using SQL


CREATE DATABASE Movies

DROP TABLE IF EXISTS Movie_Ratings
CREATE TABLE Movie_Ratings
(
Poster_Link varchar(300),
Series_Title   varchar(100),
Released_Year  varchar(10),
Certificate     varchar(10),
Runtime	       varchar(10),
Genre         varchar(50),
IMDB_Rating    decimal,
Overview        varchar(500),
Meta_score   int,
Director  varchar(100),
Star1	   varchar(100),
Star2    varchar(100),
Star3     varchar(100),
Star4	varchar(100),
No_of_Votes int,
Gross   money

);

--1) Fetch all data from IMDB Table
SELECT * FROM Movie_Ratings

--2)Fetch only the name and release year and director for all movies
SELECT series_title , released_year, director FROM Movie_Ratings

--3)Fetch the name, release year and imdb ratings of movies which are UA certified
SELECT series_title , released_year, imdb_rating FROM Movie_Ratings
WHERE certificate = 'UA'


--4)Fetch the name and genre of movies which are UA-certified and have a IMDb rating over 8.
SELECT series_title , genre FROM Movie_Ratings
WHERE certificate = 'UA' AND imdb_rating>8


--5)Find out how many movies are of drama genre.
SELECT COUNT(*) FROM Movie_Ratings
WHERE genre like '%Drama%'

--6)How many movies are directed by : Quentin Tarantino, Steven Spielberg, Christopher Nolan, and Rajkumar Hirani?
SELECT COUNT(*) FROM Movie_Ratings
WHERE director in ('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan','Rajkumar Hirani')

--7) Find out all the movies starting by Aamir Khan.
SELECT * FROM Movie_Ratings
WHERE star1 = 'Aamir Khan'
OR star2 = 'Aamir Khan'
OR star3 = 'Aamir Khan'
OR star4 = 'Aamir Khan'

--8)Find out the movie starting by Aamir Khan and IMDb rating more than 8.3.
SELECT * FROM Movie_Ratings
WHERE imdb_rating > 8.3
AND star1 = 'Aamir Khan'
OR star2 = 'Aamir Khan'
OR star3 = 'Aamir Khan'
OR star4 = 'Aamir Khan'

--9)Display all the movie names who does not receive certificate.
SELECT series_title, certificate FROM Movie_Ratings
WHERE certificate IS NULL

--10)Display only movie names who receive certificate.
SELECT series_title, certificate FROM Movie_Ratings
WHERE certificate IS NOT NULL

--11)Display all the movie names who receive certificate other than U and UA.
SELECT series_title, certificate FROM Movie_Ratings
WHERE certificate NOT IN ('U','UA')

--12) Display all the movies apart from Crime genre.
SELECT series_title, genre FROM Movie_Ratings
WHERE genre NOT LIKE('%Crime%')

--13.a)Maximum value in movie ratings
SELECT MAX(imdb_rating) AS Maximum_Value
FROM Movie_Ratings

--13.b)Manimum Income in movie ratings
SELECT MIN(gross) AS Minimum_Income
FROM Movie_Ratings

--13)Show me both minimum and maximum value in one single row.
SELECT MAX(imdb_rating) AS Maximum_Value,
       MIN(imdb_rating) AS Manimum_Value
FROM Movie_Ratings

--14)Show me both minimum and maximum value in different row.
SELECT MAX(imdb_rating) AS MIN_MAX
FROM Movie_Ratings
UNION
SELECT MIN(imdb_rating) AS Minimum_Value
FROM Movie_Ratings

--15)Add a row heading or row title for each value.
SELECT MAX(imdb_rating) AS Values, 'Min_Value' AS Min_Max
FROM Movie_Ratings
UNION
SELECT MAX(imdb_rating), 'Max_Value' 
FROM Movie_Ratings

--16) Show the total count of each certificate.
SELECT COUNT(certificate) ,certificate
FROM Movie_Ratings
WHERE certificate IS NOT NULL
GROUP BY certificate

--17) Show the total count of each certificate where count must be greater than 120.
SELECT COUNT(certificate) ,certificate
FROM Movie_Ratings
GROUP BY certificate
HAVING COUNT(certificate) > 120

--18)Total Votes for each certificate
SELECT SUM(No_of_votes) AS Total_Votes, certificate
FROM Movie_Ratings
GROUP BY certificate
