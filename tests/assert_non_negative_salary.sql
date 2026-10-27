
SELECT
    employee_id,
    salary
FROM {{ ref("STGEmployee") }}
WHERE salary < 0
