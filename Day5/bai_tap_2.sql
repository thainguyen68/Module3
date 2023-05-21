create database student_management2;
use student_management2;

-- 1. Tạo bảng students với các mô tả trên
create table students (
id int primary key auto_increment,
name varchar(50) not null,
address varchar(50) not null,
sex int default 1 not null,
check(sex = 1 or sex = 0),
age int not null,
check(age >= 18 and age <= 25),
email varchar(50) not null unique,
phone varchar(10) not null
);

-- 2.Tạo bảng classes với các mô tả trên
create table classes (
id int primary key auto_increment,
name varchar(50) not null unique
);

-- 3.Bổ sung thêm cột classId vào bảng students
alter table students add column class_id int;

-- 4.Thêm classId làm khóa ngoại của bảng students
alter table students add constraint foreign key (class_id) references classes(id);

-- 5.Thêm 5 lớp học vào bảng classes
insert into classes (name) values 
("c0223d1"), 
("c0223e1"), 
("c0223g1"), 
("c0223h1"), 
("c0223i1");

-- 6.Thêm 10 sinh viên vào bảng students
insert into students (name, address, sex, age, email, phone, class_id ) values
("Thái", "Hà Nội", 1, 23, "thai@gmail.com" ,"0379452820", 5),
("Dương", "Hà Nội", 1, 18,"duong@gmail.com" , "0379452821", 5),
("Ly", "Hà Nội", 1, 19,"ly@gmail.com" , "0379452822", 1),
("Dũng", "Hà Giang", 1, 20,"dung@gmail.com" , "0379452823", 4),
("Đức", "Hà Nội", 1, 21,"duc@gmail.com" , "0379452824", 5),
("Vũ", "Thanh Hóa", 1, 24,"vu@gmail.com" , "0379452825", 5),
("Hiếu", "Hà Nội", 1, 25,"hieu@gmail.com" , "0379452826", 5),
("Minh", "Hồ Chí Minh", 1, 25,"minh@gmail.com" ,"0379452827", 2),
("Ngũ", "Đà Nẵng", 0, 22,"ngu@gmail.com" , "0379452828", 3),
("Lâm", "Hà Nội", 1, 23,"lam@gmail.com" , "0379452829", 5);

-- 7.Hiển thị danh sách học viên theo tên giảm dần
select * from students 
order by name desc;

-- 8.Hiển thị danh sách học viên theo tuổi tăng dần
select * from students
order by age;

-- 9.Hiển thị tổng số lượng học viên của mỗi lớp
select classes.name, count(classes.name) as tong_so_hs_cua_lop from students
join classes on students.class_id = classes.id
group by classes.name;

-- Tạo view class:
create view student_infor as
select classes.name, count(classes.name) as so_luong_hs from students
join classes on students.class_id = classes.id
group by classes.name;

-- 10.Hiển thị lớp có số lượng học viên là đông nhất
select * from student_infor
where so_luong_hs = (select max(so_luong_hs) from student_infor) ;


-- 11.Hiển thị lớp có số lượng học viên là ít nhất
select * from student_infor
where so_luong_hs = (select min(so_luong_hs) from student_infor) ;


-- 12.Thống kê số lượng học viên theo địa chỉ
select address, count(address) as so_luong_hs from students
group by address;

-- 13.Hiển thị những lớp có số lượng học viên lớn hơn 5
select * from student_infor
where so_luong_hs > 5;

-- 14.Hiển thị những thành phố có số lượng học viên lớn hơn 5
select address, count(address) as so_hoc_sinh from students
group by address
having so_hoc_sinh > 5;

-- 15.Hiển thị học viên có tuổi lớn nhất
-- c1:
select *from students
where age = (select max(age) from students);
-- c2:
select * from students
order by age desc
limit 1;

-- 16. Hiển thị học viên có tuổi nhỏ nhất
select * from students
where age = (select min(age) from students);

-- 17.Xóa tất cả học viên có quê ở Hà Nội
delete from students where address = "Hà Nội";
select * from students ;

-- 18.Cập nhật thông tin của học viên có quê ở Hà Nội thành giới tính nữ
update students set sex = 0 where address = "Hà Nội" ;

-- 19.Hiển thị học viên có số tuổi lớn thứ hai
delimiter //
create procedure get_2nd_max_age()
begin
select max(age) from students into @max_age;
select * from students where age = ( select max(age) from students where age < @max_age);
end
// delimiter ;
 call get_2nd_max_age();
 
-- 20.Hiển thị học viện có số tuổi nhỏ thứ hai
delimiter //

delimiter //
create procedure get_2nd_min_age()
begin
select min(age) from students into @min_age;
select * from students where age = ( select min(age) from students where age > @min_age);
end
// delimiter ;

call get_2nd_min_age();



-- -------------------------------------------------------------------------------->

delete from students;
truncate students;
drop table students;
drop table classes;

