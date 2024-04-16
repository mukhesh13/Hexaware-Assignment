
--TASK 4

--1
SELECT AVG(enrollment_count) AS average_students_per_course
FROM (
    SELECT COUNT(*) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
) AS course_enrollment_counts;

--2
SELECT s.student_id, s.first_name, s.last_name, p.amount AS highest_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (
    SELECT MAX(amount)
    FROM Payments
);

--3
SELECT course_id, course_name, enrollment_count
FROM (
    SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrollment_count
    FROM Courses c
    LEFT JOIN Enrollments e ON c.course_id = e.course_id
    GROUP BY c.course_id, c.course_name
) AS course_enrollment_counts
WHERE enrollment_count = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT COUNT(student_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS max_enrollment
);

--4
SELECT teacher_id, SUM(amount) AS TotalPayments
FROM Payments
JOIN Enrollments ON Payments.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id
GROUP BY teacher_id;

--5
SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(*) FROM Courses);

--6
SELECT 
    first_name, 
    last_name
FROM 
    Teacher
WHERE 
    teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);
--7
SELECT 
    AVG(age) AS average_age
FROM 
    (SELECT 
        DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
FROM 
        Students) AS student_ages;

--8
SELECT 
    course_id, 
    course_name
FROM 
    Courses
WHERE 
    course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

--9
SELECT 
    e.student_id,
    e.course_id,
    SUM(p.amount) AS total_payments
FROM 
    Enrollments e
JOIN 
    Payments p ON e.student_id = p.student_id
GROUP BY 
    e.student_id, e.course_id;

--10
SELECT 
    student_id,
    COUNT(*) AS payment_count
FROM 
    Payments
GROUP BY 
    student_id
HAVING 
    COUNT(*) >1;

--11
SELECT student_id, SUM(amount) AS TotalPayments
FROM Payments
GROUP BY student_id;

--12
SELECT Courses.course_name, COUNT(Enrollments.student_id) AS EnrollmentCount
FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY Courses.course_name;

--13
SELECT AVG(amount) AS AveragePaymentAmount
FROM Payments;
