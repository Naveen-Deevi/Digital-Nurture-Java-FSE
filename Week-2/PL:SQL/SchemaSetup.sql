-- SCHEMA SETUP

CREATE TABLE Customers (

    CustomerID NUMBER PRIMARY KEY,

    Name VARCHAR2(50),

    Age NUMBER,

    Balance NUMBER,

    IsVIP VARCHAR2(10)

);

CREATE TABLE Accounts (

    AccountID NUMBER PRIMARY KEY,

    CustomerID NUMBER,

    AccountType VARCHAR2(20),

    Balance NUMBER,

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

);

CREATE TABLE Loans (

    LoanID NUMBER PRIMARY KEY,

    CustomerID NUMBER,

    InterestRate NUMBER,

    DueDate DATE,

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

);

CREATE TABLE Employees (

    EmployeeID NUMBER PRIMARY KEY,

    Name VARCHAR2(50),

    Department VARCHAR2(30),

    Salary NUMBER

);


-- SAMPLE DATA


INSERT INTO Customers VALUES (1, 'Rahul', 65, 15000, 'FALSE');

INSERT INTO Customers VALUES (2, 'Priya', 45, 8000, 'FALSE');

INSERT INTO Customers VALUES (3, 'Amit', 70, 12000, 'FALSE');

INSERT INTO Accounts VALUES (101, 1, 'Savings', 20000);

INSERT INTO Accounts VALUES (102, 2, 'Savings', 15000);

INSERT INTO Accounts VALUES (103, 3, 'Current', 10000);

INSERT INTO Loans VALUES (201, 1, 8.5, SYSDATE + 20);

INSERT INTO Loans VALUES (202, 2, 9.0, SYSDATE + 45);

INSERT INTO Loans VALUES (203, 3, 7.5, SYSDATE + 10);

INSERT INTO Employees VALUES (1, 'John', 'HR', 50000);

INSERT INTO Employees VALUES (2, 'Sara', 'IT', 60000);

INSERT INTO Employees VALUES (3, 'David', 'HR', 55000);

COMMIT;