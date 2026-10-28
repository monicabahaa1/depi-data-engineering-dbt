
SELECT DISTINCT
    gender
FROM {{ ref("STGEmployee") }}
WHERE gender IS NOT NULL
    AND TRIM(gender) <> ''

