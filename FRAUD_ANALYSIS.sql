CREATE TABLE transactions (
    trans_id INT,
    trans_date_trans_time TIMESTAMP,
    cc_num TEXT,
    merchant TEXT,
    category TEXT,
    amt NUMERIC(10, 2),
    first TEXT,
    last TEXT,
    gender CHAR(1),
    street TEXT,
    city TEXT,
    state TEXT,
    zip TEXT,
    lat NUMERIC(10, 6),
    long NUMERIC(10, 6),
    city_pop INTEGER,
    job TEXT,
    dob DATE,
    trans_num TEXT,
    unix_time BIGINT,
    merch_lat NUMERIC(10, 6),
    merch_long NUMERIC(10, 6),
    is_fraud BOOLEAN
);

copy transactions(
    trans_id,
    trans_date_trans_time,  
    cc_num,
    merchant, 
    category,
    amt,
    first, 
    last,
    gender, 
    street,
    city,
    state,
    zip,
    lat,
    long,
    city_pop,
    job,
    dob,
    trans_num,
    unix_time,
    merch_lat,
    merch_long,
    is_fraud
) 
FROM 'C:\Users\Satvik Patil\Documents\fraudTest.csv\fraudTest.csv' 
DELIMITER ',' CSV HEADER;

SELECT * FROM TRANSACTIONS;


--  1. Total Transactions & Total Amount

CREATE VIEW view_total_transactions_summary AS
SELECT count(*),sum(amt) from transactions;


-- Transactions per Day

CREATE VIEW TRANSACTIONS_PER_DAY AS
SELECT 
    DATE(trans_date_trans_time) AS trans_date,
    COUNT(*) AS daily_transactions,
    SUM(amt) AS total_daily_amount
FROM transactions
GROUP BY DATE(trans_date_trans_time)
ORDER BY trans_date;

-- Fraud vs Non-Fraud Summary

CREATE VIEW Fraud_vs_NonFraud AS
SELECT 
    is_fraud,
    COUNT(*) AS count,
    SUM(amt) AS total_amount
FROM transactions
GROUP BY is_fraud;

-- Top 10 Fraud Cities
CREATE VIEW TOP_10_FRAUD_CITIES AS
SELECT CITY, COUNT(*) AS FRAUD_COUNT
FROM TRANSACTIONS 
	WHERE IS_FRAUD = TRUE 
	GROUP BY CITY 
	ORDER BY FRAUD_COUNT DESC
LIMIT 10  ;

-- Top Jobs in Fraud Cases

CREATE VIEW TOP_JOBS_IN_FRAUD_CASES AS
SELECT JOB, COUNT(*) AS FRAUD_JOBS
FROM TRANSACTIONS 
	WHERE IS_FRAUD = TRUE
	GROUP BY JOB
	ORDER BY FRAUD_JOBS DESC
LIMIT 10;

-- Top Merchants in Fraud
CREATE VIEW view_top_fraud_merchants AS
SELECT 
    merchant,
    COUNT(*) AS fraud_transactions
FROM transactions
WHERE is_fraud = TRUE
GROUP BY merchant
ORDER BY fraud_transactions DESC
LIMIT 10;

-- Avg Amount - Fraud vs Non-Fraud
CREATE VIEW view_avg_amount_by_fraud AS
SELECT 
    is_fraud,
    AVG(amt) AS avg_transaction_amount
FROM transactions
GROUP BY is_fraud;

--High Value Transactions

CREATE VIEW HIGH_VALUE_TRANSACTIONS AS 
SELECT * FROM TRANSACTIONS 
WHERE AMT>1000
ORDER BY AMT DESC
LIMIT 10;


--Transactions by Weekday
CREATE VIEW view_weekday_transactions AS
SELECT 
TO_CHAR(trans_date_trans_time, 'Day') AS weekday,
COUNT(*) AS total_transactions,
SUM(amt) AS total_spent
FROM transactions
GROUP BY weekday
ORDER BY total_transactions DESC;

-- Fraud Rate by Job Category
CREATE VIEW FRAUD_RATE_BY_CATEGORY AS
SELECT 
    t.job,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN t.is_fraud THEN 1 ELSE 0 END) AS fraud_txns,
    ROUND(100.0 * SUM(CASE WHEN t.is_fraud THEN 1 ELSE 0 END) / COUNT(*), 2) AS fraud_rate
FROM transactions t
GROUP BY t.job
ORDER BY fraud_rate DESC
LIMIT 10;

--Rank Transactions by Amount per User
CREATE VIEW RANK_TRANSACTION_BY_AMOUNT_PER_USER AS
SELECT 
    cc_num,
    amt,
    trans_date_trans_time,
    RANK() OVER (PARTITION BY cc_num ORDER BY amt DESC) AS txn_rank
FROM transactions;

--Find Users with > 3 Fraud Transactions
CREATE VIEW USERS_WITH_MORE_THAN_3_FRAUD AS
WITH fraud_counts AS (
    SELECT cc_num, COUNT(*) AS fraud_txn_count
    FROM transactions
    WHERE is_fraud = TRUE
    GROUP BY cc_num
)
SELECT *
FROM fraud_counts
WHERE fraud_txn_count > 3
ORDER BY fraud_txn_count DESC;







	
	








