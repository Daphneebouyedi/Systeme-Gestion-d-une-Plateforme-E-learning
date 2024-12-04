SELECT * FROM users;
SELECT * FROM users WHERE role = 'teacher';
SELECT id FROM users WHERE role = 'teacher';
SELECT GROUP_CONCAT(id) AS teacher_ids 
FROM users 
WHERE role = 'teacher';


