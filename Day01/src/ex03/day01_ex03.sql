SELECT order_date action_date, person_id FROM person_order
UNION
SELECT visit_date, person_id FROM person_visits
ORDER BY action_date ASC, person_id DESC