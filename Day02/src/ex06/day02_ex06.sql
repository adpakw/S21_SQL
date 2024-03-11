SELECT pizza_name, piz.name FROM person_order po
JOIN person p ON p.id = po.person_id AND p.name IN ('Denis', 'Anna')
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria piz ON piz.id = m.pizzeria_id
ORDER BY 1, 2
