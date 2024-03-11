SELECT 
    (SELECT SUM(CAST(person_id AS INT)) FROM person_order WHERE order_date = '2022-01-07')
    -
    (SELECT SUM(CAST(person_id AS INT)) FROM person_visits WHERE visit_date = '2022-01-07')
    AS difference
