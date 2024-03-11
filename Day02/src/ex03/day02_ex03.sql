WITH
visit_dates AS (
SELECT visit_date FROM person_visits 
WHERE person_id = 1 OR person_id = 2
),

gen_dates AS (
SELECT 
    missing_date::date 
FROM generate_series(
    '2022-01-01'::date,
    '2022-01-10'::date,
    '1 day') AS g(missing_date)
)

SELECT 
    missing_date
FROM gen_dates g
LEFT JOIN visit_dates vd ON g.missing_date = vd.visit_date
WHERE vd.visit_date IS NULL
ORDER BY 1 ASC