SELECT po.order_date action_date, p.name || ' (age:' || p.age || ')' person_information FROM person_order po
JOIN person p ON po.person_id = p.id
ORDER BY 1, 2