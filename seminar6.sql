-- Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 

delimiter $$
create function even_nums(num int)

returns varchar(20)
deterministic
begin
	declare eve int default 0;
	declare res varchar(255) default "1" ;
    
	while eve < 10 do
		set eve = eve +2;
        set res = concat(res,",", eve);
	end while;
return res;
end $$;
delimiter ;

select even_nums(10)

-- Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

drop function sec_days;
delimiter $$
create function sec_days(num int)

returns varchar(50)
deterministic
begin
	declare secondsinday int default 86400;
    declare secondsinhour int default 3600;
    declare secondsinminute int default 60;
    declare days int default 0;
    declare days_sec int default 0;
    declare hours int default 0;
    declare hours_sec int default 0;
    declare mins int default 0;
    declare mins_sec int default 0;
    declare sec int default 0;
    declare res varchar(60);
    
    
	set days = round(num/86400);
    set days_sec = num - (86400*days);
    set hours = round(days_sec/3600);
    set hours_sec = days_sec - (3600*hours);
    set mins = (hours_sec div 60);
    set mins_sec = hours_sec - (60*mins);
    set sec = round(mins_sec);
	set res = concat(days," days ",hours," hours ",mins," mins ",sec, " sec ");
    return res;
end $$
delimiter ;
select sec_days(49516);

