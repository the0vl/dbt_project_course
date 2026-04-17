SELECT * FROM {{ ref('fact_reviews') }} frc
INNER JOIN {{ ref('dim_listings_cleansed') }} dlc
    ON frc.listing_id = dlc.listing_id
WHERE frc.review_date < dlc.created_at
LIMIT 100