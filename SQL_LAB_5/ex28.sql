-- 28. Автобусы, которые не были в рейсах

SELECT t.*
FROM transport t
LEFT JOIN flights f ON t.num = f.bus
WHERE f.id IS NULL;
