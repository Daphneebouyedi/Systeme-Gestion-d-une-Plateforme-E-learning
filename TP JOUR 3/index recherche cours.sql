CREATE INDEX idx_courses_title_status ON courses (title, status);
SHOW INDEX FROM courses;
EXPLAIN SELECT * FROM courses WHERE title = 'Réseau' AND status = 'draft';
