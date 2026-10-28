
SELECT DISTINCT
    employee_id,
    first_name,
    last_name,
    email,
    gender,
    DOB,
    salary,
    department,
    country
FROM {{ source("source_ods", "DEPI_data") }}
