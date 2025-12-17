{{ config(materialized='table', tags=['star_schema']) }}

select
    row_number() over (order by id_track) as track_key,
    id_track,
    name,
    composer
from {{ source('exam_snowflake_db', 'track') }}
