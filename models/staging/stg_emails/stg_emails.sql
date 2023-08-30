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
  e.clicked,
  LAG(email_id) OVER (PARTITION BY customer_id ORDER BY sent_date) AS last_sent_email_id
FROM SOURCE AS e
)

SELECT * FROM renamed
