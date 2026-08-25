SET SERVEROUTPUT ON;

DECLARE
    v_qty     NUMBER := MOD(52, 5) + 2;       -- Roll No. 52 => Qty = 4
    v_price   NUMBER := 52 * 100 + 400;       -- Roll No. 52 => Price = 5600

    v_coupon  NUMBER := NULL;                 -- NULL means no coupon
    v_gross   NUMBER;
    v_disc    NUMBER;
    v_taxable NUMBER;
    v_cgst    NUMBER;
    v_sgst    NUMBER;
    v_total   NUMBER;
BEGIN
    v_gross := v_qty * v_price;               -- Gross = Qty × Price

    v_disc := v_gross * NVL(v_coupon, 0) / 100; -- NVL converts NULL coupon to 0%

    v_taxable := v_gross - v_disc;            -- Taxable amount after discount

    v_cgst := v_taxable * 9 / 100;             -- CGST = 9%
    v_sgst := v_taxable * 9 / 100;             -- SGST = 9%

    v_total := ROUND(v_taxable + v_cgst + v_sgst); -- Final total rounded

    DBMS_OUTPUT.PUT_LINE('===== KIRANA STORE BILL =====');
    DBMS_OUTPUT.PUT_LINE('Name: Mishri Amrutiya');
    DBMS_OUTPUT.PUT_LINE('Roll No: 52');
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price: Rs.' || TO_CHAR(v_price, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Gross: Rs.' || TO_CHAR(v_gross, '99,999.00'));

    -- NVL2 prints different messages for NULL and non-NULL coupon
    DBMS_OUTPUT.PUT_LINE(
        NVL2(v_coupon,
             'Coupon applied: ' || v_coupon || '%',
             'No coupon')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Discount: Rs.' || TO_CHAR(v_disc, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Taxable: Rs.' || TO_CHAR(v_taxable, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'CGST: Rs.' || TO_CHAR(v_cgst, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'SGST: Rs.' || TO_CHAR(v_sgst, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Final Total: Rs.' || TO_CHAR(v_total, '99,999')
    );
END;
/

-- OUTPUT:
-- ===== KIRANA STORE BILL =====
-- Name: Mishri Amrutiya
-- Roll No: 52
-- Quantity: 4
-- Price: Rs. 5,600.00
-- Gross: Rs.22,400.00
-- No coupon
-- Discount: Rs.     0.00
-- Taxable: Rs.22,400.00
-- CGST: Rs. 2,016.00
-- SGST: Rs. 2,016.00
-- Final Total: Rs.26,432