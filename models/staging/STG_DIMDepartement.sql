
SELECT DISTINCT
    department
FROM {{ source("source_ods", "DEPI_data") }}
WHERE department IS NOT NULL
    AND TRIM(department) <> ''
