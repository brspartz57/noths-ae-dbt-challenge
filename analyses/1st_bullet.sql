--- June is the busiest month

SELECT
    DATE_PART('month', created_at) AS month,
    COUNT(DISTINCT order_id) AS unique_order_count
FROM ANALYTICS.MY_SCHEMA.STG_ORDERS
GROUP BY 1
ORDER BY 1;