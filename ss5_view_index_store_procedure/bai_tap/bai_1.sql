create database ss5_view_index_store_procedure;
use ss5_view_index_store_procedure;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_code INT NOT NULL,
    product_name VARCHAR(45) NOT NULL,
    product_price INT NOT NULL,
    product_amount INT NOT NULL,
    product_description VARCHAR(45),
    product_status VARCHAR(45)
);
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
value(01, "LAPTOP",1233,01,"mời fullbox","còn hàng"),
(02, "PC",1235,01,"mời fullbox","còn hàng"),
(03, "PHONE",1236,01,"mời fullbox","còn hàng"),
(04, "HEADPHONE",1237,01,"mời fullbox","còn hàng");
-- create indexes 
EXPLAIN select product_code, product_price from products where product_code = 01;
-- create unique index u_index_products
-- on products (product_code);
EXPLAIN select product_code, product_price from products where product_code =01;
EXPLAIN select product_code, product_price from products where product_price = '1100';
create index index_products 
on products (product_code, product_price);
select product_code, product_price from products where product_price = '1100';

-- create view
CREATE VIEW view_products (product_code , product_name , product_price , product_status) AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        products;
alter view view_products as
	select product_code, product_name, product_price, product_status
	from products;
select * from view_product;
drop view view_product;

 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 delimiter //
	create procedure get_product()
    begin
    select * from products;
    end
 // delimiter ;
 call get_product();
 
 -- Tạo store procedure thêm một sản phẩm mới
 delimiter //
	create procedure add_product()
    begin
    insert into products(product_code, 
    product_name, 
    product_price, 
    product_amount, 
    product_description, 
    product_status)
    value (077, 'mouse', 11000, 1, 'fullbox', 'còn hàng');
    end
 // delimiter ;
 call add_product();
 
 -- Tạo store procedure sửa thông tin sản phẩm theo id
 delimiter //
	create procedure edit_product()
    begin
    set sql_safe_updates = 01;
    update products
    set product_description = 'dell'
    where id = 1;
    set sql_safe_updates = 1;
    end
 // delimiter ;
 call edit_product();
 
-- Tạo store procedure xoá sản phẩm theo id
 delimiter //
	create procedure delete_product()
    begin
    set sql_safe_updates = 01;
    delete from products
    where id = 3;
    set sql_safe_updates = 02;
    end
 // delimiter ;
 call delete_product();

