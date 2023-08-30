{{
  config (
      materialized='ephemeral',
      unique_key='category_id',
      )
}}

WITH source AS (

  SELECT * FROM {{ ref('categories') }}

),

renamed AS (

SELECT
    c.id AS category_id,
    c.created_at,
    c.updated_at,
    c.name AS category_name 
FROM source AS c

)

SELECT * FROM renamed
