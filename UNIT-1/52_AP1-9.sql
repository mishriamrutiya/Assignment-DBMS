SET SERVEROUTPUT ON;

DECLARE
    v_units NUMBER := 52 * 10 + 50;
    c_rate CONSTANT NUMBER := 5;
    c_fixed CONSTANT NUMBER := 70;
    v_energy NUMBER;
    v_total NUMBER;
BEGIN
    v_energy := v_units * c_rate;
    v_total := v_energy + c_fixed;

    DBMS_OUTPUT.PUT_LINE('Consumer Name: Mishri Amrutiya');
    DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || v_units);
    DBMS_OUTPUT.PUT_LINE('Energy Charge: Rs.' || v_energy);
    DBMS_OUTPUT.PUT_LINE('Fixed Charge: Rs.' || c_fixed);
    DBMS_OUTPUT.PUT_LINE('Total: Rs.' || v_total);
END;
/

-- OUTPUT:
-- Consumer Name: Mishri Amrutiya
-- Units Consumed: 570
-- Energy Charge: Rs.2850
-- Fixed Charge: Rs.70
-- Total: Rs.2920