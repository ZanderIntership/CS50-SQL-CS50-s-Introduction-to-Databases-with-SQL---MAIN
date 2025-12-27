-- SQL 1

SELECT "username" FROM "users"
WHERE "last_login_date" >= '2024-01-01';


-- SQL 2

SELECT "expires_timestamp" FROM "messages"
WHERE "id" = 151 

-- SQL 3

  SELECT "to_user_id"
FROM "messages"
WHERE "from_user_id" = (
    SELECT "id" FROM "users" WHERE "username" = 'creativewisdom377'
)
GROUP BY "to_user_id"
ORDER BY COUNT(*) DESC
LIMIT 3;


  
-- SQL 4

SELECT username FROM "messages"
JOIN "users" ON users.id = messages.to_user_id
GROUP BY to_user_id, username
ORDER BY  COUNT(*) DESC
LIMIT 1 ;


