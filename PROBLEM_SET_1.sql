--QUESTION 1

SELECT year, ROUND(AVG(salary),2) FROM "salaries"
GROUP BY year
ORDER BY year DESC

-- QUESTION 2

SELECT S.year,SUM(S.salary) FROM "salaries" S
LEFT JOIN "players" P ON S.player_id = p.id
WHERE p.first_name = 'Cal'
GROUP BY S.year
ORDER BY S.year DESC


---QUESTION 3

SELECT PP.year, PP.HR FROM "performances" PP
LEFT JOIN "players" PS ON PP.player_id = PS.id
WHERE PS.first_name = 'Ken' AND PS.last_name = 'Griffey' AND PS.birth_year = '1969'
ORDER BY PP.year DESC

--QUESTION 4 

SELECT P.first_name, P.last_name, S.salary FROM "players" P
LEFT JOIN "salaries" S ON S.player_id = P.id
WHERE S.year = '2001'
ORDER BY S.salary ASC, P.first_name ASC, P.last_name ASC, P.id ASC
LIMIT 50


--- QUESTION 5

SELECT DISTINCT T.name
FROM players P
JOIN performances PF ON PF.player_id = P.id
JOIN teams T ON T.id = PF.team_id
WHERE P.first_name = 'Satchel'
  AND P.last_name = 'Paige';


--- QUESTION 6 

SELECT SUM(PF.H),T.name AS "total hits"
FROM players P
JOIN performances PF ON PF.player_id = P.id
JOIN teams T ON T.id = PF.team_id
WHERE PF.year = '2001'
GROUP BY T.id
ORDER BY SUM(PF.H) DESC
LIMIT 5


--- QUESTION 7

SELECT P.first_name, P.last_name
FROM players P
JOIN salaries S ON S.player_id = P.id
WHERE S.salary = (
    SELECT MAX(salary)
    FROM salaries
);


---- QUESTION 8

SELECT S.salary FROM "players" P
JOIN "performances" PF ON P.id = PF.player_id
JOIN "salaries" S ON PF.player_id = S.player_id
WHERE PF.year = '2001' AND S.salary = '10300000'


--- QUESTION 9 

SELECT T.name,ROUND(AVG(S.salary),2) AS "average salary" FROM "salaries" S
LEFT JOIN "teams" T ON T.id = S.team_id
WHERE S.year = '2001'
GROUP BY T.id
ORDER BY ROUND(AVG(S.salary),2) ASC
LIMIT 5






























