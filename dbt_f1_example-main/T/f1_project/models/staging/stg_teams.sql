{{config(materialized='view')}}

select 
       team,
    lower (split_part(team_url, '/', 8)) AS team_id
from {{ source('f1_raw', 'raw_drivers') }}