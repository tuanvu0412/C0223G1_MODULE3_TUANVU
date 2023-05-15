create database management;
use management;
create table class(
id int primary key,
`name` varchar(45)
);
insert into class value(1,"C0223G1");
create table teacher(
id int primary key,
`name` varchar(45),
age int,
country varchar(45)
);
insert into teacher value(1,"ChanhTv",40,"DaNang");
