create database bt_sql_co_ban;

use bt_sql_co_ban;

CREATE TABLE loai_hang (
    ma_loai_hang INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_hang VARCHAR(50)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho VARCHAR(50),
    ten VARCHAR(50),
    ngay_sinh DATE,
    ngay_lam_viec DATE,
    dia_chi VARCHAR(50),
    dien_thoai VARCHAR(10),
    luong_co_ban DOUBLE,
    phu_cap DOUBLE
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ten_cong_ty VARCHAR(50),
    ten_giao_dich VARCHAR(50),
    dia_chi VARCHAR(50),
    email VARCHAR(50),
    dien_thoai VARCHAR(50),
    fax VARCHAR(50)
);

CREATE TABLE nha_cung_cap (
    ma_cong_ty INT PRIMARY KEY AUTO_INCREMENT,
    ten_cong_ty VARCHAR(50),
    ten_giao_dich VARCHAR(50),
    dia_chi VARCHAR(50),
    dien_thoai VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE mat_hang (
    ma_hang INT PRIMARY KEY AUTO_INCREMENT,
    ten_hang VARCHAR(50),
    ma_cong_ty INT,
    FOREIGN KEY (ma_cong_ty)
        REFERENCES nha_cung_cap (ma_cong_ty),
    ma_loai_hang INT,
    FOREIGN KEY (ma_loai_hang)
        REFERENCES loai_hang (ma_loai_hang),
    so_luong BIGINT,
    don_vi_tinh VARCHAR(50),
    gia_hang DOUBLE
);

CREATE TABLE don_dat_hang (
    so_hoa_don INT PRIMARY KEY AUTO_INCREMENT,
    ma_khach_hang INT,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    ma_nhan_vien INT,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    ngay_dat_hang DATE,
    ngay_giao_hang DATE,
    ngay_chuyen_hang DATE,
    noi_giao_hang VARCHAR(50)
);

CREATE TABLE chi_tiet_dat_hang (
    so_hoa_don INT,
    FOREIGN KEY (so_hoa_don)
        REFERENCES don_dat_hang (so_hoa_don),
    ma_hang INT,
    FOREIGN KEY (ma_hang)
        REFERENCES mat_hang (ma_hang),
    gia_ban DOUBLE,
    so_luong BIGINT,
    muc_giam_gia FLOAT,
    PRIMARY KEY (so_hoa_don , ma_hang)
);

insert into nhan_vien values (1,"le","hung","1985-02-03","2000-03-03","Ha Noi","0772658658",3000000,500000);
insert into nhan_vien values (2,"vi","lam","1985-03-04","2002-03-03","QN","0772658657",4000000,500000);
insert into nhan_vien values (3,"pham","duong","1989-03-06","2001-03-03","ND","0772658656",5000000,500000);
insert into nhan_vien values (4,"le","hieu","1987-03-04","2002-03-03","HCM","0772658655",4000000,500000);
insert into nhan_vien values (5,"tran","minh","1988-06-07","2002-03-03","DN","0772658654",6000000,500000);

insert into khach_hang values(1,"cty a","Gd a","HCM","a@gmail.com","0123456789","8424567889");
insert into khach_hang values(2,"cty b","Gd b","HN","b@gmail.com","0123456788","8424567888");
insert into khach_hang values(3,"cty c","Gd c","QN","c@gmail.com","0123456787","8424567887");
insert into khach_hang values(4,"cty d","Gd d","DN","d@gmail.com","0123456786","8424567886");
insert into khach_hang values(5,"cty e","Gd e","ND","e@gmail.com","0123456785","8424567885");

insert into nha_cung_cap values (1,"cty a1","Gd a1","ND","a1@gmail.com","0123456785","8424567885");
insert into nha_cung_cap values (2,"cty b1","Gd b1","DN","b1@gmail.com","0123456785","8424567885");
insert into nha_cung_cap values (3,"cty c1","Gd c1","HN","c1@gmail.com","0123456785","8424567885");
insert into nha_cung_cap values (4,"cty d1","Gd d1","QN","d1@gmail.com","0123456785","8424567885");
insert into nha_cung_cap values (5,"cty e1","Gd e1","PT","e1@gmail.com","0123456785","8424567885");

insert into loai_hang values (1,"iphone 13");
insert into loai_hang values (2,"xiaomi note 11");
insert into loai_hang values (3,"samsung s21");
insert into loai_hang values (4,"nokia x");
insert into loai_hang values (5,"huawei y");

insert into mat_hang values (1,"Apple",1,1,20,"cai",10000000);
insert into mat_hang values (2,"xiaomi",2,2,60,"cai",90000000);
insert into mat_hang values (3,"samsung",3,3,70,"cai",80000000);
insert into mat_hang values (4,"nokia",4,4,40,"cai",70000000);
insert into mat_hang values (5,"huawei",5,5,55,"cai",60000000);

insert into don_dat_hang values (1,1,1,"2003-05-05","2003-05-10","2003-05-06","HCM");
insert into don_dat_hang values (2,2,2,"2006-05-05","2006-05-10","2006-05-06","HN");
insert into don_dat_hang values (3,3,3,"2003-05-05","2003-05-10","2003-05-06","QN");
insert into don_dat_hang values (4,4,4,"2003-05-05","2003-05-10","2003-05-06","DN");
insert into don_dat_hang values (5,5,5,"2005-05-05","2005-05-10","2005-05-06","ND");

insert into chi_tiet_dat_hang values (1,1,20000000,120,0.5);
insert into chi_tiet_dat_hang values (2,2,20000000,10,0.5);
insert into chi_tiet_dat_hang values (3,3,20000000,110,0.5);
insert into chi_tiet_dat_hang values (4,4,20000000,90,0.5);
insert into chi_tiet_dat_hang values (5,5,20000000,1,0.5);

SELECT 
    CONCAT(ho, ' ', ten) AS ho_ten,
    dia_chi,
    YEAR(ngay_lam_viec) AS nam_bat_dau_lam_viec
FROM
    nhan_vien;

select loai_hang.ma_loai_hang,ten_loai_hang,so_luong,gia_hang from mat_hang join loai_hang on mat_hang.ma_loai_hang = loai_hang.ma_loai_hang
having gia_hang > 100000 and so_luong < 50;

select * from mat_hang 
join loai_hang on mat_hang.ma_loai_hang = loai_hang.ma_loai_hang 
join  nha_cung_cap on mat_hang.ma_cong_ty = nha_cung_cap.ma_cong_ty;

create view cau4_view as
select *,luong_co_ban + phu_cap as luong_phai_tra from nhan_vien;

select * from cau4_view;

create view cau5_view as
select ho,ten,ngay_sinh,luong_phai_tra,so_luong from cau4_view join don_dat_hang on cau4_view.ma_nhan_vien = don_dat_hang.ma_nhan_vien
join chi_tiet_dat_hang on don_dat_hang.so_hoa_don = chi_tiet_dat_hang.so_hoa_don
where year(ngay_dat_hang) = 2003 and so_luong > 100;

SELECT 
    *,
    (luong_phai_tra + luong_phai_tra / 2) AS luong_phai_tra_sau_khi_tang
FROM
    cau5_view;

SELECT *
FROM chi_tiet_dat_hang
JOIN don_dat_hang ON don_dat_hang.so_hoa_don = chi_tiet_dat_hang.so_hoa_don
JOIN mat_hang ON chi_tiet_dat_hang.ma_hang = mat_hang.ma_hang
JOIN loai_hang ON loai_hang.ma_loai_hang = mat_hang.ma_loai_hang
WHERE year(don_dat_hang.ngay_dat_hang) = 2006
    AND chi_tiet_dat_hang.ma_hang IN (
        SELECT ma_hang
        FROM chi_tiet_dat_hang
        GROUP BY ma_hang
        HAVING count(ma_hang) = 1
    );

select * from don_dat_hang join khach_hang on don_dat_hang.ma_khach_hang = khach_hang.ma_khach_hang;

insert into khach_hang values(6,"cty e","Gd e","ND","e@gmail.com","0123456785","8424567885");
delete from khach_hang where ma_khach_hang not in (select ma_khach_hang from don_dat_hang);

select * from cau5_view;
delimiter //
create procedure get_max()
begin
select max(so_luong) from cau5_view into @max;
select * from cau5_view where so_luong = @max;
end
// delimiter ;

call get_max();

select ho,ten,ngay_sinh,luong_phai_tra,so_luong,phu_cap from cau4_view join don_dat_hang on cau4_view.ma_nhan_vien = don_dat_hang.ma_nhan_vien
join chi_tiet_dat_hang on don_dat_hang.so_hoa_don = chi_tiet_dat_hang.so_hoa_don
having so_luong = @max;

insert into don_dat_hang values (6,2,1,"2006-08-05","2006-08-10","2006-08-06","ND");
insert into chi_tiet_dat_hang values (6,1,20000000,120,0.5);
insert into don_dat_hang values (7,2,1,"2006-08-05","2006-08-10","2006-08-06","ND");
insert into chi_tiet_dat_hang values (7,1,20000000,100,0.5);
insert into don_dat_hang values (8,2,1,"2006-08-05","2006-09-10","2006-09-06","ND");
insert into chi_tiet_dat_hang values (8,1,20000000,100,0.5);

select * from chi_tiet_dat_hang join mat_hang on chi_tiet_dat_hang.ma_hang = mat_hang.ma_hang
join loai_hang on loai_hang.ma_loai_hang = mat_hang.ma_loai_hang 
join don_dat_hang on don_dat_hang.so_hoa_don = chi_tiet_dat_hang.so_hoa_don
where year(ngay_chuyen_hang) = 2006;

SELECT
    chi_tiet_dat_hang.Ma_Hang,
    Ten_Hang,
    Ten_Loai_Hang,
    SUM(IF(MONTH(ngay_chuyen_hang) = 1, chi_tiet_dat_hang.So_Luong, 0)) AS Thang1,
    SUM(IF(MONTH(ngay_chuyen_hang) = 2, chi_tiet_dat_hang.So_Luong, 0)) AS Thang2,
    SUM(IF(MONTH(ngay_chuyen_hang) = 3, chi_tiet_dat_hang.So_Luong, 0)) AS Thang3,
    SUM(IF(MONTH(ngay_chuyen_hang) = 4, chi_tiet_dat_hang.So_Luong, 0)) AS Thang4,
    SUM(IF(MONTH(ngay_chuyen_hang) = 5, chi_tiet_dat_hang.So_Luong, 0)) AS Thang5,
    SUM(IF(MONTH(ngay_chuyen_hang) = 6, chi_tiet_dat_hang.So_Luong, 0)) AS Thang6,
    SUM(IF(MONTH(ngay_chuyen_hang) = 7, chi_tiet_dat_hang.So_Luong, 0)) AS Thang7,
    SUM(IF(MONTH(ngay_chuyen_hang) = 8, chi_tiet_dat_hang.So_Luong, 0)) AS Thang8,
    SUM(IF(MONTH(ngay_chuyen_hang) = 9, chi_tiet_dat_hang.So_Luong, 0)) AS Thang9,
    SUM(IF(MONTH(ngay_chuyen_hang) = 10, chi_tiet_dat_hang.So_Luong, 0)) AS Thang10,
    SUM(IF(MONTH(ngay_chuyen_hang) = 11, chi_tiet_dat_hang.So_Luong, 0)) AS Thang11,
    SUM(IF(MONTH(ngay_chuyen_hang) = 12, chi_tiet_dat_hang.So_Luong, 0)) AS Thang12,
    SUM(chi_tiet_dat_hang.So_Luong) AS CaNam
FROM
    Chi_Tiet_Dat_Hang
        JOIN
    Mat_Hang ON Chi_Tiet_Dat_Hang.Ma_Hang = Mat_Hang.Ma_Hang
        JOIN
    Loai_Hang ON Loai_Hang.Ma_Loai_Hang = Mat_Hang.Ma_Loai_Hang
        JOIN
    Don_Dat_Hang ON Don_Dat_Hang.So_Hoa_Don = Chi_Tiet_Dat_Hang.So_Hoa_Don
WHERE
    YEAR(ngay_chuyen_hang) = 2006
GROUP BY Ma_Hang, Ten_Hang, Ten_Loai_Hang;
