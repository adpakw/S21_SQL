SELECT po.order_date action_date, p.name || ' (age:' || p.age || ')' person_information FROM person_order po
NATURAL JOIN person p 
ORDER BY 1, 2