
SELECT
    employee_id,
    {{ capitalize_name('first_name', 'last_name') }} AS full_name,
    first_name,
    last_name,
    email,
    gender,
    DOB,
    salary,
    department,
    country
FROM {{ ref("STGEmployee") }}
