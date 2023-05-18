create database ss2;
use ss2;

create table class(
id int primary key auto_increment,
name varchar(20)
);
create table room(
id int primary key auto_increment,
name varchar(20),
class_id int,
foreign key(class_id) references class(id)
);
create table jame(
`account` varchar(50) primary key,
`password` varchar(50)
);
create table student(
id int primary key auto_increment,
name varchar(50),
birthday date,
gender boolean,
email varchar(50),
`point` float,
class_id int,
`account` varchar(50) unique,
foreign key (class_id) references class(id),
foreign key (`account`) references jame(`account`)
);

create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date,
salary double
);

create table instructor_class(
 class_id int,
 instructor_id int,
 start_time date,
 end_time date,
 primary key (class_id, instructor_id),
 foreign key(class_id) references class(id),
 foreign key(instructor_id) references instructor(id)
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
 
select *
from class
right join student
on class.id = student.class_id;
select id,`name`
from student id
where `name`like'%hai' or`name` like '%huynh';
select *
from student 
where `point` > 5;

select *
from student  
where `name`like'nguyen%';

select count(`point`), `point`
from student
group by point;

select count(`point`),`point`
from student
group by `point`
having `point`>5;

SELECT COUNT( `point`),`point`
 FROM student
 WHERE `point` >5
 group by`point`
 having count(*)>=2;
 
 
 select *
 from student 
 join class 
 on class.id=student.class_id
 where class.`name`="c1121g1"	
 order by student.name ASC ;
 
-- 1.             Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp ( yêu cầu viết code ra giấy )
select class.name, count(student.id)
 from class
 join student on student.id=class.id
 group by class.name;
-- 2.             Tính điểm lớn nhất của mỗi các lớp ( yêu cầu viết code ra giấy )
 select class.name, max(student.`point`) as maxPoint
 from class
 join student on class.id=student.id
 group  by class.name;
-- 3.             Tình điểm trung bình  của từng lớp ( yêu cầu viết code ra giấy )
select class.name,avg(student.`point`) as tb
from class
right join student on class.id=student.id
group by class.name;
-- 4.             Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. ( yêu cầu viết code ra giấy )
select instructor.name,instructor.birthday
from instructor
union
select student.name,student.birthday
from student;
-- 5.             Lấy ra top 3 học viên có điểm cao nhất của trung tâm. ( yêu cầu viết code ra giấy )
	select student.name,student.point
    from student
    order by student.`point` desc
    limit 3;
    
-- 6.            Lấy ra các học viên có điểm số là cao nhất của trung tâm. ( yêu cầu viết code ra giấy )
 select student.name, student.point
 from student
 order by student.`point` desc
 limit 1;
 
--  1. Đánh index cho cột name

-- 2. Xoá index cho cột name
-- 3. Tạo view chứa thông tin id, name của student
--  