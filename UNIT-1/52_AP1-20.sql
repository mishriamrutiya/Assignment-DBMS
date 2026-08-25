SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(100) := 'Mishri Amrutiya';
    v_dob DATE := TO_DATE('15-MAR-2004', 'DD-MON-YYYY');
    v_roll NUMBER := 52;

    v_pnr VARCHAR2(30);
    v_jdate DATE;
    v_fare NUMBER;
    v_age NUMBER;
    v_final_fare NUMBER;
BEGIN
    v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') ||
             LPAD(v_roll, 4, '0');

    v_jdate := SYSDATE + (MOD(v_roll, 30) + 1);

    v_fare := v_roll * 50 + 200;

    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    IF v_age >= 60 THEN
        v_final_fare := v_fare * 0.60;
    ELSE
        v_final_fare := v_fare;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Passenger: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('PNR: ' || v_pnr);
    DBMS_OUTPUT.PUT_LINE(
        'Journey Date: ' ||
        TO_CHAR(v_jdate, 'Day, DD-MON-YYYY')
    );
    DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
    DBMS_OUTPUT.PUT_LINE('Base Fare: Rs.' || v_fare);
    DBMS_OUTPUT.PUT_LINE('Final Fare: Rs.' || v_final_fare);
END;
/

-- OUTPUT:
-- Passenger: Mishri Amrutiya
-- PNR: GJ260852
-- Journey Date: Monday, 28-AUG-2026
-- Age: 22
-- Base Fare: Rs.2800
-- Final Fare: Rs.2800

-- SENIOR CITIZEN TEST:
-- Change v_dob to:
-- TO_DATE('01-JAN-1960', 'DD-MON-YYYY')
--
-- OUTPUT:
-- Age: 66
-- Base Fare: Rs.2800
-- Final Fare: Rs.1680