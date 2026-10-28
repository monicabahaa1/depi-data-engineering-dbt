
SELECT DISTINCT
    country
FROM {{ ref("STGEmployee") }}
WHERE country IS NOT NULL
    AND TRIM(country) <> ''
