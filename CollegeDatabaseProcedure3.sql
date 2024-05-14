USE Practical_Exam;
-- Function to display subject details along with the total number of credits for each subject:
DELIMITER //

CREATE PROCEDURE get_subject_total_credits()
BEGIN
    SELECT 
        sub.department, 
        sub.stream, 
        sub.course_code, 
        SUM(sub.credits) AS total_credits
    FROM 
        subject sub
    GROUP BY 
        sub.department, 
        sub.stream, 
        sub.course_code;
END //

DELIMITER ;
CALL get_subject_total_credits();
