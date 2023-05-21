create database demo_day5;
use demo_day5;
create table students (
id int primary key auto_increment,
name varchar(255) not null,
address varchar(50) not null,
age int, check(age > 0),
sex int not null, check(sex = 1 or sex = 0),
email varchar(255) not null,
phone_number varchar(10) not null,
classes_id int,
foreign key (classes_id) references classes(id)
);

create table classes (
id int primary key auto_increment,
name varchar(255) not null
);

insert into classes (name) values
("C0223H1"),
("C0223I1"),
("C0622G1"),
("C0721H1"),
("C0821H1");

insert into students (name,address,sex,age,email,phone_number,classes_id) values
("Thái", "Hà Nội", 1, 23,"nvt.689@gmail", "0379452820",1),
("Dương", "Đà Nẵng", 1, 21,"duong.123@gmail", "0379452821",2),
("Ly", "Hồ Chí Minh", 1, 25,"ly.123@gmail", "0379452822",3),
("Ngũ", "Hà Nội", 0, 20,"ngu.123@gmail", "0379452823",4),
("Đức", "Hòa Bình", 1, 25,"duc.123@gmail", "0379452824",1),
("Vũ", "Đà Nẵng ", 1, 19,"vu.123@gmail", "0379452825",5),
("Hiếu", "Hồ Chí Minh", 1, 25,"hieu.123@gmail", "0379452826",2),
("Minh", "Hà Nội", 1, 21,"minh.123@gmail", "0379452827",5),
("Chữ", "Đà Nẵng", 1, 18,"chu.123@gmail", "0379452828",2),
("Dũng", "Đà Nẵng", 1, 18,"dung.123@gmail", "0379452828",2),
("Lâm", "Cà Mau", 1, 25,"lam.123@gmail", "0379452829",5);
-- ------------------------------------------------------------------------------->


-- Tạo index cho cột được chỉ rõ trong bảng:
CREATE UNIQUE INDEX index_name
ON students(name);
-- Unique index được sử dụng không chỉ để tăng hiệu suất, mà còn cho mục đích toàn vẹn dữ liệu. 
-- Một Unique index không cho phép bất kỳ bản sao giá trị nào được chèn vào trong bảng.

-- Thêm index cho bảng, với index mang tính duy nhất và không thể null
ALTER TABLE students ADD PRIMARY KEY (name);

-- Thêm index cho bảng, với index mang tính duy nhất nhưng có thể null
ALTER TABLE students ADD UNIQUE index_name (name);

-- Thêm index cho bảng, có thể trùng lặp
ALTER TABLE students ADD INDEX index_name (name);

-- Thêm index đặc biệt thường cho tìm kiếm văn bản
ALTER TABLE students ADD FULLTEXT index_name (name);

-- Xóa index đã tạo 
ALTER TABLE students DROP INDEX index_name;

-- ------------------------------------------------------------------------------->
-- "EXPLAIN Query" Bằng lệnh này bạn sẽ nhận ra được với câu Query của bạn, điều gì đang xảy ra và kiểu kết hợp (Join) nào đang diễn ra bên trong.
EXPLAIN SELECT * FROM students WHERE students.name = 'Lâm';  

-- ------------------------------------------------------------------------------->

select * from students;
select * FROM students WHERE students.name = 'Lâm'; 



drop table students;