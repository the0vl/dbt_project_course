{{ 
    config(
        materialized = 'incremental',
        on_schema_change = 'sync_all_columns' 
        )
}}
with src_reviews as (
    select * from {{ ref('src_reviews') }}
)
SELECT {{ dbt_utils.generate_surrogate_key(['listing_id','review_date','reviewer_name','review_text']) }} as review_id,
* 
FROM src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{ this }})
{% endif %}