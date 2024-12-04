CREATE INDEX index_users_email_role ON users (email, role);
SHOW INDEX FROM users;
EXPLAIN SELECT * FROM users WHERE email = 'wentwisle3@chron.com' AND role = 'student';

