{{
  config(
    materialized='view'
  )
}}

with src_postgres__order_items as (
  select * from {{ source('src_postgres', 'order_items') }}
)

, renamed_recast as (
  select
	ORDER_ID as order_guid
	, PRODUCT_ID as product_guid
	, QUANTITY
  from src_postgres__order_items
)

SELECT * FROM renamed_recast