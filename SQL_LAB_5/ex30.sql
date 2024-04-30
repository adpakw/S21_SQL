-- 30. Автобусы, бывшие в рейсах больше 3 раз с вместительностью больше 50

insert into flights values(29, 'C447MC99',current_date - 1*interval '1 day', '07:00:00',  302, 49);

SELECT t.*
FROM flights f
JOIN transport t ON f.bus = t.num AND f.ddate <= CURRENT_DATE AND t.places > 50
GROUP BY t.num
HAVING COUNT(*) > 2;
