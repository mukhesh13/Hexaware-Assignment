
--5

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(1, 'Arjun', 'Kumar', '1999-05-15', 'arjun.kumar@example.com', '9876543210'),
(2, 'Priya', 'Raj', '2000-02-28', 'priya.raj@example.com', '9876543211'),
(3, 'Manoj', 'Sundaram', '1998-09-10', 'manoj.sundaram@example.com', '9876543212'),
(4, 'Kavitha', 'Srinivasan', '1997-12-03', 'kavitha.srinivasan@example.com', '9876543213'),
(5, 'Rajesh', 'Kumar', '1996-07-20', 'rajesh.kumar@example.com', '9876543214'),
(6, 'Saranya', 'Venkat', '2001-10-18', 'saranya.venkat@example.com', '9876543215'),
(7, 'Vijay', 'Balaji', '1995-03-08', 'vijay.balaji@example.com', '9876543216'),
(8, 'Divya', 'Krishnan', '1994-11-25', 'divya.krishnan@example.com', '9876543217'),
(9, 'Anand', 'Rajaram', '2002-06-12', 'anand.rajaram@example.com', '9876543218'),
(10, 'Shalini', 'Natarajan', '1993-08-29', 'shalini.natarajan@example.com', '9876543219');


INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
(1, 'Senthil', 'Kumar', 'senthil.kumar@example.com'),
(2, 'Deepa', 'Raj', 'deepa.raj@example.com'),
(3, 'Rajesh', 'Gopal', 'rajesh.gopal@example.com'),
(4, 'Anusha', 'Sundaram', 'anusha.sundaram@example.com'),
(5, 'Kumar', 'Venkat', 'kumar.venkat@example.com');

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
(101, 'Mathematics', 3, 1),
(102, 'Physics', 4, 2),
(103, 'Chemistry', 3, 3),
(104, 'Biology', 3, 4),
(105, 'Computer Science', 4, 5),
(106, 'History', 3, 1),
(107, 'Literature', 3, 2),
(108, 'Economics', 4, 3),
(109, 'Political Science', 3, 4),
(110, 'Geography', 3, 5);


INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(201, 1, 101, '2024-01-10'),
(202, 2, 102, '2024-01-12'),
(203, 3, 103, '2024-01-15'),
(204, 4, 104, '2024-01-20'),
(205, 5, 105, '2024-01-25'),
(206, 6, 106, '2024-02-01'),
(207, 7, 107, '2024-02-05'),
(208, 8, 108, '2024-02-10'),
(209, 9, 109, '2024-02-15'),
(210, 10, 110, '2024-02-20');


INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
(301, 1, 5000.00, '2024-03-05'),
(302, 2, 5500.00, '2024-03-08'),
(303, 3, 6000.00, '2024-03-10'),
(304, 4, 6500.00, '2024-03-15'),
(305, 5, 7000.00, '2024-03-18'),
(306, 6, 4500.00, '2024-03-20'),
(307, 7, 5000.00, '2024-03-25'),
(308, 8, 5500.00, '2024-03-28'),
(309, 9, 6000.00, '2024-04-01'),
(310, 10, 6500.00, '2024-04-05');

--TASK 2

--1
insert into Students values(11,'John','Doe','1995-08-15','john.doe@example.com','1234567890')

--2
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
     (211, 11, 111, '2024-03-21');

--3
UPDATE Teacher
SET email = 'new_email@example.com' 
WHERE teacher_id = 1; 

--4
DELETE FROM Enrollments
WHERE student_id = 1 
AND course_id = 101; 

--5
UPDATE Courses
SET teacher_id = 1 
WHERE course_id = 101; 

--6
DECLARE @student_id INT = 1; -- Replace 1 with the student_id of the specific student you want to delete

-- First, delete the student's enrollment records
DELETE FROM Enrollments
WHERE student_id = @student_id;

-- Then, delete the student
DELETE FROM Students
WHERE student_id = @student_id;

--7
UPDATE Payments
SET amount = 1500.00 
WHERE payment_id = 302; 

SELECT * FROM Students;
SELECT * FROM Teacher; 
SELECT * FROM Courses; 
SELECT * FROM Enrollments;
SELECT * FROM Payments;
