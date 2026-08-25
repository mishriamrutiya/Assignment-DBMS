
SET SERVEROUTPUT ON;

DECLARE
    -- BUG 1: '=' is incorrect; PL/SQL assignment uses ':='
    -- BUG 2: VARCHAR2(5) is too small for the full name
    v_name VARCHAR2(50) := 'Mishri Amrutiya';

    -- BUG 3: CONSTANT must be initialized during declaration
    c_bonus_rate CONSTANT NUMBER := 0.1;

    v_sal NUMBER := 52 * 1000 + 20000;       -- Salary = 72,000
    v_bonus NUMBER;
    v_fname employees.first_name%TYPE;
BEGIN
    v_bonus := v_sal * c_bonus_rate;          -- Bonus = 10% of salary

    -- BUG 4: Declaration must end with a semicolon
    -- Fixed above: v_sal declaration ends with ';'

    -- BUG 5: SELECT statement in PL/SQL requires INTO
    SELECT first_name
    INTO v_fname
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: Rs.' || TO_CHAR(v_sal, '99,999'));
    DBMS_OUTPUT.PUT_LINE('Bonus: Rs.' || TO_CHAR(v_bonus, '99,999'));
    DBMS_OUTPUT.PUT_LINE('Employee First Name: ' || v_fname);
END;
/

-- OUTPUT:
-- Name: Mishri Amrutiya
-- Salary: Rs.72,000
-- Bonus: Rs. 7,200
-- Employee First Name: [First Name of Employee 100]