create table salespeople
(
	snum int not null,
    sname varchar(10),
    city varchar (15),
    comm varchar(10)
);
insert into salespeople (snum, sname, city, comm)
values 
		    (1001,"peel","london",".12"),
        (1002,"serres","san jose",".13"),
        (1004,"motika","london",".11"),
        (1007,"rifkin","barcelona",".15"),
        (1003,"axelrod","new york",".10");
        
select * from salespeople;
---------------------------------------------------------------------------------------------
create table customers
(
	cnum int not null,
    cname varchar(10),
    city varchar (15),
    snum int,
    rating int
);
insert into customers (cnum, cname, city, snum, rating)
values 
		(2001,"Hoffman","London",100,1001),
		(2002,"Giovanni","Rome",200,1003),
		(2003,"Liu","SanJose",200,1002),
		(2004, "Grass","Berlin",300,1002),
		(2006,"Clemens","London",100,1001),
		(2008,"Cisneros","SanJose",300,1007),
		(2007,"Pereira","Rome",100,1004);

select * from customers;
---------------------------------------------------------------------------------------------

create table orders
(
	onum int not null,
    amt float,
    odate date,
    cnum int,
    snum int
);
insert into orders (onum, amt, odate, cnum, snum)
values 
		(3001,  18.69,1990/03/10,2008,1007),
		(3003, 767.19,10/03/1990,2001,1001),
		(3002,1900.10,10/03/1990,2007,1004),
		(3005,5160.45,10/03/1990,2003,1002),
		(3006,1098.16,10/03/1990,2008,1007),
		(3009,1713.23,10/04/1990,2002,1003),
		(3007,  75.75,10/04/1990,2004,1002),
		(3008,4723.00,10/05/1990,2006,1001),
		(3010,1309.95,10/06/1990,2004,1002),
		(3011,9891.88,10/06/1990,2006,1001);

select * from orders;
---------------------------------------------------------------------------------------------

-- Напишите запрос который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm.
-- (к первой или второй таблице, используя SELECT)
select city,sname,snum,comm from salespeople;

-- Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose.
-- (“заказчики”)
select rating, cname from customers;

-- Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений.
-- (уникальные значения в  “snum“ “Продавцы”)
select snum from salespeople
group by sname;

-- Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
-- Используется оператор "LIKE": (“заказчики”)
select * from customers
where cname like "G%";

-- Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
-- (“Заказы”, “amt”  - сумма)
select * from orders
where amt >1000;

-- Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в табличке “Заказы” выбрат наименьшее значение)
select min(amt) from orders;

-- Напишите запрос к табличке “Заказчики”, который может показать всех заказчиков,
-- у которых рейтинг больше 100 и они находятся не в Риме.
select * from customers
where rating > 100 and city = "rome";
