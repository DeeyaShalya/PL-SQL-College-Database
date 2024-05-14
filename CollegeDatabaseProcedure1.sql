USE Practical_Exam;
DELIMITER //
CREATE PROCEDURE get_student_faculty_details()
BEGIN
    SELECT 
        sd.std_id, 
        sd.std_name, 
        sd.stream, 
        sd.course, 
        sd.course_code, 
        sd.credits,
        fd.fac_id AS faculty_id, 
        fd.fac_name AS faculty_name, 
        fd.course_title AS faculty_course
    FROM 
        student_detail sd
    JOIN 
        subject sub ON sd.course_code = sub.course_code
    JOIN 
        faculty_detail fd ON sub.fac_id = fd.fac_id;
END //
DELIMITER ;
CALL get_student_faculty_details();

