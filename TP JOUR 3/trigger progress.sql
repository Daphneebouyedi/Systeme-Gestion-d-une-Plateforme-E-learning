DELIMITER //
CREATE TRIGGER trigger_progress_update
AFTER UPDATE ON progress_tracking
FOR EACH ROW
BEGIN
    IF NEW.status = 'not_started' AND OLD.status != 'not_started' THEN
        UPDATE progress_tracking
        SET completion_date = NULL
        WHERE id = NEW.id;
    
    ELSEIF NEW.status = 'in_progress' AND OLD.status != 'in_progress' THEN
        UPDATE progress_tracking
        SET completion_date = NULL
        WHERE id = NEW.id;

    ELSEIF NEW.status = 'completed' AND OLD.status != 'completed' THEN
        UPDATE progress_tracking
        SET completion_date = NOW()
        WHERE id = NEW.id;
    END IF;
END //
DELIMITER ;

SHOW TRIGGERS;

