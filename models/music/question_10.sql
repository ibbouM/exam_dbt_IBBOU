{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_10 as (
    select
        dg.name as genre, avg(ftc.bytes) as moyenne_taille_morceaux
    from {{ ref('fact_track_cd') }} ftc
    join {{ ref('dim_genre') }} dg on ftc.genre_key = dg.genre_key
    group by dg.name
)

select * from question_10
