{{
  config(
    materialized='view'
  )
}}

with src_postgres__users as (
  select * from {{ source('src_postgres', 'users') }}
)

, renamed_recast as (
  select
	USER_ID as user_guid
	, FIRST_NAME
	, LAST_NAME
	, EMAIL
	, PHONE_NUMBER
	, CREATED_AT as user_created_at_utc
	, UPDATED_AT as user updated at utc
	, ADDRESS_ID as address_guid
  from src_postgres__users
)

SELECT * FROM renamed_recast