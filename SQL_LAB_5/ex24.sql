-- 24. Маршруты из Москвы, по которым нет рейсов на следующую неделю.

-- insert into flights values(28,'C447MC99', current_date + interval '7 day', '12:00:00', 176, 52);

SELECT r.*
FROM routes r
LEFT JOIN flights f ON r.num = f.num
AND f.ddate >= (SELECT (DATE_TRUNC('week', CURRENT_DATE) + INTERVAL '7' DAY)::date) 
AND f.ddate <= (SELECT (DATE_TRUNC('week', CURRENT_DATE) + INTERVAL '14' DAY - INTERVAL '1' DAY)::date)
WHERE r.dep = 'Москва' AND f.num IS NULL;
