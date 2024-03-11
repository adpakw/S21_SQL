SELECT id object_id, pizza_name object_name FROM menu
UNION 
SELECT id, name FROM person
ORDER BY 1, 2