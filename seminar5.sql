-- Создайте представление, в которое попадут автомобили стоимостью 
-- до 25 000 долларов
create view cost_car as
select cost
from cars
where cost < 25000;

select * from cost_car;

-- Изменить в существующем представлении порог для стоимости:
-- пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
alter view cost_car as 
select cost
from cars
where cost <30000;

select * from cost_car;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
create view by_mark as
select *
from cars
where mark = 'skoda'
union
select *
from cars
where mark = 'audi';

select * from by_mark;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
create table blood (
	an_id int auto_increment,
    an_name varchar(15),
    an_cost int not null,
    an_price int not null,
    an_group int,
    primary key (an_id)
    );

create table orders (
	ord_id int auto_increment,
    ord_datetime date,
    primary key (ord_id)
    );

insert into blood (an_name, an_cost, an_price, an_group)
values ("blood test", 100, 101, 1),
		("blood test", 110, 102, 2),
        ("blood test", 120, 103, 3),
        ("blood test", 130, 104, 4),
        ("blood test", 140, 105, 5),
        ("blood test", 150, 106, 6),
        ("blood test", 160, 107, 7),
        ("blood test", 170, 108, 8);

insert into orders (ord_datetime)
values ("2022-02-05"),
		("2022-02-06"),
        ("2022-02-07"),
        ("2022-02-08"),
        ("2022-02-09"),
        ("2022-02-10"),
        ("2022-02-11"),
        ("2022-02-12");
	
select an_id, ord_datetime, an_name, an_price from blood
left join orders
on orders.ord_id = blood.an_id
order by orders.ord_datetime;

/*Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение,
мы вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования оконной функции SQL,
но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD .
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат.
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.*/

create table train_station (
	train_id int,
    station varchar(25),
    station_time time
    );

insert into train_station 
values (110, "San Francisco", "10:00:00"),
		(110, "Redwood city", "10:54:00"),
        (110, "Palo Alto", "11:02:00"),
        (110, "San Jose", "12:35:00"),
        (120, "San Francisco", "11:00:00"),
        (120, "Palo Alto", "12:49:00"),
        (120, "San Jose", "13:30:00");

select *, if(timediff(lead(station_time) over(),
			station_time)>0,timediff(lead(station_time) over(),
			station_time),null ) as time_to_next_train
from train_station
group by station_time;
