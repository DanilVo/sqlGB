create table orders
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeid varchar(10) unique index,
    amount float,
    orderstatus varchar(15)
);

insert orders (employeeid,amount,orderstatus)
values  (e01,15.0,open),
        (e02,25.50,open),
        (e03,100.70,closed),
        (e04,22.18,open),
        (e05,9.50,cancelled);

select orderstatus,
case 
    when orderstatus = 'open' then 'order is open'
    when orderstatus = 'closed' then 'order is closed'
    when orderstatus = 'cancelled' then 'order is cancelled'
end as res
from orders; 