USE Practical_Exam;

DELIMITER //

IF NOT EXISTS (SELECT * FROM information_schema.triggers WHERE trigger_name = 'update_student_credits')
THEN
    CREATE TRIGGER update_student_credits
    AFTER INSERT ON subject
    FOR EACH ROW
    BEGIN
        DECLARE credit_val INT;
        
        -- Get the credits for the new subject
        SELECT credits INTO credit_val
        FROM subject
        WHERE course_code = NEW.course_code;
        
        -- Update the corresponding student's credits
        UPDATE student_detail
        SET credits = credit_val
        WHERE course_code = NEW.course_code;
        
        -- Set the message indicating the subject insertion
        SET @message = CONCAT('Subject "', NEW.course_code, '" added. Credits updated for corresponding students.');
        
        -- Raise an error to display the message
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END;
END IF;
//

DELIMITER ;

ALTER TABLE subject
ADD PRIMARY KEY (course_code);

SET SQL_SAFE_UPDATES = 0;

INSERT INTO subject (department, stream, course_code, credits, fac_id)
VALUES ('Commerce Department', 'Commerce', 'COM004', 3, 116);
