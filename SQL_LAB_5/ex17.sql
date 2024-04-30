-- 17. Рейсы, на которые все билеты проданы.

insert into flights values(22, 'C447MC99', current_date + 2*interval '1 day', '06:20:00', 688, 52);
insert into flights values(23, 'C447MC99', current_date + 1*interval '1 day', '06:20:00', 176, 52);

SELECT *
FROM flights
WHERE sold = (
    SELECT places
    FROM transport
    WHERE transport.num = flights.bus
);
