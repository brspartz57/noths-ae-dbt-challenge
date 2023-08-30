{{
  config (
      materialized='table',
      unique_key='refund_id',
      cluster_by=['created_at']
      )
}}

with source as (

  select * from {{ ref('refunds') }}

),

renamed as (

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
