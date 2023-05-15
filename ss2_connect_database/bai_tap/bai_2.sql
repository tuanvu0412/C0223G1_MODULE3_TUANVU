create database QuanLyBanHang;
use QuanLyBanHang;

create table customer(
cId int auto_increment primary key,
cName varchar(45),
cAge bit
);

create table orderr(
oId int auto_increment primary key,
cId int,
oDate date,
oTotalprice int,
foreign key(cId) references customer(cId)
);

create table product(
pId int auto_increment primary key,
pName varchar(45),
pPrice int
);

create table orderDentail(
oId int,
pId int,
primary key(oId, pId),
odQTY int,
foreign key(oId) references orderr(oId),
foreign key(pId) references product(pId)
);