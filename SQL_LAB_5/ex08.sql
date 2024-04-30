-- 8. Рейсы на сегодня, на которые билеты проданы меньше чем на половину мест в автобусе.

insert into flights values(20,'H445TK197', current_date, '09:40:00', 832, 24);

SELECT *
FROM flights
WHERE ddate = current_date
AND sold < (SELECT places / 2 FROM transport WHERE transport.num = flights.bus);