-- product_id # 378 is the least popular product

SELECT
    product_id,
    SUM(quantity) AS products_sold
FROM ANALYTICS.MY_SCHEMA.STG_ORDER_ITEMS
GROUP BY 1
ORDER BY 2