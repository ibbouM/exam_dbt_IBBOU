{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_3 as (
    select distinct
        dt.name, dt.composer, dg.name as genre
    from {{ ref('fact_track_cd')}} ftc
    join {{ ref('dim_genre')}} dg on ftc.genre_key = dg.genre_key
    join {{ ref('dim_track')}} dt on ftc.track_key = dt.track_key
    where dg.name in ('Rock', 'Jazz')
    and dt.composer not in ('nan')
)

select * from question_3

