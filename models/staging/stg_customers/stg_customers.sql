{{
  config (
      materialized='view',
      unique_key='id',
      )
}}

WITH source AS (

  SELECT * FROM {{ ref('customers') }}

),

renamed AS (

    SELECT
        cu.id AS customer_id,
        cu.created_at,
        cu.updated_at,
        cu.first_name,
        cu.last_name,
        cu.email,
        cu.address,
        cu.city,
        cu.post_code,
        cu.email_marketing_status,
        cu.email_opted_out_date
    FROM {{ ref('customers') }} AS cu

)

SELECT * FROM renamed