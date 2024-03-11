SELECT pizza_name, p.name AS pizzeria_name, price FROM menu m
JOIN pizzeria p ON p.id = m.pizzeria_id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1, 2