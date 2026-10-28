
SELECT
    ID AS employee_id,
    {{ capitalize_name('first_name', 'last_name') }} AS full_name,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    LOWER(TRIM(email)) AS email,
    UPPER(TRIM(gender)) AS gender,
    TRY_CAST(DOB AS DATE) AS DOB,
    TRY_CAST(
        REPLACE(
            REPLACE(
                CAST(salary AS VARCHAR(50)),
                '$',
                ''
            ),
            ',',
            ''
        ) AS DECIMAL(10,2)
    ) AS salary,
    TRIM(department) AS department,
    TRIM(country) AS country
FROM {{ source("source_ods", "DEPI_data") }}
WHERE ID IS NOT NULL
