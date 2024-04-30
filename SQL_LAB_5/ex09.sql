-- 9. Среднее количество проданных билетов по маршрутам из Москвы в Тверь.

SELECT AVG(sold) AS average_sold_tickets
FROM flights
WHERE num IN (
    SELECT num
    FROM routes
    WHERE dep = 'Москва' AND dest = 'Тверь'
);
