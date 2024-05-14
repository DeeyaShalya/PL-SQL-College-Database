USE Practical_Exam;
DELIMITER //
CREATE FUNCTION calculate_avg_credits_per_student() RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE avg_credits DECIMAL(10, 2);
    SELECT AVG(credits) INTO avg_credits FROM student_detail;
    RETURN avg_credits;
END //
DELIMITER ;
SELECT calculate_avg_credits_per_student() AS avg_credits_per_student;

