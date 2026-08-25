SET SERVEROUTPUT ON;

<<bank>>
DECLARE
    v_bank VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER := 0;
BEGIN
    <<branch>>
    DECLARE
        v_branch VARCHAR2(30) := 'Ahmedabad';
        v_deposit NUMBER := 52 * 1000;
    BEGIN
        bank.v_total_deposit := bank.v_total_deposit + v_deposit;

        <<counter>>
        DECLARE
            v_token NUMBER := 1;
        BEGIN
            DBMS_OUTPUT.PUT_LINE(
                bank.v_bank || ' | ' || v_branch ||
                ' | Token ' || v_token
            );
        END;

        -- Uncommenting the next line causes:
        -- PLS-00201: identifier 'V_TOKEN' must be declared
        -- DBMS_OUTPUT.PUT_LINE(v_token);

    END;

    DBMS_OUTPUT.PUT_LINE(
        'Total Deposit: Rs.' || bank.v_total_deposit
    );
END;
/

-- OUTPUT:
-- LJ Bank | Ahmedabad | Token 1
-- Total Deposit: Rs.52000

-- ERROR WHEN v_token LINE IS UNCOMMENTED:
-- PLS-00201: identifier 'V_TOKEN' must be declared