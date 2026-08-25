SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(100) := 'Mishri Amrutiya';
    v_roll NUMBER := 52;
    v_dob DATE := TO_DATE('15-MAR-2004', 'DD-MON-YYYY');

    v_upper VARCHAR2(100);
    v_first VARCHAR2(50);
    v_id VARCHAR2(30);
    v_age NUMBER;
BEGIN
    v_upper := UPPER(v_name);

    v_first := SUBSTR(
        v_name, 1, INSTR(v_name, ' ') - 1
    );

    v_id := 'LJICA' ||
            TO_CHAR(v_dob, 'YYYY') ||
            LPAD(v_roll, 3, '0');

    v_age := TRUNC(
        MONTHS_BETWEEN(SYSDATE, v_dob) / 12
    );

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_upper);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || v_first);
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_id);
    DBMS_OUTPUT.PUT_LINE(
        'Date of Birth: ' ||
        TO_CHAR(v_dob, 'DD-MON-YYYY')
    );
    DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
END;
/

-- OUTPUT:
-- Name: MISHRI AMRUTIYA
-- First Name: Mishri
-- Roll No: 52
-- Student ID: LJICA2004052
-- Date of Birth: 15-MAR-2004
-- Age: 22