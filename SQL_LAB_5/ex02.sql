-- 2. Рейсы, на которые продано менее половины билетов.

SELECT *
FROM flights
WHERE sold < (SELECT places / 2 FROM transport WHERE transport.num = flights.bus);
