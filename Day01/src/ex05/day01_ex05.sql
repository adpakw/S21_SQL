SELECT 
    per.id AS "person.id",
    per.name AS "person.name",
    per.age,
    per.gender,
    per.address,
    piz.id AS "pizzeria.id",
    piz.name AS "pizzeria.name",
    piz.rating
FROM person per, pizzeria piz
ORDER BY per.id, piz.id