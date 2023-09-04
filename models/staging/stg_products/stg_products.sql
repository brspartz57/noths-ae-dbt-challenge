{{
  config (
      materialized='table',
      unique_key='id',
      cluster_by=['created_at']
      )
}}

WITH source AS (

  SELECT 
    p.id,
    p.created_at,
    p.updated_at,
    p.name,
    p.description,
    p.price,
    p.sale_price,
    p.in_stock,
    p.on_sale,
    p.category_id,
    c.category_name
  FROM {{ ref('products') }} AS p
  LEFT JOIN {{ ref('stg_categories') }} AS c ON c.category_id = p.category_id

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
    p.category_id,
    p.category_name
  FROM source AS p

)

SELECT * FROM renamed
