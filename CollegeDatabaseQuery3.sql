USE Practical_Exam;
SELECT 
    sd.std_id, 
    sd.std_name, 
    sd.course, 
    (
        SELECT 
            sub.department 
        FROM 
            subject sub 
        WHERE 
            sub.course_code = sd.course_code 
        LIMIT 1
    ) AS department
FROM 
    student_detail sd;
