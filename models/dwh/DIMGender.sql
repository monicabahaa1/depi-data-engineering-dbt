
SELECT
    ROW_NUMBER() OVER (ORDER BY gender) AS gender_id,
    gender AS gender_name
FROM {{ ref("STG_DIMGender") }}
