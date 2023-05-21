create database day4;
use day4;
create table student (
id int primary key auto_increment,
name varchar(255) not null,
age int not null,
check(age > 0),
gender varchar (5) not null,
check(gender = "Nam" or gender = "Nữ"),
Phone_number varchar (10) not null unique,
diem_toan double not null default '0' ,
class_id int,
foreign key (class_id) references class_room(id) 
);

create table class_room(
id int primary key auto_increment,
name varchar (255) not null
);

select * from student;
select * from class_room;
select student.id, student.name, student.age, student.gender, student.phone_number,student.diem_toan, class_room.name from student
join class_room on student.class_id = class_room.id;

-- -------------------------------------------------------->
select sum(diem_toan) as tong_diem from student ;
select Avg(diem_toan) as diem_tb from student;
select gender,count(gender) as gioi_tinh from student
group by gender;
select student.name, diem_toan as diem_toan_cao_nhat from student
where diem_toan = (select max(diem_toan) from student);
select min(diem_toan) as diem_toan_thap_nhat from student
;
select upper(name) as ten_in_hoa from student;
select lcase(name) as ten_thuong from student;
select length(name) as do_dai_ky_tu from student;
select name,now() as thoi_gian from student
where name = "Thể";



insert into class_room (name) values
("12a"),
("12b"),
("12c");
insert into student (name,age,gender,phone_number,diem_toan,class_id) values 
("Thái",23,"Nam", "0379452820", 6.8, 1),
("Dương",21,"Nam", "0379452821", 8, 1),
("Ly",28,"Nam", "0379452822", 9, 2),
("Dức",27,"Nam", "0379452823", 6.8, 2),
("Vũ",30,"Nam", "0379452824", 7, 3),
("Ngũ",30,"Nữ", "0379452825", 8.6, 3);

update student set name = "Thái Nguyễn" where id = 1 ;
delete from student where id = 1;
truncate student;
drop table student;