-- 1.Маршруты из Самары и Саратова и обратно стоимостью менее 1000 рублей.

insert into routes values(720, 'Самара', 'Саратов', '08:10:00', 660);
insert into routes values(721, 'Саратов', 'Самара', '08:10:00', 660);
insert into routes values(723, 'Самара', 'Саратов', '08:30:00', 590);
insert into routes values(724, 'Саратов', 'Самара', '08:30:00', 590);

SELECT *
FROM routes
WHERE (dep = 'Самара' AND dest = 'Саратов') OR (dep = 'Саратов' AND dest = 'Самара')
AND price < 1000;
