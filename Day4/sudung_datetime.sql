create database demo_datetime;
use demo_datetime;
create table demo_date_time(
id int primary key auto_increment,
name varchar(50),
my_time time,
my_date date,
time_demo datetime
)
;
use demo_datetime;



-- THÊM NGÀY
-- thêm ngày.
select adddate('2023-05-17',50);
-- quý , giờ , ngày	
select date_add('2023-01-01', INTERVAL 1 QUARTER);
select date_add('2023-01-01 12:30:00', INTERVAL 1 HOUR);
select date_add('2023-01-01', INTERVAL 1 YEAR);
-- date_sub(date, INTERVAL) <=> date_add(date, INTERVAL)




-- trả về ngày.
select curdate();
select current_date();
-- trả về giờ
select curtime();
select current_time();
-- trả về ngày tháng năm thời gian hiện tại
select now();
-- trả về tên ngày trong tuần
SELECT DAYNAME('2023-5-18');
-- với số ngày đã cho hàm trả về giá trị date
SELECT FROM_DAYS(81234);
   -- Hàm trả về ngày cuối cùng của tháng đó
SELECT LAST_DAY('2023-05-18');

-- chỉ tính khoảng cách 
select datediff('2023-5-18 00:00:00','2023-5-17 23:59:59');
-- thực hiện pháp toán + số học trên date
select  CONVERT_TZ('2023-01-01 12:00:00','+7:00','+10:00') ;
--  chuyển đổi múi h.
-- MONTH lấy số tháng--
SELECT MONTH('1996-10-28');
SELECT year('1996-10-28');
-- trả về tên tháng
SELECT MONTHNAME('2023-10-18');
-- YEARWEEK() trả về năm và tuần cho 1 ngày
SELECT YEARWEEK('1996-10-28');
-- WEEKDAY() trả về chỉ mục ngày trong tuần 0 là thứ 2
SELECT WEEKDAY('2023-5-18 22:23:00');
-- Định dạng giá trị date theo chuỗi format.
-- %H: lấy giờ
-- %M: lấy tháng theo tên
-- %m: lấy tháng theo số
SELECT DATE_FORMAT('2023-5-18 06:30:16', '%H %m %S %W %M %Y');

