{{
  config (
      materialized='table',
      unique_key='id',
      cluster_by=['created_at']
      )
}}

WITH source AS (

  SELECT * FROM {{ ref('products') }}

),

renamed as (

  SELECT
    id AS product_id,
    created_at,
    updated_at,
    name AS product_name,
    description AS product_id,
    price,
    sale_price,
    in_stock,
    on_sale,
    category_id
  FROM source

)

SELECT * FROM renamed
