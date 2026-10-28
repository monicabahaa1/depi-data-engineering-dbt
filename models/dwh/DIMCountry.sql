
SELECT
    ROW_NUMBER() OVER (ORDER BY country) AS country_id,
    country
FROM {{ ref("STG_DIMCountry") }}
