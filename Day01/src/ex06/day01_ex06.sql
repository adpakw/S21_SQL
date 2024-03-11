SELECT po.order_date action_date, p.name person_name FROM person_order po
JOIN person p ON po.person_id = p.id
UNION
SELECT pv.visit_date, p.name FROM person_visits pv
JOIN person p ON pv.person_id = p.id
ORDER BY action_date ASC, person_name DESC