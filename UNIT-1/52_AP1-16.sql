-- TABLE REQUIRED: DEPARTMENTS

SET SERVEROUTPUT ON;

DECLARE
    v_id NUMBER := ((52 + 2) MOD 11 + 1) * 10;
    v_dname departments.department_name%TYPE;
    v_loc departments.location_id%TYPE;
BEGIN
    SELECT department_name, location_id
    INTO v_dname, v_loc
    FROM departments
    WHERE department_id = v_id;

    DBMS_OUTPUT.PUT_LINE(
        'Dept ' || v_id || ': ' || v_dname || ' at location ' || v_loc
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department not found - check the ID.');
END;
/

-- OUTPUT:
-- Dept 110: Accounting at location 1700

