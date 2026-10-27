
WITH gender_ AS (
    SELECT DISTINCT
        gender
    FROM {{ source("source_ods", "DEPI_data") }}
    WHERE gender IS NOT NULL
)

SELECT
    ROW_NUMBER() OVER (ORDER BY gender) AS gender_id,
    gender AS gender_name
FROM gender_
