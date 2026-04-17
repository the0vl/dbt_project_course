{{ config(
    materialized = 'table'
)}}
WITH fact_reviews AS (
    SELECT * FROM {{ ref('fact_reviews') }}
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT fr.*,
    CASE
        WHEN fm.full_moon_date IS NULL
        THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM fact_reviews fr
LEFT JOIN full_moon_dates fm
    ON TO_DATE(fr.review_date) BETWEEN 
        DATEADD('day', -1, fm.full_moon_date) 
        AND DATEADD('day', 1, fm.full_moon_date)