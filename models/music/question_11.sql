{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_11 as (
    select distinct
        dp.name
    from {{ ref('fact_track_cd') }} ftc
    join {{ ref('dim_playlist') }} dp on ftc.playlist_key = dp.playlist_key
    join {{ref('dim_artist')}} dar on ftc.artist_key = dar.artist_key
    where dar.birth_year < 1990
)

select * from question_11
