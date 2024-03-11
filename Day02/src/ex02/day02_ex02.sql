SELECT COALESCE(p.name, '-') AS person_name, visit_date, COALESCE(piz.name, '-') AS pizzeria_name FROM person_visits pv 
FULL JOIN person p ON p.id = pv.person_id
FULL JOIN pizzeria piz ON piz.id = pv.pizzeria_id
ORDER BY 1, 2, 3