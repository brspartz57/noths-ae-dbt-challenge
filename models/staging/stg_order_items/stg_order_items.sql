{{
  config (
      materialized='table',
      unique_key='order_item_id',
      )
}}

SELECT
    id AS order_item_id,
    created_at,
    updated_at,
    order_id,
    product_id,
    quantity
FROM {{ ref('order_items') }}
