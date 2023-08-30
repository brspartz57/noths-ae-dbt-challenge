--- January is the month where the most money is earned historically

SELECT
    DATE_PART('month', created_at) AS month,
    SUM(order_total) AS monthly_revenue
FROM ANALYTICS.MY_SCHEMA.STG_ORDERS
GROUP BY 1
ORDER BY 1;