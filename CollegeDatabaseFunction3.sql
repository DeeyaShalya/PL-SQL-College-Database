USE Practical_Exam;
-- Function to count the number of students enrolled in a given stream:
DELIMITER //
CREATE FUNCTION count_students_in_stream(stream_name VARCHAR(50)) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE num_students INT;
    
    SELECT COUNT(*) INTO num_students
    FROM student_detail
    WHERE stream = stream_name;
    
    RETURN num_students;
END //
DELIMITER ;
SELECT count_students_in_stream('Science') AS num_students_in_stream;

