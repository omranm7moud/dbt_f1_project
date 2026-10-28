{{ config(materialized='view') }}

select 
    lower (split_part(url, '/', 8)) AS id,
    "year",
    grand_prix,
    winner_laps,
    winner_team,
    winner_time
    "date",
    winner_driver_first_name,
    winner_driver_last_name,
    winner_driver_short_name
from {{ source('f1_raw', 'raw_races') }}