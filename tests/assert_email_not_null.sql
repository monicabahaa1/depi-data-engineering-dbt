
SELECT
    employee_id,
    email
FROM {{ ref("STG_OBT") }}
WHERE email IS NULL
   OR TRIM(email) = ''
