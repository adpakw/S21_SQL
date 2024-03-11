WITH 
male AS (
    SELECT piz.name AS pizzeria_name, COUNT(piz.name) AS countm FROM person_visits pv
    JOIN pizzeria piz ON pv.pizzeria_id = piz.id
    JOIN person p ON p.id = pv.person_id AND gender  = 'male'
    GROUP BY piz.name
),

female AS (
    SELECT piz.name AS pizzeria_name, COUNT(piz.name) AS countf FROM person_visits pv
    JOIN pizzeria piz ON pv.pizzeria_id = piz.id
    JOIN person p ON p.id = pv.person_id AND gender  = 'female'
    GROUP BY piz.name
)

SELECT m.pizzeria_name FROM male m
JOIN female f ON m.pizzeria_name = f.pizzeria_name AND countm <> countf
ORDER BY 1