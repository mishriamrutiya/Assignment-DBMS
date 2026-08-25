SET SERVEROUTPUT ON;

DECLARE
    v_celsius NUMBER := MOD(52, 20) + 25;
    v_f NUMBER;
    v_k NUMBER;
    v_f2 NUMBER := 98.6;
    v_c2 NUMBER;
BEGIN
    v_f := ROUND(v_celsius * 9 / 5 + 32, 1);
    v_k := v_celsius + 273.15;

    v_c2 := (v_f2 - 32) * 5 / 9;

    DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_celsius || ' C');
    DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || v_f || ' F');
    DBMS_OUTPUT.PUT_LINE('Kelvin: ' || v_k || ' K');

    DBMS_OUTPUT.PUT_LINE('Fahrenheit Input: ' || v_f2 || ' F');
    DBMS_OUTPUT.PUT_LINE('Converted Celsius: ' || ROUND(v_c2, 1) || ' C');

    DBMS_OUTPUT.PUT_LINE(
        'C*9/5+32 and C*(9/5)+32 give the same result.'
    );
END;
/

-- OUTPUT:
-- Celsius: 37 C
-- Fahrenheit: 98.6 F
-- Kelvin: 310.15 K
-- Fahrenheit Input: 98.6 F
-- Converted Celsius: 37 C
-- C*9/5+32 and C*(9/5)+32 give the same result.