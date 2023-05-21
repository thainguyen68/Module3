-- tạo database
create database demo_database_c02i1;
-- sử dụng database
use demo_database_c02i1;
-- tạo bảng
create table student(
id int primary key auto_increment,
name varchar(50),
age int,
gender varchar(10)
);
-- truy vấn tất cả các thuộc tính
select * from student;
-- thêm 1 cột trong bảng
alter table student 
add column gender varchar(10);
-- thêm record
insert into student(id, name, age, gender) values 
(1, "Duong", 24, "Male"),
(2, "Thai", 26, "Male"),
(3, "Ly", 30, "Male");
insert into student(name, age, gender) values 
("Minh", 31, "Male");

-- sửa thông tin:
update student set name = "Thai123" where id = 1 ;
-- xóa record
delete from student where id = 4;
-- xóa bảng
drop table student;
