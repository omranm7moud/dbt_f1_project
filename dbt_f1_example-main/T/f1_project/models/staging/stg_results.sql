{{ config(materialized='view') }}

select 
    lower (split_part(url, '/', 8)) AS race_id,
    driver_first_name    AS first_name,
    driver_last_name     AS last_name,
    driver_short_name    AS short_name,
    pos  as position,
    no as driver_number,
    pts as points,
    team,
    laps
from {{ source('f1_raw', 'raw_results') }}