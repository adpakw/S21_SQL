WITH 
male AS (
    SELECT piz.name AS pizzeria_name, COUNT(piz.name) AS countm FROM person_order po
    JOIN person p ON p.id = po.person_id AND gender  = 'male'
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria piz ON m.pizzeria_id = piz.id
    GROUP BY piz.name
),

female AS (
    SELECT piz.name AS pizzeria_name, COUNT(piz.name) AS countf FROM person_order po
    JOIN person p ON p.id = po.person_id AND gender  = 'female'
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria piz ON m.pizzeria_id = piz.id
    GROUP BY piz.name
),

only_male AS (
    SELECT p.name FROM male m
    RIGHT JOIN pizzeria p ON p.name = m.pizzeria_name
    WHERE countm IS NULL
),

only_female AS (
    SELECT p.name FROM female f
    RIGHT JOIN pizzeria p ON p.name = f.pizzeria_name
    WHERE countf IS NULL
)
SELECT * FROM only_male
EXCEPT
SELECT * FROM only_female