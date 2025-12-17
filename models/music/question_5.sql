{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_5 as (
    select 
        dar.name, count(distinct ftc.album_key) as number_album
    from {{ ref('fact_track_cd') }} ftc
    join {{ref('dim_artist')}} dar on ftc.artist_key = dar.artist_key
    group by dar.name
)

select * from question_5
