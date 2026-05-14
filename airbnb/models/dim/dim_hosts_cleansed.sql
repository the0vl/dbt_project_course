{{
    config(
        materialized = 'table'
    )
}}
with dim_hosts as (
    SELECT * FROM {{ ref('src_hosts') }}
)
SELECT host_id,
    NVL(host_name, 'Anonymous') as host_name,
    IFF(is_superhost = 't', TRUE, FALSE) as is_superhost,
    created_at,
    updated_at
FROM dim_hosts