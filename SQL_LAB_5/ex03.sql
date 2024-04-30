-- 3. Список маршрутов, по которым выполняется единственный рейс в день.

SELECT *
FROM routes
WHERE num IN (
    SELECT num
    FROM (
        SELECT num, COUNT(*) AS num_flights
        FROM flights
        GROUP BY num, ddate
    ) AS subquery
    GROUP BY num
    HAVING MAX(num_flights) = 1
);
