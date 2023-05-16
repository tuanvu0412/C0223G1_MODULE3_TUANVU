create database ss3_quan_ly_ban_hang;
use ss3_quan_ly_ban_hang;

create table customer(
c_id int auto_increment primary key,
c_name varchar(45),
c_age tinyint
);
insert into customer(c_name,c_age)
value ("Minh Quan",10),
("Ngoc Oanh",20),
("Hong Ha",50);
create table orderr(
o_id int auto_increment primary key,
c_id int,
o_date date,
o_total_price int,
foreign key(c_id) references customer(c_id)
);
	insert into orderr(c_id,o_date,o_total_price)
	value(1,"2006-03-21", null),
	(2,"2006-03-23",null),
	(1,"2006-03-16",null);
create table product(
p_id int auto_increment primary key,
p_name varchar(25),
p_price int
);
insert into product(p_name,p_price)
value ( "May Giat", 3),
 ( "Tu Lanh", 5),
 ( "Dieu Hoa", 7),
 ( "Quat", 1),
 ( "Bep Dien", 2);
create table order_dentail(
o_id int,
p_id int,
primary key(o_id, p_id),
od_qty int,
foreign key(o_id) references orderr(o_id),
foreign key(p_id) references product(p_id)
);
insert into order_dentail(o_id,p_id,od_qty)
value (1,1,3),
 (1,3,7),
 (1,4,2),
 (2,1,1),
 (3,1,8),
 (2,5,4),
 (2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id,o_date,o_total_price
from orderr;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c_name,p_name
from customer
join orderr 
on customer.c_id=orderr.c_id 
join order_dentail 
on orderr.o_id=order_dentail.o_id
join product
on order_dentail.p_id=product.p_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.c_name
from customer
left join orderr
on customer.c_id=orderr.c_id
where orderr.o_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select orderr.o_id,orderr.o_date, sum(order_dentail.od_qty * product.p_price) total
from orderr
join order_dentail on orderr.o_id=order_dentail.o_id
join product on order_dentail.p_id=product.p_id
group by orderr.o_id;