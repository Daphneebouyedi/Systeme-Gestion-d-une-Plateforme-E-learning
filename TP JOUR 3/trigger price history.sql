DELIMITER //

CREATE TRIGGER trigger_price_history
AFTER UPDATE ON courses
FOR EACH ROW
BEGIN
    IF OLD.price != NEW.price THEN
        INSERT INTO price_history (course_id, old_price, new_price)
        VALUES (NEW.id, OLD.price, NEW.price);
    END IF;
END //

DELIMITER ;

