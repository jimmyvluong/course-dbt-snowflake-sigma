{{
  config(
    materialized='view'
  )
}}

with src_postgres__events as (
  select * from {{ source('src_postgres', 'events') }}
)

, renamed_recast as (
  select
	EVENT_ID as event_guid
	, SESSION_ID as session_guid
	, USER_ID as user_guid
	, PAGE_URL
	, CREATED_AT as event_created_at_utc
	, EVENT_TYPE
	, ORDER_ID as order_guid
	, PRODUCT_ID as product_guid
  from src_postgres__events
)

SELECT * FROM renamed_recast