use practical_exam; 
-- Create the student_detail table
CREATE TABLE student_detail (
    std_id INT PRIMARY KEY,
    std_name VARCHAR(100),
    stream VARCHAR(50),
    course VARCHAR(50),
    course_code VARCHAR(10),
    credits INT
);

-- Insert sample data into student_detail table
INSERT INTO student_detail (std_id, std_name, stream, course, course_code, credits) 
VALUES 
    (1, 'John Doe', 'Science', 'B.Sc', 'SC001', 120),
    (2, 'Jane Smith', 'Technology', 'BTech', 'TECH001', 140),
    (3, 'Alice Johnson', 'Administration', 'BBA', 'ADM001', 100),
    (4, 'Bob Brown', 'Arts', 'B.A', 'ARTS001', 80),
    (5, 'Emily Wang', 'Commerce', 'B.Com', 'COM001', 110);

-- Create the faculty_detail table
CREATE TABLE faculty_detail (
    fac_id INT PRIMARY KEY,
    fac_name VARCHAR(100),
    course_title VARCHAR(50),
    course_code VARCHAR(10)
);

-- Insert sample data into faculty_detail table
INSERT INTO faculty_detail (fac_id, fac_name, course_title, course_code) 
VALUES 
    (101, 'Dr. Smith', 'Physics', 'PHY101'),
    (102, 'Prof. Johnson', 'Computer Science', 'CS101'),
    (103, 'Dr. Brown', 'Business Management', 'BM101'),
    (104, 'Prof. Wilson', 'Literature', 'LIT101'),
    (105, 'Dr. Wang', 'Economics', 'ECO101');

-- Create the subject table
CREATE TABLE subject (
    department VARCHAR(50),
    stream VARCHAR(50),
    course_code VARCHAR(10),
    credits INT,
    fac_id INT,
    FOREIGN KEY (fac_id) REFERENCES faculty_detail(fac_id)
);

-- Insert sample data into subject table
INSERT INTO subject (department, stream, course_code, credits, fac_id)
VALUES 
    ('Science Department', 'Science', 'SC001', 4, 101),
    ('Computer Science Department', 'Technology', 'TECH001', 5, 102),
    ('Business Department', 'Administration', 'ADM001', 3, 103),
    ('Arts Department', 'Arts', 'ARTS001', 4, 104),
    ('Commerce Department', 'Commerce', 'COM001', 3, 105);

select * from student_detail;
select * from faculty_detail;
select * from subject;

