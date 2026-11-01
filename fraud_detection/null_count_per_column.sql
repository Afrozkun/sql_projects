
SELECT
    COUNT(*) FILTER (WHERE transaction_amount IS NULL) AS null_transaction_amount,
    COUNT(*) FILTER (WHERE transaction_type IS NULL) AS null_transaction_type,
    COUNT(*) FILTER (WHERE time_of_transaction IS NULL) AS null_time_of_transaction,
    COUNT(*) FILTER (WHERE device_used IS NULL) AS null_device_used,
    COUNT(*) FILTER (WHERE location IS NULL) AS null_location,
    COUNT(*) FILTER (WHERE previous_fraudulent_transactions IS NULL) AS null_previous_fraud,
    COUNT(*) FILTER (WHERE account_age IS NULL)  AS null_account_age,
    COUNT(*) FILTER (WHERE number_of_transactions_last_24h IS NULL) AS null_transactions_24h,
    COUNT(*) FILTER (WHERE payment_method IS NULL) AS null_payment_method,
    COUNT(*) FILTER (WHERE fraudulent IS NULL) AS null_fraudulent
FROM fraud_detection;