{{
  config(
    materialized='view'
  )
}}

with src_postgres__addresses as (
  select * from {{ source('src_postgres', 'addresses') }}
)

, renamed_recast as (
  select
    address_id as address_guid
    , address
    , zipcode
    , state
    , country
  from src_postgres__addresses
)

SELECT * FROM renamed_recast