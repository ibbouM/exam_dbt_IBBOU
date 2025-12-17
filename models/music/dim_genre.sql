{{ config(materialized='table', tags=['star_schema']) }}

select 
    row_number() over (order by id_genre) as genre_key,
    id_genre,
    name,
from {{ source('exam_snowflake_db', 'genre') }}


