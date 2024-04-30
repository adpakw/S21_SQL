-- 20. Автобусы, которые вчера не выполняли рейсы по маршрутам 488, 177, 178 и 179.

insert into flights values(27,'B799MC97', current_date - interval '1 day', '20:00:00', 488, 3);

SELECT t.*
FROM transport t
LEFT JOIN (
    SELECT DISTINCT bus
    FROM flights
    WHERE ddate = '2024-04-29'
      AND num IN (488, 177, 178, 179)
) AS f ON t.num = f.bus
WHERE f.bus IS NULL;

