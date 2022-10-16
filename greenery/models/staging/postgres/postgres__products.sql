{{
  config(
    materialized='view'
  )
}}

with src_postgres__products as (
  select * from {{ source('src_postgres', 'products') }}
)

, renamed_recast as (
  select
	PRODUCT_ID as product_guid
	, NAME as product_name
	, PRICE as price_usd
	, INVENTORY
  from src_postgres__products
)

SELECT * FROM renamed_recast