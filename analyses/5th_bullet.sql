--- Yes, we sent any emails to someone who is unsubscribed?

WITH email_opt_out_date AS (

SELECT 
    customer_id,
    email_marketing_status,
    email_opted_out_date
FROM ANALYTICS.MY_SCHEMA.STG_CUSTOMERS
WHERE email_marketing_status = 'opted_out'

),

last_sent_date AS(
SELECT 
    customer_id,
    MAX(sent_date) AS last_sent_date
FROM ANALYTICS.MY_SCHEMA.STG_EMAILS
GROUP BY 1
)

SELECT
    eood.customer_id,
    eood.email_marketing_status,
    eood.email_opted_out_date,
    lsd.last_sent_date,
    CASE 
        WHEN email_opted_out_date <= last_sent_date THEN TRUE
        ELSE FALSE
    END AS unsubsribed_send_check
FROM email_opt_out_date AS eood
LEFT JOIN last_sent_date AS lsd ON lsd.customer_id = eood.customer_id