SELECT p.name FROM person_order po
JOIN person p ON p.id = po.person_id AND p.gender = 'male' AND p.address IN ('Moscow', 'Samara')
JOIN menu m ON m.id = po.menu_id AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC 

