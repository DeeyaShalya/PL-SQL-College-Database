USE Practical_Exam;
-- Function to display faculty details along with the total number of students enrolled in each faculty's course:
DELIMITER //

CREATE PROCEDURE get_faculty_students_count()
BEGIN
    SELECT 
        fd.fac_id, 
        fd.fac_name, 
        fd.course_title AS course, 
        fd.course_code,
        COUNT(sd.std_id) AS num_students
    FROM 
        faculty_detail fd
    JOIN 
        subject sub ON fd.course_code = sub.course_code
    LEFT JOIN 
        student_detail sd ON sub.course_code = sd.course_code
    GROUP BY 
        fd.fac_id, 
        fd.fac_name, 
        fd.course_title, 
        fd.course_code;
END //

DELIMITER ;
CALL get_faculty_students_count();
