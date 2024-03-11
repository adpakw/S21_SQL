WITH 
identifiers AS (
    SELECT id AS menu_id 
    FROM (SELECT id FROM menu)
    WHERE id NOT IN (SELECT DISTINCT(menu_id) FROM person_order)   
    ORDER BY 1
)

SELECT pizza_name, price, p.name pizzeria_name FROM identifiers i 
JOIN menu m ON m.id = i.menu_id
JOIN pizzeria p ON p.id = m.pizzeria_id
ORDER BY 1, 2