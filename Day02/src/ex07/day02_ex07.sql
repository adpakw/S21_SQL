SELECT piz.name FROM person_visits pv
JOIN person p ON p.id = pv.person_id AND p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
JOIN pizzeria piz ON piz.id = pv.pizzeria_id
JOIN menu m ON m.pizzeria_id = pv.pizzeria_id AND m.price < 800