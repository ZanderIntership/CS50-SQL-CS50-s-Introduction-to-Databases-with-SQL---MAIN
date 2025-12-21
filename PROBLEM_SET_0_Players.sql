---QUESTION 1

SELECT birth_city,birth_state,birth_country FROM players
WHERE first_name = 'Jackie' AND last_name = 'Robinson';


-- QUESTION 2

SELECT bats FROM players
WHERE first_name = 'Babe' AND last_name = 'Ruth';

-- QUESTION 3

SELECT id FROM players
WHERE debut IS NULL


-- QUESTION 4

SELECT first_name,last_name  FROM players
WHERE birth_country != 'USA'
ORDER BY first_name ASC, last_name ASC;


-- QUESTION 5

SELECT first_name,last_name  FROM players
WHERE bats = 'R'
ORDER BY first_name ASC, last_name ASC;


-- QUESTION 6

SELECT first_name,last_name,debut   FROM players
WHERE birth_city = 'Pittsburgh' AND birth_state = 'PA'
ORDER BY debut DESC, first_name ASC, last_name ASC;


-- QUESTION 10

SELECT id AS "TEST001" FROM players
WHERE bats = 'L'
ORDER BY id DESC;
