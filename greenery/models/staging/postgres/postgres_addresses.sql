{{
  config(
    materialized='view'
  )
}}

SELECT *
FROM {{source('postgres','addresses' )}}