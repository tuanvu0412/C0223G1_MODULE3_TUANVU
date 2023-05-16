create database ss3_quan_ly_ban_hang;
use ss3_quan_ly_ban_hang;

CREATE TABLE customer (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(45),
    c_age TINYINT
);
insert into customer(c_name,c_age)
value ("Minh Quan",10),
("Ngoc Oanh",20),
("Hong Ha",50);
CREATE TABLE orderr (
    o_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    o_date DATE,
    o_total_price INT,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);
	insert into orderr(c_id,o_date,o_total_price)
	value(1,"2006-03-21", null),
	(2,"2006-03-23",null),
	(1,"2006-03-16",null);
CREATE TABLE product (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(25),
    p_price INT
);
insert into product(p_name,p_price)
value ( "May Giat", 3),
 ( "Tu Lanh", 5),
 ( "Dieu Hoa", 7),
 ( "Quat", 1),
 ( "Bep Dien", 2);
CREATE TABLE order_dentail (
    o_id INT,
    p_id INT,
    PRIMARY KEY (o_id , p_id),
    od_qty INT,
    FOREIGN KEY (o_id)
        REFERENCES orderr (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
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
SELECT 
    o_id, o_date, o_total_price
FROM
    orderrách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
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