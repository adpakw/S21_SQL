SELECT pizza_name, price, piz.name, visit_date FROM person_visits pv 
JOIN person p ON p.id = pv.person_id AND p.name = 'Kate'
JOIN pizzeria piz ON piz.id = pv.pizzeria_id 
JOIN menu m ON m.pizzeria_id = piz.id AND m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3