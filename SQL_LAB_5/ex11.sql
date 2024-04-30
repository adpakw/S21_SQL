-- 11. Автобусы, которые не выполняли рейсы по маршрутам 176, 177, 178 и 179.

SELECT DISTINCT t.num
FROM transport t
LEFT JOIN flights f ON t.num = f.bus AND f.num IN (176, 177, 178, 179)
WHERE f.bus IS NULL;
