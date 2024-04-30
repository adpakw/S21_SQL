-- 4. Маршруты из Москвы и в Москву продолжительностью менее 3-х часов и более 6-ти.

SELECT *
FROM routes
WHERE (dep = 'Москва' OR dest = 'Москва') 
AND (duration < '03:00:00' OR duration > '06:00:00');
