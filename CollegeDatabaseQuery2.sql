USE Practical_Exam;
SELECT 
    sub.department, 
    sub.stream, 
    sub.fac_id, 
    fd.fac_name
FROM 
    subject sub
INNER JOIN 
    faculty_detail fd ON sub.fac_id = fd.fac_id;
