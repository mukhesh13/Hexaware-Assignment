
--task 4
--1
SELECT customer_id, first_name, last_name, email
FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Accounts WHERE balance = (SELECT MAX(balance) FROM Accounts));

--2
SELECT 
    AVG(balance) AS average_balance
FROM 
    Accounts
WHERE 
    customer_id IN (
        SELECT 
            customer_id
        FROM 
            Accounts
        GROUP BY 
            customer_id
        HAVING 
            COUNT(*) > 1
    );

--3
SELECT DISTINCT
    a.account_id,
    a.account_type
FROM 
    Accounts a
INNER JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.amount > (
        SELECT 
            AVG(amount)
        FROM 
            Transactions
    );
--4
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    phone_number,
    address
FROM 
    Customers
WHERE 
    customer_id NOT IN (
        SELECT 
            DISTINCT customer_id
        FROM 
            Transactions
    );
--5
SELECT 
    SUM(balance) AS total_balance
FROM 
    Accounts
WHERE 
    account_id NOT IN (
        SELECT 
            DISTINCT account_id
        FROM 
            Transactions
    );
--6
SELECT 
    *
FROM 
    Transactions
WHERE 
    account_id IN (
        SELECT 
            account_id
        FROM 
            Accounts
        WHERE 
            balance = (
                SELECT 
                    MIN(balance)
                FROM 
                    Accounts
            )
    );
--7
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    phone_number,
    address
FROM 
    Customers
WHERE 
    customer_id IN (
        SELECT 
            customer_id
        FROM 
            Accounts
        GROUP BY 
            customer_id
        HAVING 
            COUNT(DISTINCT account_type) > 1
    );
--8
SELECT 
    account_type,
    COUNT(*) AS num_accounts,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Accounts), 2) AS percentage
FROM 
    Accounts
GROUP BY 
    account_type;

--10
SELECT 
    account_type,
    (SELECT SUM(balance) FROM Accounts a WHERE a.account_type = at.account_type) AS total_balance
FROM 
    (SELECT DISTINCT account_type FROM Accounts) AS at;
