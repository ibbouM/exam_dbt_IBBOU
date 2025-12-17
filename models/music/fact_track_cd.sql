{{ config(materialized='table', tags=['star_schema']) }}

select
    dt.track_key,
    dar.artist_key,
    dal.album_key,
    dp.playlist_key,
    dg.genre_key,
    t.milliseconds as duration_milliseconds,
    t.bytes
from {{ source('exam_snowflake_db', 'track') }} t
left join {{ ref('dim_track') }} dt on t.id_track = dt.id_track
left join {{ source('exam_snowflake_db', 'album') }} al on t.id_album = al.id_album
left join {{ ref('dim_artist') }} dar on al.id_artist = dar.id_artist
left join {{ ref('dim_album') }} dal on al.id_album = dal.id_album
left join {{ source('exam_snowflake_db', 'playlisttrack') }} pt on t.id_track = pt.id_track
left join {{ ref('dim_playlist') }} dp on pt.id_playlist = dp.id_playlist
left join {{ ref('dim_genre') }} dg on t.id_genre = dg.id_genre
