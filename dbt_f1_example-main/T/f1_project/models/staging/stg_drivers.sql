{{ config(materialized='view') }}

with drivers as (
    select distinct on (lower (split_part(driver_url, '/', 8)))
        lower (split_part(driver_url, '/', 8)) AS id,
        lower (split_part(driver_url, '/', 9)) AS slug,
        driver_first_name    AS first_name,
        driver_last_name     AS last_name,
        driver_short_name    AS short_name,
    driver_nationality   AS nationality
from {{ source('f1_raw', 'raw_drivers') }})

select * from drivers
WHERE id IS NOT NULL