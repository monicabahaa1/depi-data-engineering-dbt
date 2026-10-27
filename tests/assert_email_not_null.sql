
SELECT
    employee_id,
    email
FROM {{ ref("STGEmployee") }}
WHERE email IS NULL
   OR TRIM(email) = ''
