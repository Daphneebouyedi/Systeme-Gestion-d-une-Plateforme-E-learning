CREATE INDEX idx_enrollments_student_course_date ON enrollments (student_id, course_id, enrollment_date);
SHOW INDEX FROM enrollments;
SHOW INDEXES FROM enrollments;
EXPLAIN SELECT * FROM enrollments WHERE student_id = 39 AND course_id = 1;

