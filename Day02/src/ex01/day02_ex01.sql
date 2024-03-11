SELECT 
    missing_date::date 
FROM generate_series(
    '2022-01-01'::date,
    '2022-01-10'::date,
    '1 day') AS g(missing_date)
LEFT JOIN 
(SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) p ON 
g.missing_date = p.visit_date
WHERE p.visit_date IS NULL
ORDER BY 1 ASC