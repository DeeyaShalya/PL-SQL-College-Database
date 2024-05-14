USE Practical_Exam;

-- Drop the existing trigger if it exists
DROP TRIGGER IF EXISTS update_student_credits;

-- Drop the existing log_table if it exists
DROP TABLE IF EXISTS log_table;

-- Create the log_table
CREATE TABLE log_table (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_message VARCHAR(255)
);

DELIMITER //

CREATE TRIGGER update_student_credits
AFTER INSERT ON subject
FOR EACH ROW
BEGIN
    DECLARE credit_val INT;
    DECLARE message VARCHAR(255);
    
    -- Get the credits for the new subject
    SELECT credits INTO credit_val
    FROM subject
    WHERE course_code = NEW.course_code;
    
    -- Update the corresponding student's credits
    UPDATE student_detail
    SET credits = credit_val
    WHERE course_code = NEW.course_code;
    
    -- Set the message indicating the subject insertion
    SET message = CONCAT('Subject "', NEW.course_code, '" added. Credits updated for corresponding students.');
    
    -- Insert the message into the log_table for reference
    INSERT INTO log_table (log_message) VALUES (message);
END;
//

DELIMITER ;

-- Insert sample data into student_detail table
INSERT INTO student_detail (std_id, std_name, stream, course, course_code, credits)
VALUES 
    (51, 'John Doe', 'Science', 'B.Sc', 'SC001', 4),
    (52, 'Jane Smith', 'Technology', 'BTech', 'TECH001', 5),
    (53, 'Alice Johnson', 'Administration', 'BBA', 'ADM001', 3);

-- Insert sample data into faculty_detail table
INSERT INTO faculty_detail (fac_id, fac_name, course_title, course_code)
VALUES 
    (151, 'Dr. Smith', 'Physics', 'PHY101'),
    (152, 'Prof. Johnson', 'Computer Science', 'CS101'),
    (153, 'Dr. Brown', 'Business Management', 'BM101');

-- Insert sample data into subject table
INSERT INTO subject (department, stream, course_code, credits, fac_id)
VALUES 
    ('Science Department', 'Science', 'SC008', 4, 101),
    ('Technology Department', 'Technology', 'TECH008', 5, 102),
    ('Business Department', 'Administration', 'ADM008', 3, 103);
