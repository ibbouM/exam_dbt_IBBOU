{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_2 as (
    select distinct
        dt.name, dal.production_year
    from {{ ref('fact_track_cd') }} ftc
    join {{ ref('dim_album')}} dal on ftc.album_key = dal.album_key
    join {{ref('dim_track')}} dt on ftc.track_key = dt.track_key
    where dal.production_year in (2000, 2002) limit 10
)

select * from question_2

