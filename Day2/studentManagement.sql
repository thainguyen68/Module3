-- Tạo database
create database StudentManagement;
-- Sử dụng database
use StudentManagement;

-- Tạo bảng student: 
create table student (
id int primary key auto_increment,
name varchar(50) not null,
gender varchar(20) not null,
check (gender = "Nam" or gender = "Nữ"),
phoneNum varchar(10) unique,
avg double default '0',
check (avg >= 0),
rankStudent int,
foreign key (rankStudent) references rankStudent(id)
);

-- Tạo bảng xếp loại
create table rankStudent (
id int primary key auto_increment,
name varchar(5),
check (name = "A" or name = "B")
);


-- Truy vấn các thuộc tính:
select * from student;
select * from rankStudent;

-- Tạo thêm cột trong bảng:
-- alter table student
-- add column rankStudent varchar (5);


-- Thêm bản ghi (record)
-- -- Thêm ghi id tự tăng bằng cách sử dụng auto_increment
insert into rankStudent(name) values ("A"),("B");

insert into student (id,name,gender,phoneNum,avg,rankStudent) values 
(1, "Thái1", "Nam", "0123456766" ,9.9, 2),
(2, "Thái2", "Nam","0123456799" , 6.8, 1),
(3, "Ly", "Nam","0123456788" , 8.6, 2),
(4, "Dương", "Nam","0123456708" , 8.6, 1);

-- check các trường nhập sai:
insert into student (id,name,gender,phoneNum,avg,rankStudent) values 
(1, "Thái1", "Nam","0123456777" , 9.9, 1);
insert into student (id,name,gender,phoneNum,avg,rankStudent) values 
(10, "Dương", "BD","0123456707" , 10, 2);


-- Tìm ký tự của thuộc tính trong bảng!
select * from student
where name like "Thái%";

-- Tìm giá trị của thuộc tính trong bảng!
select * from student 
where gender in ("Nam"); 

-- Tìm kiếm và hiển thị theo thộc tính đã chọn!
select id, gender, avg from student
where avg > 7;


-- Truy vấn sử dụng đến các toán tử AND,OR và NOT:
select * from student 
where not name = 'Thái' and (avg >8 or avg <8) and not avg = '8.6';




-- Sắp xếp //desc giảm dần còn deafaul là tăng
select * from student
order by avg desc;


-- Sửa thông tin:
update student set name = "Thai" where id = 3;

-- Xóa thông tin:
delete from student where name = "Thái1";

-- Xóa bảng:
drop table student;

