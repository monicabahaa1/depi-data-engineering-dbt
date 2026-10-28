
SELECT
    employee_id,
    first_name,
    last_name,
    email,
    gender,
    DOB,
    salary,
    department,
    country
FROM {{ ref("STG_DIMEmployee") }}
