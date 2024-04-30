-- 12. Среднее количество рейсов в день для каждого автобуса.

SELECT bus, AVG(num_flights) AS average_flights_per_day
FROM (
    SELECT bus, ddate, COUNT(*) AS num_flights
    FROM flights
    GROUP BY bus, ddate
) AS subquery
GROUP BY bus;
