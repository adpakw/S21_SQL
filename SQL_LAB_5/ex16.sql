-- 16. Маршруты из Самары в Саратов и обратно стоимостью более 400 рублей.

SELECT *
FROM routes
WHERE (dep = 'Самара' AND dest = 'Саратов')
   OR (dep = 'Саратов' AND dest = 'Самара')
   AND price > 400;
