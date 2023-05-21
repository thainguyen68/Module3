create database day3_database;
use day3_database;

create table class_room (
id int primary key auto_increment,
name varchar (50)
);
create table student(
id int primary key auto_increment,
name varchar(255) not null,
age int,
check (age >= 18),
gender varchar (4) not null,
check (gender = "Nam" or gender = "Nữ"),
phone_number varchar(10) unique,
avg double  default '0',
check (avg >= 0),
classroom_id int,
foreign key (classroom_id) references class_room(id)
);


alter table class_room
add column grade varchar(50) default '12';

select * from student;
select * from class_room;


insert into class_room (name) values 
("C0223i1"),
("C0223i12");

insert into student (name,age,gender,phone_number,avg,classroom_id) values 
("Thái",23,"Nam","0379452822",6.8,1),
("Thái 0",23,"Nam","0379452823",9.9,2),
("Huyền 1",24,"Nữ","0379452824",6,1),
("Thái 2",25,"Nam","0379452825",8,1),
("Huyền 3",26,"Nữ","0379452826",8.6,2);


-- Tìm ký tự của thuộc tính trong bảng!
select * from student
where name like "Thái%";

-- Tìm giá trị của thuộc tính trong bảng!
select * from student 
where gender in ("Nam"); 

-- Tìm kiếm và hiển thị theo thộc tính đã chọn!
select name, gender, avg from student
where avg > 7;

-- Mệnh đề ORDERBY//desc giảm dần còn deafaul là asc-tăng dần 
select * from student
order by avg desc;
-- Mệnh đề GROUPBY// 
select gender, count(gender) as soluong from student
group by gender
having soluong > 2;

-- Join
select * from student
join class_room on student.classroom_id = class_room.id;


-- Truy vấn sử dụng đến các toán tử AND,OR và NOT:
select * from student 
where not name = 'Thái' and (avg >8 or avg <8) and not avg = '8.6';




update student set name = "Thái đz" where id = 1;
delete from student where id = 1;

truncate student; -- xóa dữ liệu và reset thứ tự
drop table student;
drop table class_room;
