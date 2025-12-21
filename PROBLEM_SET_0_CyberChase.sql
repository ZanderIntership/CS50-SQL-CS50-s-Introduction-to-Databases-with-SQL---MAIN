--QUESTIOn 1

SELECT title FROM episodes WHERE
season = 1

--- QUESTIOn 2

SELECT season,title FROM episodes WHERE
episode_in_season = 1

-- QUESTIOn 3

SELECT production_code FROM episodes WHERE
title = 'Hackerized!'


--- QUESTION 4

SELECT title FROM episodes WHERE
topic IS NULL;


--- QUESTION 5

SELECT title  FROM episodes WHERE
air_date = '2004-12-31';


--- QUESTION 6 

SELECT title  FROM episodes WHERE
season = 6 AND air_date;


-- QUESTION 7

SELECT title, topic FROM episodes WHERE
topic LIKE '%fraction%';


--- QUESTION 8

SELECT COUNT(*) FROM episodes
WHERE air_date BETWEEN '2000-01-01' AND '2000-12-31';

--- QUESTION 9 

SELECT COUNT(title) FROM episodes
WHERE air_date BETWEEN '2002-01-01' AND '2007-12-31';


-- QUESTIOn 10 

SELECT id,title,production_code FROM episodes
ORDER BY production_code ASC;


-- QUESTION 11

SELECT title FROM episodes
WHERE season = 5
ORDER BY title DESC;


--- QUESTION 12

SELECT DISTINCT(COUNT(title)) FROM episodes;


-- QUESTIOn 13

SELECT title from episodes
WHERE season = 4 AND episode_in_season = 4;
















