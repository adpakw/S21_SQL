-- 7. Рейсы по маршрутам с 488 на завтра и 423 на послезавтра.

SELECT *
FROM flights
WHERE (num = 488 AND ddate = current_date + 1)
   OR (num = 423 AND ddate = current_date + 2);
