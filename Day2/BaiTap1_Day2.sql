create database day2;
use day2;
CREATE TABLE phieu_xuat (
    sopx INT AUTO_INCREMENT PRIMARY KEY,
    ngay_xuat DATE
);
CREATE TABLE vat_tu (
    ma_vt INT AUTO_INCREMENT PRIMARY KEY,
    name_vt VARCHAR(50)
);
CREATE TABLE chi_tiet_px (
    so_px INT,
    ma_vt INT,
    FOREIGN KEY (so_px) REFERENCES phieu_xuat (sopx),
    FOREIGN KEY (ma_vt) REFERENCES vat_tu (ma_vt),
    dg_xuat DOUBLE,
    sl_xuat INT
);
CREATE TABLE phieu_nhap (
    so_pn INT AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);
CREATE TABLE chi_tiet_pn (
    so_pn INT,
    ma_vt INT,
    FOREIGN KEY (so_pn) REFERENCES phieu_nhap (so_pn),
    FOREIGN KEY (ma_vt) REFERENCES vat_tu (ma_vt),
    dg_nhap DOUBLE,
    sl_nhap INT
);
CREATE TABLE don_hang (
    so_dh INT AUTO_INCREMENT PRIMARY KEY,
    ngay_dh DATE,
    ma_ncc INT,
    FOREIGN KEY (ma_ncc) REFERENCES nha_cc (ma_ncc)
);
CREATE TABLE nha_cc (
    ma_ncc INT AUTO_INCREMENT PRIMARY KEY,
    ten_ncc VARCHAR(50),
    dia_chi VARCHAR(50),
    sdt VARCHAR(50)
);
CREATE TABLE chi_tiet_dh (
    ma_vt INT,
    so_dh INT,
    FOREIGN KEY (so_dh) REFERENCES don_hang (so_dh),
    FOREIGN KEY (ma_vt) REFERENCES vat_tu (ma_vt)
);