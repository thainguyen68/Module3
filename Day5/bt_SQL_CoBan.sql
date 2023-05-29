create database bt_sql_coban;
use bt_sql_coban;
create table loai_hang(
ma_loai_hang int primary key,
ten_loai_hang varchar(255) not null
);

create table mat_hang(
ma_hang int primary key,
ten_hang varchar(255) not null,
ma_cong_ty varchar(255) not null,
foreign key (ma_cong_ty) references nha_cung_cap(ma_cong_ty),
ma_loai_hang int not null,
foreign key (ma_loai_hang) references loai_hang(ma_loai_hang),
so_luong int not null,
don_vi_tinh varchar(255) not null,
gia_hang double not null
);

create table nha_cung_cap(
ma_cong_ty varchar(255) primary key,
ten_cong_ty varchar(255) not null,
ten_giao_dich varchar(255) not null,
dia_chi varchar(255) not null,
dien_thoai varchar(255) not null,
fax varchar(255) not null,
email varchar(255) not null
);