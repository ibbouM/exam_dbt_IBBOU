{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_9 as (
    select 
        dt.name as track_name, dg.name as genre_name, dar.name as artist_name, dar.country
    from {{ ref('fact_track_cd') }} ftc
    join {{ ref('dim_track') }} dt on ftc.track_key = dt.track_key
    join {{ ref('dim_artist') }} dar on ftc.artist_key = dar.artist_key
    join {{ ref('dim_genre') }} dg on ftc.genre_key = dg.genre_key
    where dg.name = 'Rock' and dar.country = 'France'
)

select * from question_9
