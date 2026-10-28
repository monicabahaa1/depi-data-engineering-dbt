
SELECT DISTINCT
    gender
FROM {{ source("source_ods", "DEPI_data") }}
WHERE gender IS NOT NULL
    AND TRIM(gender) <> ''

