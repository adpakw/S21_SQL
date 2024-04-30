-- 14. Средняя продолжительность рейсов по маршрутам из одного пункта в другой.

SELECT dep, dest, AVG(duration)::time AS average_duration
FROM routes
GROUP BY dep, dest;