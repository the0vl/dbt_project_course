# dbt Airbnb Analytics Project - AI Agent Instructions

## Architecture Overview
This is a dbt project implementing a Kimball-style dimensional model for Airbnb data analysis. The project follows a layered architecture:

- **src/**: Ephemeral source models that clean and standardize raw data from Snowflake `raw` schema
- **dim/**: Dimension tables (materialized as tables) containing descriptive attributes
- **fct/**: Fact tables with measurable events (reviews)
- **mart/**: Business logic marts combining dimensions and facts for analysis

## Key Conventions & Patterns

### Model Dependencies
Always use `{{ ref('model_name') }}` for inter-model references. Dependencies flow: src → dim/fct → mart.

### Materialization Strategy
- `src/` models: `ephemeral` (not materialized)
- `dim/` models: `table` (persistent storage)
- `mart/` models: `table` (computed business metrics)
- Default for unspecified: `view`

### Testing Framework
Use dbt's built-in tests in `schema.yml`:
- `unique`, `not_null` for data quality
- `relationships` for referential integrity
- `accepted_values` for domain constraints

Custom generic tests in `tests/generic/`:
- `minimum_row_count(model, min_row_count)` with warn severity

### Data Sources
Sources defined in `models/sources.yml` with freshness monitoring:
- `airbnb.listings` → `raw_listings`
- `airbnb.hosts` → `raw_hosts`  
- `airbnb.reviews` → `raw_reviews` (with 1h warn, 24h error freshness)

### Snapshots
Slowly changing dimensions use timestamp strategy:
```yaml
unique_key: id
updated_at: updated_at
strategy: timestamp
hard_deletes: invalidate
```

### Packages & Macros
- `dbt_utils`: Utility functions
- `dbt_expectations`: Advanced data quality tests

## Development Workflow

### Environment Setup
1. Activate virtual environment
2. Set `DBT_SNOWFLAKE_PRIVATE_KEY_PASSPHRASE` environment variable
3. Use `airbnb` profile targeting Snowflake `AIRBNB.DEV` schema

### Common Commands
- `dbt build`: Full project build (models + tests)
- `dbt run --select mart_fullmoon`: Run specific model
- `dbt test --select dim_listings_cleansed`: Test specific model
- `dbt docs generate && dbt docs serve`: Generate and view documentation

### Audit Logging
Project automatically creates audit_log table on run start to track model executions.

## Dagster Orchestration
Separate `dbt_dagster_project/` provides orchestration:
- Daily partitioned assets for incremental models
- Custom translator adds partition metadata
- Passes date ranges as dbt vars for incremental processing

## Code Examples

### Model Structure
```sql
{{ config(materialized='table') }}
WITH cte AS (
    SELECT * FROM {{ ref('upstream_model') }}
)
SELECT
    id,
    CASE 
        WHEN condition THEN 'value'
        ELSE 'other'
    END AS computed_column
FROM cte
```

### Test Definition
```yaml
columns:
  - name: listing_id
    data_tests:
    - unique
    - not_null
  - name: room_type
    data_tests:
    - accepted_values:
        values: ['Entire home/apt','Private room','Shared room','Hotel room']
```

### Source Configuration
```yaml
sources:
  - name: airbnb
    schema: raw
    tables:
      - name: listings
        identifier: raw_listings
        loaded_at_field: date
        freshness:
          warn_after: {count: 1, period: hour}
```</content>
<parameter name="filePath">/Users/theovl/Projects/dbt_sandbox/.github/copilot-instructions.md