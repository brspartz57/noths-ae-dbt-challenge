{{
  config (
      materialized='table',
      unique_key='refund_id',
      cluster_by=['created_at']
      )
}}

WITH source AS (

  SELECT * FROM {{ ref('refunds') }}

),

renamed AS (

  SELECT
    id AS refund_id,
    created_at,
    updated_at,
    order_id,
    amount_refunded,
    refund_reason
  FROM source

)

SELECT * FROM renamed
