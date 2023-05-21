create database student_management;
use student_management;
create table students (
id int primary key auto_increment,
name varchar(50) not null,
address varchar(50) not null,
sex int default 1 not null,
age int not null,
check(age >= 18 and age <= 25),
email varchar(50) not null 	unique,
phone varchar(10) not null
);

create table classes (
id int primary key auto_increment,
name varchar(50) not null unique
);

alter table students
add column classId int;
alter table students
add foreign key (classId) references classes(id);

insert into classes (name) values
("C0421H1"),
("C051H1"),
("C061H1"),
("C0721H1"),
("C0821H1");
insert into students (name,address,sex,age,email,phone,classId) values
("Thái", "Hà Nội", 1, 23,"nvt.689@gmail", "0379452820",1),
("Dương", "Đà Nẵng", 1, 21,"duong.123@gmail", "0379452821",2),
("Ly", "Hồ Chí Minh", 1, 25,"ly.123@gmail", "0379452822",3),
("Ngũ", "Hà Nội", 0, 20,"ngu.123@gmail", "0379452823",4),
("Đức", "Hòa Bình", 1, 25,"duc.123@gmail", "0379452824",1),
("Vũ", "Đà Nẵng ", 1, 19,"vu.123@gmail", "0379452825",5),
("Hiếu", "Hồ Chí Minh", 1, 25,"hieu.123@gmail", "0379452826",2),
("Minh", "Hà Nội", 1, 21,"minh.123@gmail", "0379452827",5),
(" Anh", "Đà Nẵng", 1, 18,"dung.123@gmail", "0379452828",2),
("Lâm", "Cà Mau", 1, 25,"lam.123@gmail", "0379452829",5);

select * from students;
select * from classes;
select* from students
where sex = 1;
select* from students
where age <20 ;
select * from students
where address = "Hà Nội" or address ="Hồ Chí Minh" or address ="Đà Nẵng";
select * from students
where address != "Hà Nội";
select * from students 
where name like "H%";
select * from students
where name like  "% Anh";
select students.id, students.name, students.address, students.sex, students.age, students.email, students.phone, classes.name from students
join classes on students.classId = classes.id
where classes.name = "C0821H1";


truncate students;
drop table students;
drop table classes;
