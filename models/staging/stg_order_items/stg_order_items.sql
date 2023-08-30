{{
  config (
      materialized='table',
      unique_key='order_item_id',
      )
}}

WITH source AS (

  SELECT * FROM {{ ref('order_items') }}

),

renamed as (

    SELECT
        id AS order_item_id,
        created_at,
        updated_at,
        order_id,
        product_id,
        quantity
    FROM source AS p

)

SELECT * FROM renamed
