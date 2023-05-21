create database btvn_day2;
use btvn_day2;
CREATE TABLE hang_xe (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE o_to (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_hx INT,
    FOREIGN KEY (id_hx)
        REFERENCES hang_xe (id),
    name VARCHAR(50) NOT NULL
);
CREATE TABLE nha_cc (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
create table nhan_vien(
id INT PRIMARY KEY AUTO_INCREMENT,
name varchar (50) not null
);
CREATE TABLE hoa_dn (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nhacc_id INT,
    nhanvien_id INT,
    FOREIGN KEY (nhanvien_id)
        REFERENCES nhan_vien (id),
    FOREIGN KEY (nhacc_id)
        REFERENCES nha_cc (id)
);
CREATE TABLE chi_tiet_dn (
    id INT PRIMARY KEY AUTO_INCREMENT,
    oto_id INT,
    hoadon_id INT,
    FOREIGN KEY (oto_id)
        REFERENCES o_to (id),
    FOREIGN KEY (hoadon_id)
        REFERENCES hoa_dn (id),
    don_gia DOUBLE,
    CHECK (don_gia > 0),
    so_luong INT,
    CHECK (so_luong > 0)
);
CREATE TABLE khach_hang (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) UNIQUE,
    dia_chi VARCHAR(250) NOT NULL
);
create table hoa_dx(
    id INT PRIMARY KEY AUTO_INCREMENT,
    khachhang_id INT,
    nhanvien_id INT,
    FOREIGN KEY (nhanvien_id)
        REFERENCES nhan_vien (id),
    FOREIGN KEY (khachhang_id)
        REFERENCES khach_hang (id)
);
CREATE TABLE chi_tiet_dx (
    id INT PRIMARY KEY AUTO_INCREMENT,
    oto_id INT,
    hoadon_id INT,
    FOREIGN KEY (oto_id)
        REFERENCES o_to (id),
    FOREIGN KEY (hoadon_id)
        REFERENCES hoa_dx (id),
    don_gia DOUBLE,
    CHECK (don_gia > 0),
    so_luong INT,
    CHECK (so_luong > 0)
);



