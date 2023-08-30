--- Product #248 has been refunded the most

WITH refunded_id AS (
    SELECT
        order_id AS refunded_id
    FROM ANALYTICS.MY_SCHEMA.stg_refunds
)

SELECT
    soi.order_id,
    soi.product_id,
    soi.quantity,
    ri.refunded_id,
    SUM(quantity) OVER (PARTITION BY product_id) AS refunded_product_quantity,
FROM ANALYTICS.MY_SCHEMA.STG_ORDER_ITEMS soi
LEFT JOIN refunded_id AS ri ON ri.refunded_id = soi.order_id
WHERE refunded_id IS NOT NULL
    --AND product_id = 248
ORDER BY 4 DESC