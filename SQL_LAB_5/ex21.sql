-- 21. Среднее количество рейсов в день по каждому маршруту.

SELECT num, AVG(num_flights) AS average_flights_per_day
FROM (
    SELECT num, ddate, COUNT(*) AS num_flights
    FROM flights
    GROUP BY num, ddate
) AS subquery
GROUP BY num;