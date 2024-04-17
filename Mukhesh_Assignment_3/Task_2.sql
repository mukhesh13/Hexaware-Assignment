
--task 2

--1
INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(1, 'Rajesh', 'Kumar', '1990-05-15', 'rajesh@example.com', '9876543210', 'Chennai, Tamil Nadu'),
(2, 'Priya', 'Sundar', '1985-08-20', 'priya@example.com', '9876543211', 'Coimbatore, Tamil Nadu'),
(3, 'Senthil', 'Raj', '1982-12-10', 'senthil@example.com', '9876543212', 'Madurai, Tamil Nadu'),
(4, 'Deepika', 'Venkat', '1993-03-25', 'deepika@example.com', '9876543213', 'Trichy, Tamil Nadu'),
(5, 'Karthik', 'Ravi', '1978-07-05', 'karthik@example.com', '9876543214', 'Salem, Tamil Nadu'),
(6, 'Meena', 'Krishnan', '1989-09-12', 'meena@example.com', '9876543215', 'Tirunelveli, Tamil Nadu'),
(7, 'Ganesh', 'Subramanian', '1995-11-30', 'ganesh@example.com', '9876543216', 'Thanjavur, Tamil Nadu'),
(8, 'Saranya', 'Senthil', '1980-04-18', 'saranya@example.com', '9876543217', 'Erode, Tamil Nadu'),
(9, 'Aravind', 'Balaji', '1991-02-08', 'aravind@example.com', '9876543218', 'Vellore, Tamil Nadu'),
(10, 'Divya', 'Anand', '1987-06-22', 'divya@example.com', '9876543219', 'Kanyakumari, Tamil Nadu');

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(101, 1, 'Savings', 50000),
(102, 2, 'Current', 100000),
(103, 3, 'Savings', 75000),
(104, 4, 'Current', 60000),
(105, 5, 'Savings', 85000),
(106, 6, 'Current', 70000),
(107, 7, 'Savings', 90000),
(108, 8, 'Current', 80000),
(109, 9, 'Savings', 95000),
(110, 10, 'Current', 120000);

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(1001, 101, 'Deposit', 10000, '2024-04-15'),
(1002, 102, 'Withdrawal', 5000, '2024-04-15'),
(1003, 103, 'Deposit', 15000, '2024-04-15'),
(1004, 104, 'Withdrawal', 10000, '2024-04-15'),
(1005, 105, 'Deposit', 20000, '2024-04-15'),
(1006, 106, 'Withdrawal', 7000, '2024-04-15'),
(1007, 107, 'Deposit', 25000, '2024-04-15'),
(1008, 108, 'Withdrawal', 12000, '2024-04-15'),
(1009, 109, 'Deposit', 30000, '2024-04-15'),
(1010, 110, 'Withdrawal', 15000, '2024-04-15');

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;

--2
--1
SELECT c.first_name, c.last_name, a.account_type, c.email
FROM Customers c
INNER JOIN Accounts a ON c.customer_id = a.customer_id;

--2
SELECT c.first_name, c.last_name, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM Customers c
INNER JOIN Accounts a ON c.customer_id = a.customer_id
INNER JOIN Transactions t ON a.account_id = t.account_id;

--3
UPDATE Accounts
SET balance = balance + 45
WHERE account_id = 5;

--4
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Customers;

--5
DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'Savings';

--6
SELECT *
FROM Customers
WHERE address LIKE '%Chennai%';

--7
SELECT balance
FROM Accounts
WHERE account_id = 101;

--8
SELECT *
FROM Accounts
WHERE account_type = 'Current' AND balance > 1000.00;

--9
SELECT t.*
FROM Transactions t
INNER JOIN Accounts a ON t.account_id = a.account_id
WHERE a.account_id = 101;

--10
SELECT account_id, balance * 0.01 AS interest_accrued
FROM Accounts
WHERE account_type = 'Savings';

--11
SELECT *
FROM Accounts
WHERE balance < 1000;

--12
SELECT *
FROM Customers
WHERE address NOT LIKE '%Chennai%';

