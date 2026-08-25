SET SERVEROUTPUT ON;

DECLARE
    v_p NUMBER := 52 * 10000 + 50000;
    v_annual_rate NUMBER := 9;
    v_years NUMBER := 5;
    v_r NUMBER;
    v_n NUMBER;
    v_emi NUMBER;
    v_total NUMBER;
    v_interest NUMBER;
    v_interest_pct NUMBER;
BEGIN
    v_r := v_annual_rate / 12 / 100;
    v_n := v_years * 12;

    v_emi := ROUND(
        v_p * v_r * POWER(1 + v_r, v_n) /
        (POWER(1 + v_r, v_n) - 1), 2
    );

    v_total := v_emi * v_n;
    v_interest := v_total - v_p;
    v_interest_pct := v_interest / v_total * 100;

    DBMS_OUTPUT.PUT_LINE(
        'Principal: Rs.' || TO_CHAR(v_p, '9,99,999')
    );
    DBMS_OUTPUT.PUT_LINE('Annual Rate: ' || v_annual_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Loan Period: ' || v_years || ' years');
    DBMS_OUTPUT.PUT_LINE(
        'Monthly EMI: Rs.' || TO_CHAR(v_emi, '99,999.00')
    );
    DBMS_OUTPUT.PUT_LINE(
        'Total Payment: Rs.' || TO_CHAR(v_total, '99,99,999.00')
    );
    DBMS_OUTPUT.PUT_LINE(
        'Total Interest: Rs.' || TO_CHAR(v_interest, '99,99,999.00')
    );
    DBMS_OUTPUT.PUT_LINE(
        'Interest Percentage: ' ||
        TO_CHAR(ROUND(v_interest_pct, 2), '99.99') || '%'
    );
END;
/

-- OUTPUT:
-- Principal: Rs.5,70,000
-- Annual Rate: 9%
-- Loan Period: 5 years
-- Monthly EMI: Rs.11,832.26
-- Total Payment: Rs.7,09,935.60
-- Total Interest: Rs.1,39,935.60
-- Interest Percentage: 19.71%