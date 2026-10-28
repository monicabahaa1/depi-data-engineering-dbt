
SELECT
    CONVERT(INT, CONVERT(CHAR(8), date, 112)) AS date_key,
    date,
    YEAR(date) AS year,
    MONTH(date) AS month,
    DAY(date) AS day,
    DATENAME(MONTH, date) AS month_name,
    DATENAME(WEEKDAY, date) AS day_name
FROM {{ ref("STG_DIMDate") }}
