CREATE INDEX idx_progress_tracking_student_status ON progress_tracking (student_id, status);
SHOW INDEX FROM progress_tracking;
EXPLAIN SELECT * FROM progress_tracking WHERE student_id = 60 AND status = 'completed';
