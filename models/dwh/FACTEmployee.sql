
SELECT
    employee_id,
    full_name,
    salary,
    email,
    gender,
    DOB,
    department,
    country
FROM {{ ref("STG_OBT") }}
