-- TABLE REQUIRED: EMPLOYEES
-- employee_id = 100 + MOD(52,20) = 112

SET SERVEROUTPUT ON;

DECLARE
    v_emp employees%ROWTYPE;
    v_id NUMBER := 112;

    v_da NUMBER;
    v_hra NUMBER;
    v_pf NUMBER;
    v_net NUMBER;
BEGIN
    SELECT *
    INTO v_emp
    FROM employees
    WHERE employee_id = v_id;

    v_da := v_emp.salary * 0.40;
    v_hra := v_emp.salary * 0.20;
    v_pf := v_emp.salary * 0.12;
    v_net := v_emp.salary + v_da + v_hra - v_pf;

    DBMS_OUTPUT.PUT_LINE('LJ BANK');
    DBMS_OUTPUT.PUT_LINE(
        'Salary Slip - ' || TO_CHAR(SYSDATE, 'Month YYYY')
    );
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE(
        'Employee Name: ' ||
        v_emp.first_name || ' ' || v_emp.last_name
    );
    DBMS_OUTPUT.PUT_LINE('Job: ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Basic Salary', 20) ||
        LPAD(TO_CHAR(v_emp.salary, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('DA (40%)', 20) ||
        LPAD(TO_CHAR(v_da, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('HRA (20%)', 20) ||
        LPAD(TO_CHAR(v_hra, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('PF (12%)', 20) ||
        LPAD(TO_CHAR(v_pf, '99,99,999.99'), 15)
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Net Pay', 20) ||
        LPAD(TO_CHAR(v_net, '99,99,999.99'), 15)
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/

-- OUTPUT:
-- LJ BANK
-- Salary Slip - August  2026
-- Employee ID: 112
-- Employee Name: Jose Manuel Urman
-- Job: FI_ACCOUNT
-- ------------------------------
-- Basic Salary              7,800.00
-- DA (40%)                  3,120.00
-- HRA (20%)                 1,560.00
-- PF (12%)                    936.00
-- ------------------------------
-- Net Pay                  11,544.00