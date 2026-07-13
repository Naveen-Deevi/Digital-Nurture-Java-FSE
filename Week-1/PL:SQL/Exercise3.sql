-- Scenario 1: Process monthly interest for all savings accounts

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Monthly interest processed');
END;
/

-- Scenario 2: Update employee salary with bonus

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    deptName IN VARCHAR2,
    bonusPercent IN NUMBER
)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE Department = deptName;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee bonus updated');
END;
/

-- Scenario 3: Transfer funds between accounts

CREATE OR REPLACE PROCEDURE TransferFunds(
    fromAcc IN NUMBER,
    toAcc IN NUMBER,
    amount IN NUMBER
)
AS
    bal NUMBER;
BEGIN
    SELECT Balance
    INTO bal
    FROM Accounts
    WHERE AccountID = fromAcc;

    IF bal >= amount THEN
        UPDATE Accounts
        SET Balance = Balance - amount
        WHERE AccountID = fromAcc;

        UPDATE Accounts
        SET Balance = Balance + amount
        WHERE AccountID = toAcc;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transfer Successful');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
    END IF;
END;
/