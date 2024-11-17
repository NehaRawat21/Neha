------------ IMDB DATASET MYSQL QUESTIONS-----------  




---- Q.1) Find all movies released in 2016? -- 
select title, year
from imdb2
where year = 2016;


-- --Q.2) List movies with a rating above rating > 8.0-- 
select Title, Rating
from imdb2
where Rating > 8.0;


-- --Q.3) Count the number of movies each director has directed--  
select Director, count(*)
from imdb2
group by Director;


-- Q.4) Retrieve movies directed by the director Christopher Nolan
select title 
from imdb2
where director = "Christopher Nolan";


-- Q.5) Find the average rating of all movies
select round(avg(rating),2)
from imdb2;

 
 -- --Q.6) Calculate the total revenue for movies released after 2012: 
 select round(sum(`Revenue (Millions)`),2) from imdb2
 where year > '2012';
 
 
-- Q.7) Get the count of movies in each genre:
select count(title), genre
from imdb2
group by genre;

-- Q.8) List the top 10 highest-rated movies:
select title, Rating from imdb2
order by Rating desc
limit 10;


-- Q.9) Find movies with the highest revenue:
SELECT Title, `Revenue (Millions)`
FROM imdb2
ORDER BY `Revenue (Millions)` DESC
LIMIT 1;


-- Q.10) Show movies that are both in the "Action" and "Sci-Fi" genres-- 
SELECT Title, Genre
FROM imdb2
WHERE Genre LIKE '%Action%' AND Genre LIKE '%Sci-Fi%';

-- Q.11) List all movies with directors who directed multiple movies-- 
SELECT Title, director
WHERE director IN (
    SELECT director
    FROM imdb2
    GROUP BY director
    HAVING COUNT(*) > 1
);

--- -Q.12)  List the top 5 genres by the total number of movie-- 
select genre , count(*) as movie_count
from imdb2
group by Genre
having count(*) > 1
order by movie_count desc
limit 5;

-- Q.13) Find the top 5 movies with the highest revenue and a rating above 7-- 
SELECT Title, `Revenue (Millions)`, Rating
FROM imdb2
where Rating >7
ORDER BY `Revenue (Millions)` DESC
LIMIT 5;

-- Q.14) List movies with the highest votes-to-revenue ratio-- 
SELECT Title, Votes, `Revenue (Millions)`, round((Votes / `Revenue (Millions)`),2) AS Votes_Revenue_Ratio
FROM imdb2
ORDER BY Votes_Revenue_Ratio DESC
LIMIT 10;

-- Q.15) Get movies with a Metascore above 80 and a rating above 8--
SELECT Title, Rating, Metascore
FROM imdb2
WHERE Metascore > 80 AND Rating > 8;


-- Q.16) Find the most common runtime for movies-- 
SELECT `Runtime (Minutes)`, COUNT(*) AS Count
FROM imdb2
GROUP BY `Runtime (Minutes)`
ORDER BY Count DESC
LIMIT 1;

-- Q.17) Calculate the average revenue for movies in each rating category (rounded to the nearest integer)-- 
SELECT ROUND(Rating) AS Rounded_Rating, AVG(`Revenue (Millions)`) AS Avg_Revenue
FROM imdb2
GROUP BY Rounded_Rating;


 



