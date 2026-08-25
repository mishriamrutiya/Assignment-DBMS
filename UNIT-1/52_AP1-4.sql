-- TABLE REQUIRED: EMPLOYEES

CREATE TABLE employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25),
    salary NUMBER(8,2),
    hire_date DATE,
    job_id VARCHAR2(10),
    department_id NUMBER(4)
);

INSERT INTO employees
VALUES (103, 'Alexander', 'Hunold', 9000,
        TO_DATE('03-JAN-2006','DD-MON-YYYY'),
        'IT_PROG', 60);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_fname employees.first_name%TYPE;
    v_sal employees.salary%TYPE;
    v_id employees.employee_id%TYPE := 103;
BEGIN
    SELECT first_name, salary
    INTO v_fname, v_sal
    FROM employees
    WHERE employee_id = v_id;

    DBMS_OUTPUT.PUT_LINE(
        'Employee: ' || v_fname ||
        ' earns Rs.' || v_sal || ' per month.'
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found - check the ID.');
END;
/

-- OUTPUT:
-- Employee: Alexander earns Rs.9000 per month.

-- FOR NON-EXISTENT ID, USE:
-- v_id employees.employee_id%TYPE := 52;

-- OUTPUT:
-- Employee not found - check the ID.