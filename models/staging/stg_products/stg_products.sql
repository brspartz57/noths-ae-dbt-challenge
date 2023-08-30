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
    p.id AS product_id,
    p.created_at,
    p.updated_at,
    p.name AS product_name,
    p.description AS product_description,
    p.price,
    p.sale_price,
    p.in_stock,
    p.on_sale,
    p.category_id
  FROM source AS p

)

SELECT * FROM renamed
