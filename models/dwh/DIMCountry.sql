WITH country AS (
    SELECT DISTINCT country
    FROM {{ source("source_ods", "DEPI_data") }}
    WHERE country IS NOT NULL
)

SELECT
    ROW_NUMBER() OVER (ORDER BY country) AS country_id,
    country
FROM country