
SELECT
    employee_id,
    salary
FROM {{ ref("STG_OBT") }}
WHERE salary < 0
