
SELECT DISTINCT
    DOB AS date
FROM {{ source("source_ods", "DEPI_data") }}
WHERE DOB IS NOT NULL

