create database student_c02_jdbc;
use student_c02_jdbc;
create table classes(
    id   int primary key auto_increment,
    name varchar(50)
);

select * from students;

create table students(
    id int primary key auto_increment,
    name varchar(255),
    age int, check ( age >= 18 and age<60),
    gender varchar(50),
    address varchar(255),
    class_id int,
    foreign key (class_id) references classes(id)
);