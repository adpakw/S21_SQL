-- Автобусные перевозки
-- Вариант для Postgres


create table transport (-- Автобусы
  num      char(10)  primary key, 	-- государственный номерной знак
  model   varchar(20)  not null, 	-- модель
  places   numeric (3)  not null	-- количество мест
);

create table routes (-- Маршруты
  num      numeric (4)  primary key,	-- номер маршрута
  dep       varchar(50)  not null, 	-- пункт отправления
  dest      varchar(50)  not null,	-- пункт прибытия
  duration  time  not null, 		-- время в  пути 
  price     numeric (7,2) 		-- стоимость
);

create table flights (-- Рейсы
  id           numeric (8)  primary key,			-- суррогатный ПК
  bus        char(10)   not null references transport, 	-- автобус
  ddate    date not null, 				-- дата отправления
  dtime    time not null,				-- время отправления
  num      numeric (4)  not null references routes, 	-- маршрут
  sold       numeric (3)  default  0 			-- количество проданных билетов
);

insert into transport values('H435TK177', 'ЛиАЗ-5256', 44);
insert into transport values('H445TK197', 'ЛиАЗ-5292', 50);
insert into transport values('B799MC97', 'Iveco M 23', 40);
insert into transport values('B798MC97', 'Setra S 215', 52);
insert into transport values('B797MC97', 'Setra S 215', 52);
insert into transport values('B447MC99', 'Setra S 415', 54);
insert into transport values('T447MC99', 'Volvo 9900', 51);
insert into transport values('C447MC99', 'Volvo 9900', 52);
insert into transport values('B335TK177', 'ЛиАЗ-5256', 44);
insert into transport values('A465TK197', 'ЛиАЗ-5292', 50);

insert into routes values(488, 'Москва', 'Тверь', '04:10:00', 600);
insert into routes values(423, 'Москва', 'Тверь', '03:30:00', 700);
insert into routes values(568, 'Москва', 'Клин', '02:50:00', 500);
insert into routes values(832, 'Москва', 'Клин', '03:05:00', 450);
insert into routes values(176, 'Москва', 'Волгоград', '06:20:00', 900);
insert into routes values(177, 'Москва', 'Волокомамск', '02:10:00', 400);
insert into routes values(178, 'Москва', 'Коломна', '02:10:00', 370);
insert into routes values(179, 'Москва', 'Пушкино', '01:20:00', 150);
insert into routes values(180, 'Москва', 'Самара', '05:10:00', 650);
insert into routes values(498, 'Тверь', 'Москва', '04:20:00', 600);
insert into routes values(484, 'Тверь', 'Москва', '03:40:00', 700);
insert into routes values(588, 'Клин',   'Москва', '03:00:00', 460);
insert into routes values(688, 'Волгоград', 'Москва', '06:10:00', 900);

insert into routes values(489, 'Москва', 'Тверь', '04:10:00', 600);
insert into routes values(424, 'Москва', 'Тверь', '03:30:00', 700);
insert into routes values(569, 'Клин', 'Москва', '02:50:00', 400);
insert into routes values(831, 'Клин','Москва', '03:05:00', 350);
insert into routes values(276, 'Волгоград', 'Самара', '04:20:00', 450);
insert into routes values(277, 'Волокомамск', 'Пушкино', '02:10:00', 300);
insert into routes values(278, 'Коломна', 'Москва', '02:20:00', 350);
insert into routes values(279, 'Пушкино', 'Клин','02:20:00', 250);
insert into routes values(280, 'Самара', 'Волгоград','04:10:00', 450);
insert into routes values(499, 'Тверь', 'Москва', '04:20:00', 600);
insert into routes values(425, 'Тверь', 'Москва', '03:40:00', 700);
insert into routes values(589, 'Москва', 'Коломна', '02:20:00', 360);
insert into routes values(689, 'Коломна', 'Москва', '02:30:00', 320);


insert into flights values(1, 'H435TK177', current_date + interval '1 day', '09:00:00', 488, 39);
insert into flights values(2, 'H435TK177', current_date + 2*interval '1 day', '09:00:00', 423, 0);
insert into flights values(3, 'H435TK177', current_date + 2*interval '1 day', '08:00:00', 568, 50);
insert into flights values(4,'H445TK197', current_date + 3*interval '1 day', '09:00:00', 832, 45);
insert into flights values(5, 'C447MC99',current_date - 2*interval '1 day', '09:00:00',  176, 39);
insert into flights values(6,'B798MC97', current_date - 2*interval '1 day', '07:00:00', 177, 40);
insert into flights values(7, 'B798MC97',current_date - 3*interval '1 day', '15:00:00', 178, 30);
insert into flights values(8, 'B798MC97',current_date + interval '1 day', '18:30:00', 179, 0);
insert into flights values(9, 'B447MC99', current_date + 2*interval '1 day', '19:00:00', 180, 0);
insert into flights values(11,'B799MC97', current_date + interval '1 day', '20:00:00', 498, 0);

insert into flights values(12,'T447MC99',current_date + interval '1 day', '11:00:00', 179, 0);
insert into flights values(13,'T447MC99',current_date - 3*interval '1 day', '09:50:00', 180, 40);
insert into flights values(14,'B799MC97', current_date + interval '1 day', '09:30:00', 498, 0);

insert into flights values(15,'B798MC97', current_date + interval '1 day', '10:00:00', 484, 0);
insert into flights values(16,'B447MC99', current_date - 4*interval '1 day', '06:00:00', 588, 50);
insert into flights values(17,'B447MC99', current_date + interval '1 day', '08:00:00', 688, 0);

-- commit;