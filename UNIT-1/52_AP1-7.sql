SET SERVEROUTPUT ON;

<<outer>>
DECLARE
    v_city VARCHAR2(30) := 'Gujarat';
    v_num NUMBER := 100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Outer: City = ' || v_city);
    DBMS_OUTPUT.PUT_LINE('Outer: Number = ' || v_num);

    <<middle>>
    DECLARE
        v_city VARCHAR2(30) := 'Ahmedabad';
        v_num NUMBER := 200;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Middle: City = ' || v_city);
        DBMS_OUTPUT.PUT_LINE('Middle: Number = ' || v_num);
        DBMS_OUTPUT.PUT_LINE('Outer City = ' || outer.v_city);

        DECLARE
            v_num NUMBER := 300;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Inner: City = ' || v_city);
            DBMS_OUTPUT.PUT_LINE('Inner: Number = ' || v_num);
            DBMS_OUTPUT.PUT_LINE('Outer City = ' || outer.v_city);
        END;
    END;

    DBMS_OUTPUT.PUT_LINE('After Middle: City = ' || v_city);
    DBMS_OUTPUT.PUT_LINE('After Middle: Number = ' || v_num);
END;
/

-- OUTPUT:
-- Outer: City = Gujarat
-- Outer: Number = 100
-- Middle: City = Ahmedabad
-- Middle: Number = 200
-- Outer City = Gujarat
-- Inner: City = Ahmedabad
-- Inner: Number = 300
-- Outer City = Gujarat
-- After Middle: City = Gujarat
-- After Middle: Number = 100