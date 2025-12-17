{{ config(materialized='table', tags=['star_schema']) }}

select
    row_number() over (order by id_artist) as artist_key,
    id_artist,
    name,
    birth_year,
    country
from {{ source('exam_snowflake_db', 'artist') }}