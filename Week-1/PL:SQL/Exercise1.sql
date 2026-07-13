-- Scenario 1: Apply 1% discount to loan interest rate for customers above 60

BEGIN
    FOR c IN (SELECT CustomerID, Age FROM Customers) LOOP
        IF c.Age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = c.CustomerID;
        END IF;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Interest rates updated');
END;
/

-- Scenario 2: Set VIP status for customers with balance greater than 10000

BEGIN
    FOR c IN (SELECT CustomerID, Balance FROM Customers) LOOP
        IF c.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = c.CustomerID;
        END IF;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('VIP status updated');
END;
/

-- Scenario 3: Print reminders for loans due within the next 30 days

BEGIN
    FOR l IN (
        SELECT c.Name, lo.DueDate
        FROM Customers c
        JOIN Loans lo
        ON c.CustomerID = lo.CustomerID
        WHERE lo.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: ' || l.Name ||
                             ' loan is due on ' || l.DueDate);
    END LOOP;
END;
/