{{
  config (
      materialized='view',
      unique_key='email_id',
      cluster_by=['sent_date']
      )
}}

WITH source AS (

  SELECT * FROM {{ ref('emails') }}

),
  
renamed AS (

SELECT

  e.id AS email_id,
  e.customer_id,
  e.sent_date,
  e.subject,
  e.opened,
  e.clicked
FROM SOURCE AS e
)

SELECT * FROM renamed
