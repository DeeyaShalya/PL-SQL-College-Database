USE Practical_Exam;
-- Program to fetch student details along with their corresponding faculty names and course titles:
DELIMITER //

CREATE PROCEDURE fetch_student_faculty_course()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE student_id INT;
    DECLARE student_name VARCHAR(100);
    DECLARE student_course_title VARCHAR(50);
    DECLARE faculty_name VARCHAR(100);
    
    -- Declare cursor to fetch student details
    DECLARE student_cursor CURSOR FOR
        SELECT std_id, std_name, course_code
        FROM student_detail;
    
    -- Declare continue handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN student_cursor;
    
    fetch_student: LOOP
        FETCH student_cursor INTO student_id, student_name, student_course_title;
        IF done THEN
            LEAVE fetch_student;
        END IF;
        
        -- Fetch faculty name for the student's course code
        SELECT fd.fac_name INTO faculty_name
        FROM faculty_detail fd
        JOIN subject sub ON fd.course_code = sub.course_code
        WHERE sub.course_code = student_course_title
        LIMIT 0;
        
        -- Display student details along with faculty name and course title
        SELECT student_id, student_name, faculty_name, student_course_title;
    END LOOP fetch_student;
    
    CLOSE student_cursor;
END //

DELIMITER ;
CALL fetch_student_faculty_course();
