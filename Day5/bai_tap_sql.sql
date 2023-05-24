create database Bai_tap_SQL;
use  Bai_tap_SQL;
create table nha_cung_cap (
ma_nha_cc varchar(255) primary key,
ten_nha_cc varchar(255) not null,
dia_chi varchar(255) not null,
so_dt varchar(255) not null,
ma_so_thue varchar(255) not null
);

create table loai_dich_vu(
ma_loai_dv varchar(255) primary key,
ten_loai_dv varchar(255)
);

create table dong_xe (
dong_xe varchar(255) primary key ,
hang_xe varchar(255) not null,
so_cho_ngoi int
);

create table muc_phi(
ma_mp varchar(255) primary key,
don_gia varchar(255) not null,
mo_ta varchar(255) not null
);

create table dang_ky_cc (
ma_dk_cc varchar(255) primary key,
ma_nha_cc varchar(255),
foreign key (ma_nha_cc) references nha_cung_cap(ma_nha_cc),
ma_loai_dv varchar(255),
foreign key (ma_loai_dv) references loai_dich_vu(ma_loai_dv),
dong_xe varchar(255),
foreign key (dong_xe) references dong_xe ( dong_xe),
 muc_phi varchar(255),
 foreign key (muc_phi) references muc_phi(ma_mp),
 ngay_bd_cc date,
 ngay_kt_cc date,
 so_luong_xe_dk int
);

select * from dang_ky_cc;

Insert Into nha_cung_cap (ma_nha_cc,ten_nha_cc, dia_chi, so_dt,ma_so_thue) values
('NCC001', 'Cty TNHH Toàn Phát', 'Hai Chau', '051133999888', '568941'),
('NCC002', 'Cty Cổ Phần Đông Du', 'Lien Chieu', '051133999889', '456789'),
('NCC003', 'Ông Nguyễn Văn A', 'Hoa Thuan', '051133999890', '321456'),
('NCC004', 'Cty Cổ Phần Toàn Cầu Xanh', 'Hai Chau', '05113658945', '513364'),
('NCC005', 'Cty TNHH AMA', 'Thanh Khe', '051103875466', '546546'),
('NCC006', 'Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587469', '524545'),
('NCC007', 'Cty TNHH Phan Thành', 'Thanh Khe', '05113987456', '113021'),
('NCC008', 'Ông Phan Đình Nam', 'Hoa Thuan', '05113532456', '121230'),
('NCC009', 'Tập đoàn Đông Nam Á', 'Lien Chieu', '05113987121', '533654'),
('NCC010', 'Cty Cổ Phần Rạng đông', 'Lien Chieu', '05113569654', '187864');

Insert Into loai_dich_vu (ma_loai_dv, ten_loai_dv) values
('DV01', 'Dịch vụ xe taxi'),
('DV02', 'Dịch vụ xe buýt công cộng theo tuyến cố định'),
('DV03', 'Dịch vụ cho thuê xe theo hợp đồng');

Insert Into muc_phi (ma_mp, don_gia, mo_ta) values 
('MP01', '10000', 'Áp dụng từ ngày 1/2015'),
('MP02', '15000', 'Áp dụng từ ngày 2/2015'),
('MP03', '20000', 'Áp dụng từ ngày 1/2010'),
('MP04', '25000', 'Áp dụng từ ngày 2/2011');

Insert Into dong_xe (dong_xe, hang_xe, so_cho_ngoi) values
('Hiace', 'Toyota', 16),
('Vios', 'Toyota', 5),
('Escape', 'Ford', 5),
('Cerato', 'KIA', 7),
('Forte', 'KIA', 5),
('Starex', 'Huyndai', 7),
('Grand-i10', 'Huyndai', 7);

Insert Into dang_ky_cc (ma_dk_cc, ma_nha_cc, ma_loai_dv, dong_xe, muc_phi, ngay_bd_cc, ngay_kt_cc) values
('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015/11/20', '2016/11/20'),
('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015/11/20', '2017/11/20'),
('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017/11/20', '2018/11/20'),
('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015/11/20', '2019/11/20'),
('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019/11/20', '2020/11/20'),
('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016/11/10', '2021/11/20'),
('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '2015/11/30', '2016/01/25'),
('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016/02/28', '2016/08/15'),
('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '2016/04/27', '2017/04/30'),
('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2016/11/21', '2016/02/22'),
('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '2016/12/25', '2017/02/20'),
('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '2016/04/14', '2017/12/20'),
('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015/12/21', '2016/12/21'),
('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '2016/05/20', '2016/12/30'),
('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018/04/24', '2019/11/20'),
('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '2016/06/22', '2016/12/21'),
('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016/09/30', '2019/09/30'),
('DK018', 'NCC008', 'DV03', 'Escape', 'MP04', '2017/12/13', '2018/09/30'),
('DK019', 'NCC003', 'DV03', 'Escape', 'MP03', '2016/01/24', '2016/12/30'),
('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016/05/03', '2017/10/21'),
('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015/01/30', '2016/12/30'),
('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016/07/25', '2017/12/30'),
('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017/11/30', '2018/05/20'),
('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017/12/23', '2019/11/30'),
('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016/08/24', '2017/10/25');


-- Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
select *  from dong_xe
where so_cho_ngoi > 5;



-- Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
-- thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
-- thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
-- distinct: tìm hiểu ?
select distinct nha_cung_cap.ten_nha_cc , dong_xe.hang_xe , muc_phi.don_gia  from dang_ky_cc
join nha_cung_cap on dang_ky_cc.ma_nha_cc = nha_cung_cap.ma_nha_cc
join muc_phi on dang_ky_cc.muc_phi = muc_phi.ma_mp
join dong_xe on dang_ky_cc.dong_xe = dong_xe.dong_xe
where (dong_xe.hang_xe = "Toyota" and muc_phi.don_gia ="15000") or (dong_xe.hang_xe = "KIA" and muc_phi.don_gia ="20000");



-- Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp
--  và giảm dần theo mã số thuế
select * from nha_cung_cap 
order by ten_nha_cc;
select * from nha_cung_cap
order by ma_so_thue;



-- Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
-- yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
-- cung cấp là “20/11/2015”
select nha_cung_cap.ten_nha_cc, count(nha_cung_cap.ten_nha_cc) as so_lan_dk from dang_ky_cc
join nha_cung_cap on dang_ky_cc.ma_nha_cc = nha_cung_cap.ma_nha_cc
where ngay_bd_cc > "2015/11/20"
group by nha_cung_cap.ten_nha_cc;


-- Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
-- chỉ được liệt kê một lần












select * from dang_ky_cc;
drop database Bai_tap_SQL;