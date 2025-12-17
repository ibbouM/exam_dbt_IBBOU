{{ config(materialized='table', tags=['star_schema']) }}

select 
    -- d'après la documentation dbt, permet de crée une clé auto-incrémentée en ordonnant selon id_album
    row_number() over (order by id_album) as album_key,
    id_album,
    title,
    production_year,
    cd_number
from {{ source('exam_snowflake_db', 'album') }}
