create table sales
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    bucket int
);

insert sales (order_date,bucket)
values (2022-09-23, 45),
        (2022-09-22, 105),
        (2022-09-21, 206),
        (2022-09-20, 345),
        (2022-09-19, 402);

select bucket,
case 
    when bucket < 100 then 'low'
    when bucket >=100 and bucket <= 300 then 'middle'
else 'high'
end as res
from sales; 