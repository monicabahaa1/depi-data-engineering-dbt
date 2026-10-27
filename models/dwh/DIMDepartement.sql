
WITH department_ AS (
    SELECT DISTINCT
        department
    FROM {{ source("source_ods", "DEPI_data") }}
    WHERE department IS NOT NULL
)

SELECT
    ROW_NUMBER() OVER (ORDER BY department) AS department_id,
    department AS department_name
FROM department_
