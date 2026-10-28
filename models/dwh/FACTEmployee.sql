
SELECT
    employee_id,
    full_name,
    email,
    gender,
    DOB,
    salary,
    department,
    country
FROM {{ ref("STG_OBT") }}
