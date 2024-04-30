-- 25. Маршруты, на которых нет ни одного проданного билета.

SELECT r.*
FROM routes r
LEFT JOIN (
    SELECT num, COUNT(*) AS num_sold_tickets
    FROM flights
    GROUP BY num
) AS sold_tickets ON r.num = sold_tickets.num
WHERE num_sold_tickets IS NULL;
