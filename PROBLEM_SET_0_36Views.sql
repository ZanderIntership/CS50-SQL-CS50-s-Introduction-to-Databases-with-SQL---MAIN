-- QUESTIOn 1

SELECT english_title, japanese_title FROM views


-- QUESTIOn 2

SELECT average_color FROM views
    WHERE artist = 'Hokusai' AND english_title LIKE '%river%';


--- QUESTION 3

SELECT COUNT(*) FROM views
    WHERE artist = 'Hokusai' AND english_title LIKE '%Fuji%'


-- QUESTION 4

SELECT COUNT(english_title) FROM views
    WHERE artist = 'Hiroshige' AND english_title LIKE '%Eastern Capital%';


-- QUESTION 5

SELECT contrast AS "Maximum Contrast"  FROM views
    WHERE artist = 'Hokusai'
    ORDER BY contrast DESC
    LIMIT 1;


-- QUETSION 6

SELECT ROUND(AVG(entropy),2) AS "Hiroshige Average Entropy" FROM views
    WHERE artist = 'Hiroshige'


-- QUESTION 7

SELECT english_title  FROM views
    WHERE artist = 'Hiroshige'
    ORDER BY brightness DESC
    LIMIT 5;


-- QUESTION 8

SELECT english_title  FROM views
    WHERE artist = 'Hokusai'
    ORDER BY contrast ASC
    LIMIT 5;


-- QUESTION 9

SELECT english_title,artist  FROM views
    ORDER BY brightness  LIMIT 1;


-- QUETSIOn 10

SELECT english_title AS "TEST" FROM views
WHERE artist = 'Hokusai'
ORDER BY contrast DESC;














