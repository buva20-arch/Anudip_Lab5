Question:

Use the Student management system Database and table from our previous lab and write a sql query to achieve the below scenario. 

Assume you are managing a university database that tracks student enrollments in various courses. You have two tables, "Student" and "Enrollment". The goal is to retrieve information about each student's ID, first name, last name, and their enrollment details, including the enrollment ID and the associated course ID. 

Hint:Use inner join to retrieve data. Submission: Create an SQL script file containing your solutions for all tasks (queries). Name the file "lab_assignment1.sql" Provide comments above each query to indicate the query's purpose

Code & Output:

 -- Create Database
    CREATE DATABASE StudentManagement;

 -- Show Created Database 
    SHOW DATABASES;
        +--------------------+
        | Database           |
        +--------------------+
        | anp_d1381          |
        | information_schema |
        | mysql              |
        | performance_schema |
        | sakila             |
        | studentmanagement  |
        | sys                |
        | world              |
        +--------------------+   

 -- Use Created Database   
    USE StudentManagement;
    --Database changed--

-- Create Student Table 
    CREATE TABLE Student_Table (Student_id INT (20) Not Null PRIMARY KEY, First_name VARCHAR(50) Not Null, Last_name VARCHAR(50)Not Null);
    desc student_table;
        +------------+-------------+------+-----+---------+-------+
        | Field      | Type        | Null | Key | Default | Extra |
        +------------+-------------+------+-----+---------+-------+
        | Student_id | int         | NO   | PRI | NULL    |       |
        | First_name | varchar(50) | NO   |     | NULL    |       |
        | Last_name  | varchar(50) | NO   |     | NULL    |       |
        +------------+-------------+------+-----+---------+-------+

-- Insert Sample Data
    INSERT INTO Student_Table (student_id, First_name, Last_name) VALUES (123, 'Aarav', 'Sharma'),(124, 'Ananya', 'Patel'),(125, 'Rohan', 'Kumar'),(126, 'Isha', 'Singh'),(127, 'Dev', 'Reddy');
    
-- Create Enrollment Table
    CREATE TABLE Enrollment (enrollment_id INT Not Null PRIMARY KEY, student_id INT Not Null, course_id INT Not NUll, FOREIGN KEY (Student_id) REFERENCES Student_Table(Student_id));
    desc Enrollment;
        +---------------+------+------+-----+---------+-------+
        | Field         | Type | Null | Key | Default | Extra |
        +---------------+------+------+-----+---------+-------+
        | enrollment_id | int  | NO   | PRI | NULL    |       |
        | student_id    | int  | NO   | MUL | NULL    |       |
        | course_id     | int  | NO   |     | NULL    |       |
        +---------------+------+------+-----+---------+-------+

-- Insert Sample Data        
    INSERT INTO Enrollment (enrollment_id, student_id, course_id) VALUES (101, 123, 201), (102, 123, 202), (103, 124, 201), (104, 125, 203),  (105, 126, 202);

-- View All Data From Both Tables
    select * from student_Table;
        +---------------+------------+-----------+
        | enrollment_id | student_id | course_id |
        +---------------+------------+-----------+
        |           101 |        123 |       201 |
        |           102 |        123 |       202 |
        |           103 |        124 |       201 |
        |           104 |        125 |       203 |
        |           105 |        126 |       202 |
        +---------------+------------+-----------+
    
    select * from Enrollment;
        +---------------+------------+-----------+
        | enrollment_id | student_id | course_id |
        +---------------+------------+-----------+
        |           101 |        123 |       201 |
        |           102 |        123 |       202 |
        |           103 |        124 |       201 |
        |           104 |        125 |       203 |
        |           105 |        126 |       202 |
        +---------------+------------+-----------+

-- Query: Retrieve student_table details with enrollment info    
    SELECT s.student_id, s.first_name, s.last_name, e.enrollment_id, e.course_id FROM Student_Table s INNER JOIN Enrollment e ON s.student_id = e.student_id;
        +------------+------------+-----------+---------------+-----------+
        | student_id | first_name | last_name | enrollment_id | course_id |
        +------------+------------+-----------+---------------+-----------+
        |        123 | Aarav      | Sharma    |           101 |       201 |
        |        123 | Aarav      | Sharma    |           102 |       202 |
        |        124 | Ananya     | Patel     |           103 |       201 |
        |        125 | Rohan      | Kumar     |           104 |       203 |
        |        126 | Isha       | Singh     |           105 |       202 |
        +------------+------------+-----------+---------------+-----------+