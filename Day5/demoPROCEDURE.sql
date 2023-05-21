create table Students(
student_Id int auto_increment primary key,
name varchar(50) not null,
address varchar(50) not null,
gender int not null default '1',
age int not null 
CHECK (age >= 18 AND age <= 25),
email varchar(50) not null unique,
phone varchar(10) not null);
select * from Students;

create table Classes(
class_id int auto_increment primary key,
class_name varchar(50) not null unique);

select * from Classes;

alter table Students add column classId int;
alter table Students add foreign key (classId) references Classes(class_id);

Insert into Classes(class_name) values
("C0223I1"),
("C0315G1"),
("C1011K1"),
("C1120J1"),
("C0423E1");
 Insert into Students(name, address, gender, age, email, phone, classId) values
 ("Hiếu", "Đà Nẵng", 1, 24, "hieu123@gmail.com", "0983989695", 1),
 ("Lâm", "Hà Nội", 0 , 24, "lam123@gmail.com", "0983989695", 1),
 ("Minh", "Đà Nẵng", 1 , 25, "minh123@gmail.com", "0983989695", 2),
 ("Dương", "Hồ Chí Minh", 0 , 19, "duong123@gmail.com", "0983989695", 2),
 ("Thái", "Hồ Chí Minh", 1 , 21, "thai123@gmail.com", "0983989695", 3),
 ("Ly", "Hà Nội", 0 , 25, "ly123@gmail.com", "0983989695", 3),
 ("Dũng", "Hồ Chí Minh", 1 , 18, "dung123@gmail.com", "0983989695", 4),
 ("Chữ", "Hà Nội", 0 , 23, "chu123@gmail.com", "0983989695", 4),
 ("Vũ", "Đà Nẵng", 1 , 25, "vu123@gmail.com", "0983989695", 5),
 ("Đức", "Hà Nội", 0 , 25, "duc123@gmail.com", "0983989695", 5);
 
 select * from Students;
 
 select Students.gender, Students.name from Students
 where gender = 1;
 
 select Students.age, Students.name from Students
 where age < 20;
 
 select Students.address, Students.name from Students
--  where address = "Hà Nội";
-- where address = "Đà Nẵng";
where address = "Hồ Chí Minh";

select Students.address, Students.name from Students
-- where address != "Hà Nội";
where NOT address = "Hà Nội";

select Students.address, Students.name from Students
where name like "H%";

Insert into Students values
(11,"Anh","Đà Nẵng", 0, 18, "anh123@gmail.com", "0983989695", 3);

select Students.name from Students
where Students.name = "Anh";

select Classes.class_name from Classes
where Classes.class_name = "C0821H1";
select_students



DELIMITER //
CREATE PROCEDURE get_all_students()
BEGIN 
	select * from Students;
END 
// DELIMITER ;    

call get_all_students();



delimiter //
create procedure select_students(in id int)
begin
if (select Students.student_Id from Students where Students.student_Id = id)
	then select * from Students where Students.student_Id = id;
else
	select "Không có học sinh";
end if;
END
// delimiter ;
call select_students(11);
call select_students(12);

select * from Students;

delimiter //
create procedure select_students1(out result double)
begin
	select avg(age) from Students into result;

END
// delimiter ;
call select_students1 (@result1);
select @result1;
select * from Students where age > @result1;
select * from Students where age < @result1;
set @result1 = "hello world";
set @id = 11;
call select_students1 (12,@result1);
select @result1;


delimiter //
create procedure select_students2(out result double)
begin
	select avg(age) from Students into result;
    insert into Classes(class_name) value ("C0523H1");
END
// delimiter ;
select * from Students;
call select_students2(@result);
select @result;
select * from Classes;
delete from Classes where class_id = 1;
delete from Students where classId = 1;
	  

delimiter //
create procedure delete_classes(in class_id int)
begin   
	delete from Students where classId = class_id;
	delete from Classes where class_id = class_id;
END
// delimiter ;
call delete_classes(1);

-- in/out
delimiter //
create procedure demo_inout(inout number int)
begin   
	set number = number + 10;
END
// delimiter ;

set @value = 100;
call demo_inout(@value);
select @value;

 