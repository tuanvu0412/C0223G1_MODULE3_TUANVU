create database ss11_jdbc;
use ss11_jdbc;

create table users(
id int auto_increment primary key,
user_name varchar(45),
email varchar(45),
country varchar(45)
);
insert into users(user_name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(user_name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(user_name, email, country) values('Vu','Vu@123','Kenia');
insert into users(user_name, email, country) values('Hung','Hung@che.uk','Kenia');
insert into users(user_name, email, country) values('Hoa','Hoa@che.uk','Kenia');