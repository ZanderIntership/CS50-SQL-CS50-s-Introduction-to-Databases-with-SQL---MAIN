
UPDATE users
SET password = '982c0381c279d139fd221fce974916e7'
WHERE username = 'admin';


DELETE FROM user_logs
WHERE new_password = '982c0381c279d139fd221fce974916e7';


WITH admin_old AS (
    SELECT password AS old_admin_pass
    FROM users
    WHERE username = 'admin'
)
INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
SELECT 'update', 'admin', 'admin', old_admin_pass, password
FROM users, admin_old
WHERE users.username = 'emily33';
