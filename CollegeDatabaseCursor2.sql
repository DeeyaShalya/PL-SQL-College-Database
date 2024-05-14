USE Practical_Exam;
-- Program to fetch faculty details along with their corresponding student names and streams:
DELIMITER //

CREATE PROCEDURE fetch_faculty_students_stream()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE faculty_id INT;
    DECLARE faculty_name VARCHAR(100);
    DECLARE faculty_course_code VARCHAR(10);
    DECLARE student_name VARCHAR(100);
    DECLARE student_stream VARCHAR(50);
    
    -- Declare cursor to fetch faculty details
    DECLARE faculty_cursor CURSOR FOR
        SELECT fac_id, fac_name, course_code
        FROM faculty_detail;
    
    -- Declare continue handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN faculty_cursor;
    
    fetch_faculty: LOOP
        FETCH faculty_cursor INTO faculty_id, faculty_name, faculty_course_code;
        IF done THEN
            LEAVE fetch_faculty;
        END IF;
        
        -- Fetch student names and streams for the faculty's course code
        SELECT std_name, stream INTO student_name, student_stream
        FROM student_detail
        WHERE course_code = faculty_course_code;
        
        -- Display faculty details along with student names and streams
        SELECT faculty_id, faculty_name, student_name, student_stream;
    END LOOP fetch_faculty;
    
    CLOSE faculty_cursor;
END //

DELIMITER ;
CALL fetch_faculty_students_stream();
