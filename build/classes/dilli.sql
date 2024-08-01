CREATE DATABASE BankingDB;

USE BankingDB;

CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    mobile_no VARCHAR(15),
    email_id VARCHAR(100),
    account_type ENUM('Saving', 'Current'),
    initial_balance DECIMAL(10, 2) NOT NULL,
    date_of_birth DATE,
    id_proof VARCHAR(100),
    account_no VARCHAR(50) UNIQUE,
    temporary_password VARCHAR(255)
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_no VARCHAR(50),
    transaction_type ENUM('Deposit', 'Withdraw'),
    amount DECIMAL(10, 2),
    transaction_date DATETIME,
    FOREIGN KEY (account_no) REFERENCES customers(account_no)
);