DROP VIEW IF EXISTS fraud_clean;

CREATE VIEW fraud_clean AS
SELECT
    transaction_id,
    user_id,
    transaction_amount,
    COALESCE(transaction_type, 'unknown') AS transaction_type,
    time_of_transaction,
    CASE
        WHEN time_of_transaction IS NULL            THEN 'unknown'
        WHEN time_of_transaction BETWEEN 6  AND 12  THEN 'morning'
        WHEN time_of_transaction BETWEEN 13 AND 16  THEN 'afternoon'
        WHEN time_of_transaction BETWEEN 17 AND 20  THEN 'evening'
        ELSE 'night'
    END AS time_of_day,
    COALESCE(device_used, 'unknown')    AS device_used,
    COALESCE(location, 'unknown')       AS location,
    previous_fraudulent_transactions,
    account_age,
    number_of_transactions_last_24h,
    COALESCE(payment_method, 'unknown') AS payment_method,
    fraudulent,
    CASE
        WHEN transaction_amount IS NULL THEN 'unknown'
        WHEN transaction_amount <= AVG(transaction_amount) OVER ()         THEN 'normal'
        WHEN transaction_amount <= AVG(transaction_amount) OVER () + 10000 THEN 'under_review'
        ELSE 'high_amount'
    END AS amount_flag
FROM fraud_detection;
SELECT time_of_day, COUNT(*) as count_per_day_parts FROM fraud_clean GROUP BY time_of_day ORDER BY 2 DESC;