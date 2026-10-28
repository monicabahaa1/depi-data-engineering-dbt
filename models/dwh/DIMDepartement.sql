
SELECT
    ROW_NUMBER() OVER (ORDER BY department) AS department_id,
    department AS department_name
FROM {{ ref("STG_DIMDepartement") }}
