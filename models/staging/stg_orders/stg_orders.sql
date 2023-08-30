{{
  config (
      materialized='table',
      unique_key='order_id',
      cluster_by=['created_at']
      )
}}


WITH source AS (

  SELECT
    *
  FROM {{ ref('orders') }}

),

renamed AS (

  SELECT
    os.id AS order_item_id,
    os.created_at,
    os.updated_at,
    os.order_id,
    os.product_id,
    os.quanity
  FROM source AS os

)

SELECT * FROM renamed