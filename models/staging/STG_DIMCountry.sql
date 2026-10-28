
SELECT DISTINCT
    country
FROM {{ source("source_ods", "DEPI_data") }}
WHERE country IS NOT NULL
    AND TRIM(country) <> ''
