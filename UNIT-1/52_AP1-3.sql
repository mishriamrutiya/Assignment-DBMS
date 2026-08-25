SET SERVEROUTPUT ON;

DECLARE
    c_gst_rate CONSTANT NUMBER := 18;
    v_base_price NUMBER := 52 * 500 + 1000;
    v_cgst NUMBER;
    v_sgst NUMBER;
    v_total NUMBER;
    v_city VARCHAR2(50) := NULL;
BEGIN
    v_cgst := v_base_price * 9 / 100;
    v_sgst := v_base_price * 9 / 100;
    v_total := v_base_price + v_cgst + v_sgst;

    DBMS_OUTPUT.PUT_LINE('Base Price: Rs.' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('CGST (9%): Rs.' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST (9%): Rs.' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('Total: Rs.' || v_total);

    DBMS_OUTPUT.PUT_LINE('NVL Result: ' || NVL(v_city, 'Ahmedabad'));

    IF v_city IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('NVL2 Result: City Unknown');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NVL2 Result: City Known: ' || v_city);
    END IF;
END;
/

-- OUTPUT:
-- Base Price: Rs.27000
-- CGST (9%): Rs.2430
-- SGST (9%): Rs.2430
-- Total: Rs.31860
-- NVL Result: Ahmedabad
-- NVL2 Result: City Unknown