
SELECT DISTINCT
    department
FROM {{ ref("STGEmployee") }}
WHERE department IS NOT NULL
    AND TRIM(department) <> ''
