SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50) := 'Mishri Amrutiya';
    v_marks      NUMBER(5,2) := 420;
    v_percentage NUMBER(5,2);
    v_dob        DATE;
    v_passed     BOOLEAN;
BEGIN
    v_percentage := ROUND((v_marks / 500) * 100, 2);
    v_dob := SYSDATE;

    IF v_percentage >= 40 THEN
        v_passed := TRUE;
    ELSE
        v_passed := FALSE;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || TO_CHAR(v_dob, 'DD-MM-YYYY'));

    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/

-- OUTPUT:
-- Name: Mishri Amrutiya
-- Marks: 420
-- Percentage: 84%
-- Today's Date: 25-08-2026
-- Result: PASS