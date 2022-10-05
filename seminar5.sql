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