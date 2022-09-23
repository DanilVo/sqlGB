CREATE TABLE Customer
(
	id int primary key AUTO_INCREMENT,
    Age int,
    FirstName VARCHAR(20),
    LastName VARCHAR(20)
);

insert Customer (age,firstname,lastname)
values (22,'Danil','Volobuyev')


#SELECT * FROM myfirst.smartphones;
#SELECT Manufacter,price FROM smartphones WHERE ProductCount > 2;
#Select * from smartphones where Manufacter = 'Samsung';
#select * from smartphones where ProductName REGEXP '[I]';
#select * from smartphones where ProductName REGEXP '[S]';
#select * from smartphones where ProductName REGEXP '[0-9]';
#select * from smartphones where ProductName REGEXP '[8]';