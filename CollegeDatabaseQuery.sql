USE Practical_Exam;
SELECT 
    fd.fac_id, 
    fd.fac_name, 
    fd.course_title AS course, 
    fd.course_code AS course_id, 
    (
        SELECT 
            sub.credits 
        FROM 
            subject sub 
        WHERE 
            sub.course_code = fd.course_code 
        LIMIT 1
    ) AS credit
FROM 
    faculty_detail fd;

