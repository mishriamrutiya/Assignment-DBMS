SET SERVEROUTPUT ON;

DECLARE
    v_p NUMBER := 52000;
    v_r NUMBER := 7;
    v_t NUMBER := 3;
    v_si NUMBER;
    v_ci NUMBER;
    v_diff_pct NUMBER;
BEGIN
    v_si := v_p * v_r * v_t / 100;
    v_ci := v_p * POWER(1 + v_r / 100, v_t) - v_p;

    v_diff_pct := (v_ci - v_si) / v_si * 100;

    DBMS_OUTPUT.PUT_LINE(
        'Principal: Rs.' || TO_CHAR(v_p, '99,999')
    );
    DBMS_OUTPUT.PUT_LINE('Rate: ' || v_r || '%');
    DBMS_OUTPUT.PUT_LINE('Years: ' || v_t);
    DBMS_OUTPUT.PUT_LINE(
        'Simple Interest: Rs.' || TO_CHAR(v_si, '99,999.00')
    );
    DBMS_OUTPUT.PUT_LINE(
        'Compound Interest: Rs.' || TO_CHAR(v_ci, '99,999.00')
    );
    DBMS_OUTPUT.PUT_LINE(
        'SI vs CI Difference: ' ||
        TO_CHAR(v_diff_pct, '99.99') || '%'
    );

    IF v_diff_pct > 10 THEN
        DBMS_OUTPUT.PUT_LINE(
            'Tip: FD is better than savings account for this amount.'
        );
    END IF;
END;
/

-- OUTPUT:
-- Principal: Rs. 52,000
-- Rate: 7%
-- Years: 3
-- Simple Interest: Rs. 10,920.00
-- Compound Interest: Rs. 11,697.16
-- SI vs CI Difference: 7.12%