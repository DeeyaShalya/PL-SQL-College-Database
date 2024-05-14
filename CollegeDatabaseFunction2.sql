USE Practical_Exam;
-- Function to get the faculty name for a given course code:
DELIMITER //
CREATE FUNCTION get_faculty_name(course_code VARCHAR(10)) RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE faculty_name VARCHAR(100);
    
    SELECT fd.fac_name INTO faculty_name
    FROM faculty_detail fd
    JOIN subject sub ON fd.course_code = sub.course_code
    WHERE sub.course_code = course_code
    LIMIT 1;
    
    RETURN faculty_name;
END //
DELIMITER ;

SELECT get_faculty_name('TECH001') AS faculty_name_for_course;
SELECT fd.fac_name
FROM faculty_detail fd
JOIN subject sub ON fd.course_code = sub.course_code
WHERE sub.course_code = 'TECH001'
LIMIT 1;

