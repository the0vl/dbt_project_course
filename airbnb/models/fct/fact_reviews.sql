{{ 
    config(
        materialized = 'incremental',
        on_schema_change = 'fail' 
        )
}}
with src_reviews as (
    select * from {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{ this }})
{% endif %}