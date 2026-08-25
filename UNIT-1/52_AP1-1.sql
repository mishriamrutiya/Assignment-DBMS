SET SERVEROUTPUT ON;

DECLARE
    v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
    roll_no NUMBER := 52;
    v_lucky NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Name: Mishri Amrutiya');
    DBMS_OUTPUT.PUT_LINE('Roll Number: ' || roll_no);
    DBMS_OUTPUT.PUT_LINE(v_message);

    v_lucky := MOD(roll_no, 7) + 1;
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky);
END;
/

-- OUTPUT:
-- Name: Mishri Amrutiya
-- Roll Number: 52
-- Welcome to PL/SQL!
-- Lucky Number: 4