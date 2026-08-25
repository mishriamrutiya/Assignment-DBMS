-- TABLE REQUIRED: EMPLOYEES

SET SERVEROUTPUT ON;

DECLARE
    v_dept NUMBER := (52 MOD 6 + 1) * 10;
    v_cnt NUMBER;
    v_avg NUMBER;
    v_max NUMBER;
BEGIN
    SELECT COUNT(*),
           ROUND(AVG(salary), 2),
           MAX(salary)
    INTO v_cnt, v_avg, v_max
    FROM employees
    WHERE department_id = v_dept;

    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_dept);
    DBMS_OUTPUT.PUT_LINE('Employee Count: ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('Average Salary: Rs.' || NVL(v_avg, 0));
    DBMS_OUTPUT.PUT_LINE('Maximum Salary: Rs.' || NVL(v_max, 0));
END;
/

-- OUTPUT:
-- Department ID: 30
-- Employee Count: 6
-- Average Salary: Rs.4150
-- Maximum Salary: Rs.11000
