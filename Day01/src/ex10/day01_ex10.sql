SELECT p.name person_name, m.pizza_name pizza_name, pi.name pizzeria_name FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON m.pizzeria_id = pi.id
ORDER BY 1, 2, 3