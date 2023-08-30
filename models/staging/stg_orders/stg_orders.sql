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
    os.id AS order_id,
    os.created_at,
    os.updated_at,
    os.customer_id,
    os.order_total,
    os.payment_method,
    os.order_status
  FROM source AS os

)

SELECT * FROM renamed