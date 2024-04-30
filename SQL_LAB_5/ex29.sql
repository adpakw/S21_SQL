-- 29. Количество маршрутов, которые проходят через город

SELECT city, COUNT(*) AS route_count
FROM (
    SELECT dep AS city FROM routes
    UNION ALL
    SELECT dest AS city FROM routes
) AS cities
GROUP BY city;
