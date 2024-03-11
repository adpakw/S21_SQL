SELECT 
    (SELECT per.name FROM person per
    WHERE per.id = ord.person_id) AS NAME 
FROM person_order ord
WHERE ord.menu_id IN (13, 14, 18) AND ord.order_date = '2022-01-07'