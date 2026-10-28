CREATE DATABASE BankLoanAnalysis;
USE BankLoanAnalysis;

-- ----------- Create a View by Merging finance_1 and finance_2 ---------------

CREATE OR REPLACE VIEW bank_loan_merged AS
SELECT
    f1.*,
    f2.delinq_2yrs,
    f2.earliest_cr_line,
    f2.inq_last_6mths,
    f2.mths_since_last_delinq,
    f2.mths_since_last_record,
    f2.open_acc,
    f2.pub_rec,
    f2.revol_bal,
    f2.revol_util,
    f2.total_acc,
    f2.initial_list_status,
    f2.out_prncp,
    f2.out_prncp_inv,
    f2.total_pymnt,
    f2.total_pymnt_inv,
    f2.total_rec_prncp,
    f2.total_rec_int,
    f2.total_rec_late_fee,
    f2.recoveries,
    f2.collection_recovery_fee,
    f2.last_pymnt_d,
    f2.last_pymnt_amnt,
    f2.next_pymnt_d,
    f2.last_credit_pull_d
FROM finance_1 AS f1
LEFT JOIN finance_2 AS f2
    ON f1.id = f2.id;

-- Display the View
SELECT * FROM bank_loan_merged;

-- KPI_1 ------ Year wise loan amount Stats ------

SELECT
    YEAR(STR_TO_DATE(CONCAT('01-', issue_d), '%d-%b-%y')) AS Loan_Year,
    SUM(loan_amnt) AS Total_Loan_Amount
FROM bank_loan_merged
GROUP BY Loan_Year
ORDER BY Loan_Year;

-- KPI_2 ------ Grade and sub grade wise revol_bal -----

SELECT
    grade,
    sub_grade,
    SUM(revol_bal) AS Total_Revolving_Balance
FROM bank_loan_merged
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;

-- KPI_3 ------ Total Payment for Verified Status Vs Total Payment for Non Verified Status -------

SELECT
    verification_status,
    SUM(total_pymnt) AS Total_Payment
FROM bank_loan_merged
WHERE verification_status IN ('Verified', 'Not Verified')
GROUP BY verification_status;

-- KPI_4 ------ This query shows the number of loans for each state, last credit pull date, and loan status. ----

SELECT
    addr_state,
    last_credit_pull_d,
    loan_status,
    COUNT(*) AS Total_Loans
FROM bank_loan_merged
GROUP BY
    addr_state,
    last_credit_pull_d,
    loan_status
ORDER BY
    addr_state,
    last_credit_pull_d,
    loan_status;
    
-- KPI_5 ----- Home ownership Vs last payment date stats ------

SELECT
    home_ownership,
    last_pymnt_d,
    COUNT(*) AS Total_Loans,
    SUM(total_pymnt) AS Total_Payment
FROM bank_loan_merged
GROUP BY
    home_ownership,
    last_pymnt_d
ORDER BY
    home_ownership,
    last_pymnt_d;