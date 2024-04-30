-- 18. Список маршрутов, по которым выполняется более 2-х рейсов в день.

insert into flights values(24, 'B335TK177',current_date + interval '1 day', '14:30:00', 179, 10);
insert into flights values(25, 'B799MC97',current_date + interval '1 day', '00:30:00', 498, 30);

SELECT *
FROM routes
WHERE num IN (
    SELECT num
    FROM (
        SELECT num, ddate, COUNT(*) AS num_flights
        FROM flights
        GROUP BY num, ddate
            HAVING COUNT(*) > 2
    ) AS subquery
);
