{{
  config(
    materialized='view'
  )
}}

with src_postgres__promos as (
  select * from {{ source('src_postgres', 'promos') }}
)

, renamed_recast as (
  select
	PROMO_ID
	, DISCOUNT as discount_usd
	, STATUS as promo_status
  from src_postgres__promos
)

SELECT * FROM renamed_recast