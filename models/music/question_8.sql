{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_7 as (
    select distinct
        dp.name as nom_playlist
    from {{ ref('fact_track_cd') }} ftc
    join {{ ref('dim_playlist') }} dp on ftc.playlist_key = dp.playlist_key
    where ftc.duration_milliseconds > 4 * 60 * 1000
)

select * from question_7

