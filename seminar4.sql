-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
select mark,count(mark) as carcolor from auto
where mark in ("bmw")
union
select mark,count(mark) as carcolor from auto
where mark in ("lada");

-- 2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT count(*), mark, ((select count(*) from auto) - count(*))
FROM auto
group by mark;

-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
__LEFT JOIN__
select test_a.id from test_a
left join test_b
on test_a.id = test_b.id
where test_b.id is null;

__RIGHT JOIN__
select test_a.id from test_b
right join test_a
on test_b.id = test_a.id
where test_b.id is null;
