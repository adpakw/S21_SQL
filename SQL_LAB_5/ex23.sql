-- 23. Самые продолжительные рейсы по маршрутам из одного пункта в другой. (Например, из Москвы в Тулу можно доехать за 2 ч., 2.5 и 3 ч. – самый продолжительный рейс – 3 часа. Надо выдать его номер).
-- НЕ РЕЙСЫ ПО МАРШРУТАМ, А ПРОСТО МАРШРУТЫ

SELECT r.*
FROM routes r
JOIN (
    SELECT dep, dest, MAX(duration) AS max_duration
    FROM routes
    GROUP BY dep, dest
) AS max_durations 
ON r.dep = max_durations.dep 
AND r.dest = max_durations.dest 
AND r.duration = max_durations.max_duration
AND r.num = (
    SELECT MIN(num)
    FROM routes
    WHERE dep = r.dep AND dest = r.dest AND duration = max_durations.max_duration
)
ORDER BY 2, 3;