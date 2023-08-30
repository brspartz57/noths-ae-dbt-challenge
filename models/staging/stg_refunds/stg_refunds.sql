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
    r.id AS refund_id,
    r.created_at,
    r.updated_at,
    r.order_id,
    r.amount_refunded,
    r.refund_reason
  FROM source AS r

)

SELECT * FROM renamed
