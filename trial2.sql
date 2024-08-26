-- Creating the function dc
CREATE OR REPLACE FUNCTION dc(account_balance NUMBER)
RETURN VARCHAR2 IS
    customer_category VARCHAR2(10);
BEGIN
    IF account_balance > 50000 THEN
        customer_category := 'Platinum';
    ELSIF account_balance > 10000 THEN
        customer_category := 'Gold';
    ELSE
        customer_category := 'Silver';
    END IF;
    RETURN customer_category;
END;
/

-- Query to retrieve customer details along with their category using the dc function
BEGIN
    FOR customer_rec IN (SELECT customer_id, customer_name, account_balance, dc(account_balance) AS category
                         FROM customers)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || customer_rec.customer_id || 
                             ', Name: ' || customer_rec.customer_name || 
                             ', Balance: ' || customer_rec.account_balance || 
                             ', Category: ' || customer_rec.category);
    END LOOP;
END;
/
