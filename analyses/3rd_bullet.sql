--- Could also use rank function & between to get top 10

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS unique_order_count
FROM ANALYTICS.MY_SCHEMA.STG_ORDERS
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;