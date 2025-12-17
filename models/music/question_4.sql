{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_4 as (
    select
        da.title, SUM(ftc.duration_milliseconds) as total_milliseconds
    from {{ ref('fact_track_cd') }} ftc
    join {{ ref('dim_album') }} da on ftc.album_key = da.album_key
    group by da.title
    order by total_milliseconds desc
    limit 10
)

select * from question_4

