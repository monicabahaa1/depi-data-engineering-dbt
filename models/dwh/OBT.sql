
{{
    config(
        materialized='incremental',
        unique_key='employee_id'
    )
}}

WITH employee_data AS (
    SELECT DISTINCT
        ID AS employee_id,
        first_name,
        last_name,
        {{ capitalize_name('first_name', 'last_name') }} AS full_name,
        email,
        gender,
        TRY_CAST(DOB AS DATE) AS [date],
        TRY_CAST(
            REPLACE(
                REPLACE(
                    REPLACE(
                        LTRIM(RTRIM(CAST(salary AS VARCHAR(50)))),
                        '$',
                        ''
                    ),
                    ',',
                    ''
                ),
                ' ',
                ''
            ) AS DECIMAL(10,2)
        ) AS salary,
        department,
        country
    FROM {{ source("source_ods", "DEPI_data") }}
    WHERE ID IS NOT NULL
)

SELECT *
FROM employee_data
WHERE employee_id IS NOT NULL

{% if is_incremental() %}
    AND employee_id NOT IN (
        SELECT employee_id
        FROM {{ this }}
        WHERE employee_id IS NOT NULL
    )
{% endif %}
