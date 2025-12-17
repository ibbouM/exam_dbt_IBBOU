{{ config(materialized='view', tags=['queries'], query_tag= "queries_exam") }}

with question_1 as (
    select 
        title
    from {{ ref('dim_album') }} 
    where cd_number > 1
)

select * from question_1

