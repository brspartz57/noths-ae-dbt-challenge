--- 

WITH category_name AS (
SELECT
    product_id,
    category_name
FROM ANALYTICS.MY_SCHEMA.STG_PRODUCTS
)

SELECT
    category_name,
    SUM(quantity) AS category_product_quantity
FROM ANALYTICS.MY_SCHEMA.STG_ORDER_ITEMS soi
LEFT JOIN category_name AS ri ON ri.product_id = soi.product_id
WHERE category_name IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC