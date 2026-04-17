with raw_hosts as (
SELECT *
FROM {{ source('airbnb', 'hosts') }}
)
SELECT id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at
from raw_hosts