-- 5. Автобусы, которые сегодня выполняют рейсы по маршрутам 177 и 179.

insert into flights values(18,'B798MC97', current_date, '07:00:00', 177, 33);
insert into flights values(19,'C447MC99', current_date, '15:40:00', 179, 19);

SELECT DISTINCT bus
FROM flights
WHERE num IN (177, 179)
AND ddate = current_date;
