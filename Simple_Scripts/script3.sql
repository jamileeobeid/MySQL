-- CREATING THE DATABASE
CREATE DATABASE BankDB;
USE BankDB;

-- CREATING A TABLE FOR CUSTOMERS
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);

-- CREATING A TABLE FOR ACCOUNTS
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    account_type ENUM('Checking', 'Savings', 'Credit') NOT NULL,
    balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- CREATING A TABLE FOR TRANSACTIONS
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
);

-- INSERTING SAMPLE DATA INTO CUSTOMERS
INSERT INTO Customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Emma', 'Smith', 'emma.smith@example.com', '987-654-3210');

-- INSERTING SAMPLE DATA INTO ACCOUNTS
INSERT INTO Accounts (customer_id, account_type, balance) VALUES
(1, 'Checking', 2500.00),
(1, 'Savings', 5000.00),
(2, 'Checking', 1200.00);

-- INSERTING SAMPLE DATA INTO TRANSACTIONS
INSERT INTO Transactions (account_id, transaction_type, amount) VALUES
(1, 'Deposit', 500.00),
(1, 'Withdrawal', 200.00),
(2, 'Deposit', 1000.00),
(3, 'Withdrawal', 300.00),
(3, 'Transfer', 500.00);

-- RETRIEVING ALL CUSTOMERS AND THEIR ACCOUNTS
SELECT 
    Customers.first_name, 
    Customers.last_name, 
    Accounts.account_type, 
    Accounts.balance
FROM Accounts
JOIN Customers ON Accounts.customer_id = Customers.customer_id;

-- RETRIEVING TRANSACTIONS FOR A SPECIFIC CUSTOMER (JOHN DOE)
SELECT 
    Transactions.transaction_id, 
    Transactions.transaction_type, 
    Transactions.amount, 
    Transactions.transaction_date,
    Accounts.account_type
FROM Transactions
JOIN Accounts ON Transactions.account_id = Accounts.account_id
JOIN Customers ON Accounts.customer_id = Customers.customer_id
WHERE Customers.first_name = 'John' AND Customers.last_name = 'Doe';

-- RETRIEVING TOTAL BALANCE FOR EACH CUSTOMER
SELECT 
    Customers.first_name, 
    Customers.last_name, 
    SUM(Accounts.balance) AS total_balance
FROM Accounts
JOIN Customers ON Accounts.customer_id = Customers.customer_id
GROUP BY Customers.customer_id;
