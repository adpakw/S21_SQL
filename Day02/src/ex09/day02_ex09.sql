WITH
cheezie AS (
    SELECT p.name, m.pizza_name cheese FROM person_order po
    JOIN person p ON p.id = po.person_id AND p.gender = 'female'
    JOIN menu m ON m.id = po.menu_id AND m.pizza_name = 'cheese pizza'
    ORDER BY 1 ASC
),

pepperoni AS (
    SELECT p.name, m.pizza_name peper FROM person_order po
    JOIN person p ON p.id = po.person_id AND p.gender = 'female'
    JOIN menu m ON m.id = po.menu_id AND m.pizza_name = 'pepperoni pizza'
    ORDER BY 1 ASC
)

SELECT c.name FROM cheezie c 
JOIN pepperoni p ON c.name = p.name 
WHERE c.cheese IS NOT NULL AND p.peper IS NOT NULL
ORDER BY 1 