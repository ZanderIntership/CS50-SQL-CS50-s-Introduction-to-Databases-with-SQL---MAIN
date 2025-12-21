--QUESTIOn 1

SELECT name, city FROM schools
WHERE state = 'MA' AND type LIKE '%Public%';

-- QUESTIOn 2

SELECT name FROM districts
WHERE name LIKE '%(non-op)'


--- QUESTIOn 3

SELECT AVG(per_pupil_expenditure) AS "Average District Per-Pupil Expenditure" FROM expenditures


--- QUESTIOn 4

SELECT city,COUNT(name) FROM "schools"
WHERE type = 'Public School'
GROUP BY city
ORDER BY COUNT(name) DESC, city ASC
LIMIT 10;

--- QUESTION 5 

SELECT city,COUNT(name) FROM schools
WHERE type = 'Public School'
GROUP BY city
HAVING COUNT(name) < 4
ORDER BY COUNT(name) DESC, city ASC


--- QUESTION 6 

SELECT name FROM "schools" S
LEFT JOIN "graduation_rates" GR ON GR.school_id = S.id
WHERE GR.graduated = '100'


-- QUESTION 7

SELECT S.name FROM schools S
LEFT JOIN "districts" D ON S.district_id = D.id
WHERE D.id = 81

--- QUESTION 8 

SELECT d.name, SUM(e.pupils) AS "pupils"
FROM "districts" d
LEFT JOIN "expenditures" e ON d.id = e.district_id
WHERE d.name NOT LIKE '%(non-op)'
GROUP BY d.name
HAVING SUM(e.pupils) IS NOT NULL

--- QUESTION 9

SELECT d.name AS "pupils"
FROM "districts" d
LEFT JOIN "expenditures" e ON d.id = e.district_id
WHERE d.name NOT LIKE '%(non-op)'
GROUP BY d.name
HAVING SUM(e.pupils) IS NOT NULL
ORDER BY SUM(e.pupils) ASC
LIMIT 1


--- QUESTION 13

SELECT name FROM "schools" S
LEFT JOIN "graduation_rates" GR ON GR.school_id = S.id
WHERE GR.graduated = '100'


















