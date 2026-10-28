
SELECT
    obt.employee_id,
    obt.full_name,
    obt.salary,
    de.employee_id AS dim_employee_id,
    dc.country_id,
    dg.gender_id,
    dd.department_id,
    dt.date_key
FROM {{ ref("STG_OBT") }} AS obt
LEFT JOIN {{ ref("DIMEmployee") }} AS de
    ON obt.employee_id = de.employee_id
LEFT JOIN {{ ref("DIMCountry") }} AS dc
    ON obt.country = dc.country
LEFT JOIN {{ ref("DIMGender") }} AS dg
    ON obt.gender = dg.gender_name
LEFT JOIN {{ ref("DIMDepartement") }} AS dd
    ON obt.department = dd.department_name
LEFT JOIN {{ ref("DIMDate") }} AS dt
    ON obt.DOB = dt.date
