
WITH employee_ AS (
    SELECT DISTINCT
        ID,
        first_name,
        last_name,
        email,
        DOB,
        salary,
        department,
        gender,
        country
    FROM {{ source("source_ods", "DEPI_data") }}
    WHERE ID IS NOT NULL
)

SELECT
    ID AS employee_id,
    first_name,
    last_name,
    email,
    CAST(DOB AS DATE) AS DOB,
    salary,
    department,
    gender,
    country
FROM employee_
