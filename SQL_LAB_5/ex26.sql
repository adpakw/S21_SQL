-- 26. Маршруты, по которым ездили последние 2 дня 

SELECT DISTINCT r.*
FROM routes r
JOIN flights f ON r.num = f.num
WHERE f.ddate >= CURRENT_DATE - INTERVAL '2' DAY AND f.ddate <= CURRENT_DATE
