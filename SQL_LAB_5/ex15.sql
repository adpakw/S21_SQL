-- 15. Маршруты в Коломну, по которым нет рейсов на завтра.

insert into routes values(909, 'Тверь', 'Коломна', '02:00:00', 150);
insert into routes values(910, 'Коломна', 'Тверь', '02:00:00', 150);
insert into flights values(21, 'H435TK177', current_date + interval '1 day', '10:30:00', 909, 30);

SELECT *
FROM routes
WHERE dest = 'Коломна'
AND num NOT IN (
    SELECT num
    FROM flights
    WHERE ddate = current_date + 1
);
