{{ config(materialized='table', tags=['star_schema']) }}

select 
    row_number() over (order by id_playlist) as playlist_key,
    id_playlist,
    name
from {{ source('exam_snowflake_db', 'playlist') }}
