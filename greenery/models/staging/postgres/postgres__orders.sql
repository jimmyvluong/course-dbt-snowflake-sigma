{{
  config(
    materialized='view'
  )
}}

with src_postgres__orders as (
  select * from {{ source('src_postgres', 'orders') }}
)

, renamed_recast as (
  select
	ORDER_ID as order_guid
	, USER_ID as user_guid
	, PROMO_ID
	, ADDRESS_ID
	, CREATED_AT as order_created_at_utc
	, ORDER_COST
	, SHIPPING_COST
	, ORDER_TOTAL
	, TRACKING_ID as tracking_guid
	, SHIPPING_SERVICE
	, ESTIMATED_DELIVERY_AT as order_estimated_delivery_at_utc
	, DELIVERED_AT as order_delivered_at_utc
	, STATUS as order_status
  from src_postgres__orders
)

SELECT * FROM renamed_recast