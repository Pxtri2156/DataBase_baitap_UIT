-------- BAI 1 -----
------ CAU 1.1 ----
CREATE DATABASE QLBH
USE QLBH

 -----------TAO CAC BANG ---------
--- TAO BANG KHACH HANG ----
CREATE TABLE KHACHHANG
(
     MAKH char(4) NOT NULL,
	 HOTEN varchar(40),
	 DCHI varchar(50),
	 SODT varchar(20),
	 NGSINH smalldatetime,
	 NGDK smalldatetime,
	 DOANHSO money,
	 CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH),
)
----- TAO BANG NHAN VIEN ------
CREATE TABLE NHANVIEN 
(
    MANV char(4) NOT NULL,
	HOTEN varchar(40),
	SODT varchar(20),
	NGVL smalldatetime,
)
----TAO KHOA CHINH CHO NHAN VIEN----
ALTER TABLE NHANVIEN ADD
CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)

----TAO BANG SAN PHAM -----
CREATE TABLE SANPHAM
(
    MASP char(4) NOT NULL,
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money,
)
---TAO KHOA CHINH CHO SAN PHAM -----
ALTER TABLE SANPHAM ADD
CONSTRAINT PK_SANPHAM PRIMARY KEY (MASP)
---- TAO BANG HOA DON ---
CREATE TABLE HOADON
(
   SOHD int NOT NULL,
   NGHD smalldatetime,
   MAKH char(4),
   MANV char(4),
   TRIGIA money,
)
---TAO KHOA CHINH CHO HOA DON ----
ALTER TABLE HOADON ADD
CONSTRAINT PK_HOADON PRIMARY KEY(SOHD)
--- TAO KHOA NGOAI ---
ALTER TABLE HOADON ADD
CONSTRAINT FK_HD_KH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
CONSTRAINT FK_HD_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV)

---- TAO BANG CTHD ----
CREATE TABLE CTHD
(
   SOHD int NOT NULL,
   MASP char(4) NOT NULL,
   SL int,
)
----TAO KHOA CHINH CHO CTHD ----
ALTER TABLE CTHD ADD
CONSTRAINT PK_CTHD PRIMARY KEY (SOHD,MASP)
---- TAO KHOA NGOAI ----
ALTER TABLE CTHD ADD
CONSTRAINT FK_CTHD_SP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
----- CAU 1.2 ----
ALTER TABLE SANPHAM
ADD GHICHU varchar(20);
----- CAU1.3-----
ALTER TABLE KHACHHANG
ADD LOAIKH tinyint;
------CAU 1.4----
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU varchar(100);
------CAU1.5-----
ALTER TABLE SANPHAM
DROP COLUMN GHICHU;
------CAU 1.6----
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH varchar(20);
-----CAU 1.7 ----
ALTER TABLE SANPHAM
ADD CONSTRAINT CHK_SANPHAM CHECK ( DVT = 'CAY' OR DVT = 'hop' OR  DVT = 'CAI' OR DVT = 'QUYEN' OR DVT = 'CHUC');
----CAU 1.8 ----
ALTER TABLE SANPHAM
ADD CONSTRAINT CHK_GIA_SANPHAM CHECK (GIA >= 500);
---CAU 1.9 -----
ALTER TABLE CTHD 
ADD CONSTRAINT CHK_SL_CTHD CHECK (SL >= 1);
----CAU 1.10---

ALTER TABLE KHACHHANG
ADD CONSTRAINT CHK_NGDK_KHACHHANG CHECK (NGSINH < NGDK);
-----NHAP LIEU ------
---NHAP LIEU NHAN VIEN-----
SELECT*FROM NHANVIEN
DELETE FROM NHANVIEN WHERE MANV = 'NV06'
INSERT INTO NHANVIEN
VALUES ('NV01','Nguyen Nhu Nhut', '0927345678', '04-13-2006');
INSERT INTO NHANVIEN
VALUES ('NV02', 'Le Thi Phi Yen', '0987567390', '04-21-2006');
INSERT INTO NHANVIEN
VALUES ('NV03', 'Nguyen Van B', '0997047382', '04-27-2006');
INSERT INTO NHANVIEN
VALUES ('NV04', 'Ngo Thanh Truc', '0913758489', '06-24-2006');
INSERT INTO NHANVIEN
VALUES ('NV05', 'Nguyen Thi Truc Thanh', '0918590387','07-20-2006');
UPDATE NHANVIEN
SET SODT = '0913758498', HOTEN = 'Ngo Thanh Tuan'
WHERE MANV ='NV04'
---NHAP LIEU KHACH HANG-----
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH varchar(20)
INSERT INTO KHACHHANG
VALUES ('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451','10-22-1960','07-22-2006','13060000', 'not inf');
INSERT INTO KHACHHANG
VALUES ('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478','04-03-1974','07-30-2006','280000','no inf');
INSERT INTO KHACHHANG
VALUES ('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1,TpHCM','0938776266','06-12-1980','08-05-2006','3860000','not inf');
INSERT INTO KHACHHANG
VALUES ('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh , Q10, TpHCM', '0917325476','03-09-1965','10-02-2006','250000','not inf');
INSERT INTO KHACHHANG
VALUES ('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108','03-10-1950','10-28-2006','21000', 'not inf');
INSERT INTO KHACHHANG
VALUES ('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738','12-31-1981','11-24-2006','915000','not inf');
INSERT INTO KHACHHANG
VALUES ('KH07','Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565','04-06-1971','12-01-2006','12500','not inf');
INSERT INTO KHACHHANG
VALUES ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756','01-10-1971', '12-13-2006','365000', 'not inf');
INSERT INTO KHACHHANG
VALUES ('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763','09-03-1979','01-12-2007','70000','not inf');
INSERT INTO KHACHHANG
VALUES ('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '05-02-1983','01-16-2007','67500','not inf');
----NHAP LIEU SAN PHAM -------
INSERT INTO SANPHAM
VALUES ( 'BC01', 'But chi', 'cay', 'Singapore', '3,000' ),
	 ('BC02', 'But chi', 'cay', 'Singapore', '5,000'),
	 ('BC03', 'But chi', 'cay', 'Viet Nam', '3,500'),
	 ('BC04', 'But chi', 'hop', 'Viet Nam', '30,000'),
	 ('BB01', 'But bi', 'cay', 'Viet Nam', '5,000'),
	 ('BB02', 'But bi', 'cay', 'Trung Quoc', '7,000'),
	 ('BB03', 'But bi', 'hop', 'Thai Lan', '100,000'),
	 ('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', '2,500'),
	 ('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', '4,500'),
	 ('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', '3,000'),
	 ('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', '5,500'),
	 ('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', '23,000'),
	 ('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', '53,000'),
	 ('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', '34,000'),
	 ('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', '40,000'),
	 ('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', '55,000'),
	 ('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', '51,000'),				
	 ('ST04', 'So tay', 'quyen', 'Thai Lan', '55,000'),
	 ('ST05', 'So tay mong', 'quyen', 'Thai Lan', '20,000'),
	 ('ST06', 'Phan viet bang', 'hop', 'Viet Nam', '5,000'),
	 ('ST07', 'Phan khong bui', 'hop', 'Viet Nam', '7,000'),
	 ('ST08', 'Bong bang', 'cai', 'Viet Nam', '1,000'),
	 ('ST09', 'But long', 'cay', 'Viet Nam', '5,000'),
	 ('ST10', 'But long', 'cay', 'Trung Quoc', '7,000')
----NHAP LIEU HOA DON ----
INSERT INTO HOADON
VALUES ('1001', '2006-07-23', 'KH01', 'NV01', '320,000'),
       ('1002', '2006-08-12', 'KH01', 'NV02', '840,000'),
      ('1003', '2006-08-23', 'KH02', 'NV01', '100,000'),
	 ('1004', '2006-09-01', 'KH02', 'NV01', '180,000'),
	 ('1005', '2006-10-20', 'KH01', 'NV02', '3,800,000'),
	 ('1006', '2006-10-16', 'KH01', 'NV03', '2,430,000'),
	 ('1007', '2006-10-28', 'KH03', 'NV03', '510,000'),
	 ('1008', '2006-10-28', 'KH01', 'NV03', '440,000'),
	 ('1009', '2006-10-28', 'KH03', 'NV04', '200,000'),
	 ('1010', '2006-11-01', 'KH01', 'NV01', '5,200,000'),
	 ('1011', '2006-11-04', 'KH04', 'NV03', '250,000'),
	 ('1012', '2006-11-30', 'KH05', 'NV03', '21,000'),
	 ('1013', '2006-12-12', 'KH06', 'NV01', '5,000'),
	 ('1014', '2006-12-31', 'KH03', 'NV02', '3,150,000'),
	 ('1015', '2007-01-01', 'KH06', 'NV01', '910,000'),
	 ('1016', '2007-01-01', 'KH07', 'NV02', '12,500'),
	 ('1017', '2007-01-02', 'KH08', 'NV03', '35,000'),
	 ('1018', '2007-01-13', 'KH08', 'NV03', '330,000'),
	 ('1019', '2007-01-13', 'KH01', 'NV03', '30,000'),
	 ('1020', '2007-01-14', 'KH09', 'NV04', '70,000'),
	 ('1021', '2007-01-16', 'KH10', 'NV03', '67,500'),
	 ('1022', '2007-01-16', Null, 'NV03', '7,000'),
	   ('1023', '2007-01-17', Null, 'NV01', '330,000');

INSERT INTO CTHD
VALUES  ('1001', 'TV02', '10'),
	 ('1001', 'ST01', '5'),
	 ('1001', 'BC01', '5'),
	 ('1001', 'BC02', '10'),
	 ('1001', 'ST08', '10'),
	 ('1002', 'BC04', '20'),
	 ('1002', 'BB01', '20'),
	 ('1002', 'BB02', '20'),
	 ('1003', 'BB03', '10'),
	 ('1004', 'TV01', '20'),
	 ('1004', 'TV02', '10'),
	 ('1004', 'TV03', '10'),
	 ('1004', 'TV04', '10'),
	 ('1005', 'TV05', '50'),
	 ('1005', 'TV06', '50'),
	 ('1006', 'TV07', '20'),
	 ('1006', 'ST01', '30'),
	 ('1006', 'ST02', '10'),
	 ('1007', 'ST03', '10'),
	 ('1008', 'ST04', '8'),
	 ('1009', 'ST05', '10'),
	 ('1010', 'TV07', '50'),
	 ('1010', 'ST07', '50'),
	 ('1010', 'ST08', '100'),
	 ('1010', 'ST04', '50'),
	 ('1010', 'TV03', '100'),
	 ('1011', 'ST06', '50'),
	 ('1012', 'ST07', '3'),
	 ('1013', 'ST08', '5'),
	 ('1014', 'BC02', '80'),
	 ('1014', 'BB02', '100'),
	 ('1014', 'BC04', '60'),
	 ('1014', 'BB01', '50'),
	 ('1015', 'BB02', '30'),
	 ('1015', 'BB03', '7'),
	 ('1016', 'TV01', '5'),
	 ('1017', 'TV02', '1'),
	 ('1017', 'TV03', '1'),
	 ('1017', 'TV04', '5'),
	 ('1018', 'ST04', '6'),
	 ('1019', 'ST05', '1'),
	 ('1019', 'ST06', '2'),
	 ('1020', 'ST07', '10'),
	 ('1021', 'ST08', '5'),
	 ('1021', 'TV01', '7'),
	 ('1021', 'TV02', '10'),
	 ('1022', 'ST07', '1'),
	 ('1023', 'ST04', '6');



--------------------------------------------------------------






-------BAI 2 ----
---CAU 1-TAO CSDL---
CREATE DATABASE QLGV
USE QLGV
--TAO BANG KHOA --
CREATE TABLE KHOA
(
   MAKHOA varchar(4) NOT NULL,
   TENKHOA varchar(40),
   NGTLAP smalldatetime,
   TRGKHOA char(4),
);
--TAO BANG MON HOC--
CREATE TABLE MONHOC
(
   MAMH varchar(10)NOT NULL,
   TENMH varchar(40),
   TCLT tinyint,
   TCTH tinyint,
   MAKHOA varchar(4),
);
--TAO DIEU KIEN --
CREATE TABLE DIEUKIEN
(
   MAMH varchar(10) NOT NULL,
   MAMH_TRUOC varchar(10)NOT NULL,
)
--TAO BANG GIAO VIEN --
CREATE TABLE GIAOVIEN
(
  MAGV char(4) NOT NULL,
  HOTEN varchar(40),
  HOCVI  varchar(10),
  HOCHAM varchar(10),
  GIOITINH VARCHAR(3),
  NGSINH SMALLDATETIME,
  NGVL SMALLDATETIME,
  HESO NUMERIC(4,2),
  MUCLUONG MONEY,
  MAKHOA VARCHAR(4)
)
-- TAO BANG LOP --
CREATE TABLE LOP
(
   MALOP varchar(3) NOT NULL,
  TENLOP varchar(40),
  TRGLOP char(5),
  SISO tinyint,
  MAGVCN char(4),
)
-- TAO BANG HOC VIEN --
CREATE TABLE HOCVIEN
(
   MAHV char(5) NOT NULL,
   HO VARCHAR (40),
   TEN VARCHAR(10),
   NGSINH SMALLDATETIME,
   GIOITINH VARCHAR(3),
   NOISINH VARCHAR(40),
   MALOP CHAR(3),
)
-- TAO GIANG DAY --
CREATE TABLE GIANGDAY
(
   MALOP CHAR(3) NOT NULL,
   MAMH VARCHAR(10) NOT NULL,
   MAGV CHAR(4),
   HOCKY TINYINT,
   NAM SMALLINT,
   TUNGAY SMALLDATETIME,
   DENNGAY SMALLDATETIME,
)
--  TAO KETQUATHI --
CREATE TABLE KETQUATHI
(
  MAHV CHAR(5) NOT NULL,
  MAMH VARCHAR(10) NOT NULL,
  LT TINYINT NOT NULL,
  NGTHI SMALLDATETIME,
  DIEM NUMERIC(4,2),
  KQUA VARCHAR(10),
)
--- TAO KHOA CHINH ---
--HOC VIEN--
ALTER TABLE HOCVIEN ADD
CONSTRAINT PK_MAHV_HOCVIEN PRIMARY KEY (MAHV)
--LOP--

ALTER TABLE LOP ADD
CONSTRAINT PK_MALOP_LOP PRIMARY KEY (MALOP)
--KHOA--
ALTER TABLE KHOA ADD
CONSTRAINT PK_MAKHOA_KHOA PRIMARY KEY (MAKHOA)
--MON HOC--
ALTER TABLE MONHOC ADD
CONSTRAINT PK_MAMH_MONHOC PRIMARY KEY(MAMH)
--DIEUKIEN--
ALTER TABLE DIEUKIEN ADD
CONSTRAINT PK_DIEUKIEN PRIMARY KEY(MAMH, MAMH_TRUOC)
--GIAO VIEN --
ALTER TABLE GIAOVIEN ADD
CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MAGV)
--GIANGDAY--
ALTER TABLE GIANGDAY ADD
CONSTRAINT PK_GIANGDAY PRIMARY KEY(MALOP,MAMH)
--KET QUA THI --

ALTER TABLE KETQUATHI ADD
CONSTRAINT PK_KETQUATHI PRIMARY KEY(MAHV, MAMH,LT)
--- TAO KHOA NGOAI --
--HOC VIEN--
ALTER TABLE HOCVIEN ADD
CONSTRAINT FK_HOCVIEN_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
--LOP--
ALTER TABLE LOP ADD
CONSTRAINT FK_LOP_TRGLOP FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD
CONSTRAINT FK_LOP_MAGVCN FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV)
--KHOA--
ALTER TABLE KHOA ADD
CONSTRAINT FK_KHOA FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)
--MONHOC--
ALTER TABLE MONHOC ADD
CONSTRAINT FK_MONHOC FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
--DIEU KIEN --
ALTER TABLE DIEUKIEN ADD
CONSTRAINT FK_DIEUKIEN_MAMH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD
CONSTRAINT FK_DIEUKIEN_MAMH_TRUOC FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH)
--GIAOVIEN--
ALTER TABLE GIAOVIEN ADD
CONSTRAINT FK_GIAOVIEN FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
--GIANG DAY--
ALTER TABLE GIANGDAY ADD
CONSTRAINT FK_GIANGDAY_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD
CONSTRAINT FK_GIANGDAY_MAMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD
CONSTRAINT FK_GIANGDAY_MAGV FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)
--KET QUA THI--
ALTER TABLE KETQUATHI ADD
CONSTRAINT FK_KETQUATHI_MAHV FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD
CONSTRAINT FK_KETQUATHI_MAMH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
--Bai I 
--cau1--

--NHAP LIEU--
SELECT*FROM GIAOVIEN
--GIAOVIEN--
INSERT INTO GIAOVIEN
	( MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA )
VALUES
	 ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-02', '2004-01-11', '5.00', '2,250,000', 'KHMT'),
	 ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-04-20', '4.50', '2,025,000', 'HTTT'),
	 ('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-08-01', '2004-09-23', '4.00', '1,800,000', 'CNPM'),
	 ('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1961-02-22', '2005-01-12', '4.50', '2,025,000', 'KTMT'),
	 ('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '1958-03-12', '2005-01-12', '3.00', '1,350,000', 'HTTT'),
	 ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-03-11', '2005-01-12', '4.50', '2,025,000', 'KHMT'),
	 ('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '1971-11-23', '2005-03-01', '4.00', '1,800,000', 'KHMT'),
	 ('GV08', 'Le Thi Tran', 'KS', 'Null', 'Nu', '1974-03-26', '2005-03-01', '1.69', '760,500', 'KHMT'),
	 ('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '1966-12-31', '2005-03-01', '4.00', '1,800,000', 'HTTT'),
	 ('GV10', 'Le Tran Anh Loan', 'KS', 'Null', 'Nu', '1972-07-17', '2005-03-01', '1.86', '837,000', 'CNPM'),
	 ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-01-12', '2005-05-15', '2.67', '1,201,500', 'MTT'),
	 ('GV12', 'Tran Van Anh', 'CN', 'Null', 'Nu', '1981-03-29', '2005-05-15', '1.69', '760,500', 'CNPM'),
	 ('GV13', 'Nguyen Linh Dan', 'CN', 'Null', 'Nu', '1980-05-23', '2005-05-15', '1.69', '760,500', 'KTMT'),
	 ('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1976-11-30', '2005-05-15', '3.00', '1,350,000', 'MTT'),
	 ('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '1978-05-04', '2005-05-15', '3.00', '1,350,000', 'KHMT')
--KHOA--
INSERT INTO KHOA 
VALUES ('KHMT', 'Khoa hoc may tinh', '2005-06-07', 'GV01'),
	 ('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
	 ('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
	 ('MTT', 'Mang va truyen thong', '2005-10-20', 'GV03'),
	 ('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL);
--LOP--
INSERT INTO LOP
	( MALOP, TENLOP, TRGLOP, SISO, MAGVCN )
VALUES
	 ('K11', 'Lop 1 khoa 1', 'K1108', '11', 'GV07'),
	 ('K12', 'Lop 2 khoa 1', 'K1205', '12', 'GV09'),
	 ('K13', 'Lop 3 khoa 1', 'K1305', '12', 'GV14')
--HOCVIEN--
INSERT INTO HOCVIEN
	( MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP )
VALUES
	 ('K1101', 'Nguyen Van', 'A', '1986-01-27', 'Nam', 'TpHCM', 'K11'),
	 ('K1102', 'Tran Ngoc', 'Han', '1986-03-14', 'Nu', 'Kien Giang', 'K11'),
	 ('K1103', 'Ha Duy', 'Lap', '1986-04-18', 'Nam', 'Nghe An', 'K11'),
	 ('K1104', 'Tran Ngoc', 'Linh', '1986-03-30', 'Nu', 'Tay Ninh', 'K11'),
	 ('K1105', 'Tran Minh', 'Long', '1986-02-27', 'Nam', 'TpHCM', 'K11'),
	 ('K1106', 'Le Nhat', 'Minh', '1986-01-24', 'Nam', 'TpHCM', 'K11'),
	 ('K1107', 'Nguyen Nhu', 'Nhut', '1986-01-27', 'Nam', 'Ha Noi', 'K11'),
	 ('K1108', 'Nguyen Manh', 'Tam', '1986-02-27', 'Nam', 'Kien Giang', 'K11'),
	 ('K1109', 'Phan Thi Thanh', 'Tam', '1986-01-27', 'Nu', 'Vinh Long', 'K11'),
	 ('K1110', 'Le Hoai', 'Thuong', '1986-02-05', 'Nu', 'Can Tho', 'K11'),
	 ('K1111', 'Le Ha', 'Vinh', '1986-12-25', 'Nam', 'Vinh Long', 'K11'),
	 ('K1201', 'Nguyen Van', 'B', '1986-02-11', 'Nam', 'TpHCM', 'K12'),
	 ('K1202', 'Nguyen Thi Kim', 'Duyen', '1986-01-18', 'Nu', 'TpHCM', 'K12'),
	 ('K1203', 'Tran Thi Kim', 'Duyen', '1986-09-17', 'Nu', 'TpHCM', 'K12'),
	 ('K1204', 'Truong My', 'Hanh', '1986-05-19', 'Nu', 'Dong Nai', 'K12'),
	 ('K1205', 'Nguyen Thanh', 'Nam', '1986-04-17', 'Nam', 'TpHCM', 'K12'),
	 ('K1206', 'Nguyen Thi Truc', 'Thanh', '1986-03-04', 'Nu', 'Kien Giang', 'K12'),
	 ('K1207', 'Tran Thi Bich', 'Thuy', '1986-02-08', 'Nu', 'Nghe An', 'K12'),
	 ('K1208', 'Huynh Thi Kim', 'Trieu', '1986-04-08', 'Nu', 'Tay Ninh', 'K12'),
	 ('K1209', 'Pham Thanh', 'Trieu', '1986-02-23', 'Nam', 'TpHCM', 'K12'),
	 ('K1210', 'Ngo Thanh', 'Tuan', '1986-02-14', 'Nam', 'TpHCM', 'K12'),
	 ('K1211', 'Do Thi', 'Xuan', '1986-03-09', 'Nu', 'Ha Noi', 'K12'),
	 ('K1212', 'Le Thi Phi', 'Yen', '1986-03-12', 'Nu', 'TpHCM', 'K12'),
	 ('K1301', 'Nguyen Thi Kim', 'Cuc', '1986-06-09', 'Nu', 'Kien Giang', 'K13'),
	 ('K1302', 'Truong Thi My', 'Hien', '1986-03-18', 'Nu', 'Nghe An', 'K13'),
	 ('K1303', 'Le Duc', 'Hien', '1986-03-21', 'Nam', 'Tay Ninh', 'K13'),
	 ('K1304', 'Le Quang', 'Hien', '1986-04-18', 'Nam', 'TpHCM', 'K13'),
	 ('K1305', 'Le Thi', 'Huong', '1986-03-27', 'Nu', 'TpHCM', 'K13'),
	 ('K1306', 'Nguyen Thai', 'Huu', '1986-03-30', 'Nam', 'Ha Noi', 'K13'),
	 ('K1307', 'Tran Minh', 'Man', '1986-05-28', 'Nam', 'TpHCM', 'K13'),
	 ('K1308', 'Nguyen Hieu', 'Nghia', '1986-04-08', 'Nam', 'Kien Giang', 'K13'),
	 ('K1309', 'Nguyen Trung', 'Nghia', '1987-01-18', 'Nam', 'Nghe An', 'K13'),
	 ('K1310', 'Tran Thi Hong', 'Tham', '1986-04-22', 'Nu', 'Tay Ninh', 'K13'),
	 ('K1311', 'Tran Minh', 'Thuc', '1986-04-04', 'Nam', 'TpHCM', 'K13'),
	 ('K1312', 'Nguyen Thi Kim', 'Yen', '1986-09-07', 'Nu', 'TpHCM', 'K13')
--MONHOC--
INSERT INTO MONHOC
	( MAMH, TENMH, TCLT, TCTH, MAKHOA )
VALUES
	 ('THDC', 'Tin hoc dai cuong', '4', '1', 'KHMT'),
	 ('CTRR', 'Cau truc roi rac', '5', '0', 'KHMT'),
	 ('CSDL', 'Co so du lieu', '3', '1', 'HTTT'),
	 ('CTDLGT', 'Cau truc du lieu va giai thuat', '3', '1', 'KHMT'),
	 ('PTTKTT', 'Phan tich thiet ke thuat toan', '3', '0', 'KHMT'),
	 ('DHMT', 'Do hoa may tinh', '3', '1', 'KHMT'),
	 ('KTMT', 'Kien truc may tinh', '3', '0', 'KTMT'),
	 ('TKCSDL', 'Thiet ke co so du lieu', '3', '1', 'HTTT'),
	 ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', '4', '1', 'HTTT'),
	 ('HDH', 'He dieu hanh', '4', '0', 'KTMT'),
	 ('NMCNPM', 'Nhap mon cong nghe phan mem', '3', '0', 'CNPM'),
	 ('LTCFW', 'Lap trinh C for win', '3', '1', 'CNPM'),
	 ('LTHDT', 'Lap trinh huong doi tuong', '3', '1', 'CNPM')
--GIANGDAY--
INSERT INTO GIANGDAY
	( MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY )
VALUES
	 ('K11', 'THDC', 'GV07', '1', '2006', '2006-01-02', '2006-05-12'),
	 ('K12', 'THDC', 'GV06', '1', '2006', '2006-01-02', '2006-05-12'),
	 ('K13', 'THDC', 'GV15', '1', '2006', '2006-01-02', '2006-05-12'),
	 ('K11', 'CTRR', 'GV02', '1', '2006', '2006-01-09', '2006-05-17'),
	 ('K12', 'CTRR', 'GV02', '1', '2006', '2006-01-09', '2006-05-17'),
	 ('K13', 'CTRR', 'GV08', '1', '2006', '2006-01-09', '2006-05-17'),
	 ('K11', 'CSDL', 'GV05', '2', '2006', '2006-06-01', '2006-07-15'),
	 ('K12', 'CSDL', 'GV09', '2', '2006', '2006-06-01', '2006-07-15'),
	 ('K13', 'CTDLGT', 'GV15', '2', '2006', '2006-06-01', '2006-07-15'),
	 ('K13', 'CSDL', 'GV05', '3', '2006', '2006-08-01', '2006-12-15'),
	 ('K13', 'DHMT', 'GV07', '3', '2006', '2006-08-01', '2006-12-15'),
	 ('K11', 'CTDLGT', 'GV15', '3', '2006', '2006-08-01', '2006-12-15'),
	 ('K12', 'CTDLGT', 'GV15', '3', '2006', '2006-08-01', '2006-12-15'),
	 ('K11', 'HDH', 'GV04', '1', '2007', '2007-01-02', '2007-02-18'),
	 ('K12', 'HDH', 'GV04', '1', '2007', '2007-01-02', '2007-03-20'),
	 ('K11', 'DHMT', 'GV07', '1', '2007', '2007-02-18', '2007-03-20')
--DIEUKIEN--
INSERT INTO DIEUKIEN
	( MAMH, MAMH_TRUOC )
VALUES
	 ('CSDL', 'CTRR'),
	 ('CSDL', 'CTDLGT'),
	 ('CTDLGT', 'THDC'),
	 ('PTTKTT', 'THDC'),
	 ('PTTKTT', 'CTDLGT'),
	 ('DHMT', 'THDC'),
	 ('LTHDT', 'THDC'),
	 ('PTTKHTTT', 'CSDL')
--KETQUATHI--
INSERT INTO KETQUATHI
	( MAHV, MAMH, LT, NGTHI, DIEM, KQUA )
VALUES
	 ('K1101', 'CSDL', '1', '2006-07-20', '10.00', 'Dat'),
	 ('K1101', 'CTDLGT', '1', '2006-12-28', '9.00', 'Dat'),
	 ('K1101', 'THDC', '1', '2006-05-20', '9.00', 'Dat'),
	 ('K1101', 'CTRR', '1', '2006-05-13', '9.50', 'Dat'),
	 ('K1102', 'CSDL', '1', '2006-07-20', '4.00', 'Khong Dat'),
	 ('K1102', 'CSDL', '2', '2006-07-27', '4.25', 'Khong Dat'),
	 ('K1102', 'CSDL', '3', '2006-08-10', '4.50', 'Khong Dat'),
	 ('K1102', 'CTDLGT', '1', '2006-12-28', '4.50', 'Khong Dat'),
	 ('K1102', 'CTDLGT', '2', '2007-01-05', '4.00', 'Khong Dat'),
	 ('K1102', 'CTDLGT', '3', '2007-01-15', '6.00', 'Dat'),
	 ('K1102', 'THDC', '1', '2006-05-20', '5.00', 'Dat'),
	 ('K1102', 'CTRR', '1', '2006-05-13', '7.00', 'Dat'),
	 ('K1103', 'CSDL', '1', '2006-07-20', '3.50', 'Khong Dat'),
	 ('K1103', 'CSDL', '2', '2006-07-27', '8.25', 'Dat'),
	 ('K1103', 'CTDLGT', '1', '2006-12-28', '7.00', 'Dat'),
	 ('K1103', 'THDC', '1', '2006-05-20', '8.00', 'Dat'),
	 ('K1103', 'CTRR', '1', '2006-05-13', '6.50', 'Dat'),
	 ('K1104', 'CSDL', '1', '2006-07-20', '3.75', 'Khong Dat'),
	 ('K1104', 'CTDLGT', '1', '2006-12-28', '4.00', 'Khong Dat'),
	 ('K1104', 'THDC', '1', '2006-05-20', '4.00', 'Khong Dat'),
	 ('K1104', 'CTRR', '1', '2006-05-13', '4.00', 'Khong Dat'),
	 ('K1104', 'CTRR', '2', '2006-05-20', '3.50', 'Khong Dat'),
	 ('K1104', 'CTRR', '3', '2006-06-30', '4.00', 'Khong Dat'),
	 ('K1201', 'CSDL', '1', '2006-07-20', '6.00', 'Dat'),
	 ('K1201', 'CTDLGT', '1', '2006-12-28', '5.00', 'Dat'),
	 ('K1201', 'THDC', '1', '2006-05-20', '8.50', 'Dat'),
	 ('K1201', 'CTRR', '1', '2006-05-13', '9.00', 'Dat'),
	 ('K1202', 'CSDL', '1', '2006-07-20', '8.00', 'Dat'),
	 ('K1202', 'CTDLGT', '1', '2006-12-28', '4.00', 'Khong Dat'),
	 ('K1202', 'CTDLGT', '2', '2007-01-05', '5.00', 'Dat'),
	 ('K1202', 'THDC', '1', '2006-05-20', '4.00', 'Khong Dat'),
	 ('K1202', 'THDC', '2', '2006-05-27', '4.00', 'Khong Dat'),
	 ('K1202', 'CTRR', '1', '2006-05-13', '3.00', 'Khong Dat'),
	 ('K1202', 'CTRR', '2', '2006-05-20', '4.00', 'Khong Dat'),
	 ('K1202', 'CTRR', '3', '2006-06-30', '6.25', 'Dat'),
	 ('K1203', 'CSDL', '1', '2006-07-20', '9.25', 'Dat'),
	 ('K1203', 'CTDLGT', '1', '2006-12-28', '9.50', 'Dat'),
	 ('K1203', 'THDC', '1', '2006-05-20', '10.00', 'Dat'),
	 ('K1203', 'CTRR', '1', '2006-05-13', '10.00', 'Dat'),
	 ('K1204', 'CSDL', '1', '2006-07-20', '8.50', 'Dat'),
	 ('K1204', 'CTDLGT', '1', '2006-12-28', '6.75', 'Dat'),
	 ('K1204', 'THDC', '1', '2006-05-20', '4.00', 'Khong Dat'),
	 ('K1204', 'CTRR', '1', '2006-05-13', '6.00', 'Dat'),
	 ('K1301', 'CSDL', '1', '2006-12-20', '4.25', 'Khong Dat'),
	 ('K1301', 'CTDLGT', '1', '2006-07-25', '8.00', 'Dat'),
	 ('K1301', 'THDC', '1', '2006-05-20', '7.75', 'Dat'),
	 ('K1301', 'CTRR', '1', '2006-05-13', '8.00', 'Dat'),
	 ('K1302', 'CSDL', '1', '2006-12-20', '6.75', 'Dat'),
	 ('K1302', 'CTDLGT', '1', '2006-07-25', '5.00', 'Dat'),
	 ('K1302', 'THDC', '1', '2006-05-20', '8.00', 'Dat'),
	 ('K1302', 'CTRR', '1', '2006-05-13', '8.50', 'Dat'),
	 ('K1303', 'CSDL', '1', '2006-12-20', '4.00', 'Khong Dat'),
	 ('K1303', 'CTDLGT', '1', '2006-07-25', '4.50', 'Khong Dat'),
	 ('K1303', 'CTDLGT', '2', '2006-08-07', '4.00', 'Khong Dat'),
	 ('K1303', 'CTDLGT', '3', '2006-08-15', '4.25', 'Khong Dat'),
	 ('K1303', 'THDC', '1', '2006-05-20', '4.50', 'Khong Dat'),
	 ('K1303', 'CTRR', '1', '2006-05-13', '3.25', 'Khong Dat'),
	 ('K1303', 'CTRR', '2', '2006-05-20', '5.00', 'Dat'),
	 ('K1304', 'CSDL', '1', '2006-12-20', '7.75', 'Dat'),
	 ('K1304', 'CTDLGT', '1', '2006-07-25', '9.75', 'Dat'),
	 ('K1304', 'THDC', '1', '2006-05-20', '5.50', 'Dat'),
	 ('K1304', 'CTRR', '1', '2006-05-13', '5.00', 'Dat'),
	 ('K1305', 'CSDL', '1', '2006-12-20', '9.25', 'Dat'),
	 ('K1305', 'CTDLGT', '1', '2006-07-25', '10.00', 'Dat'),
	 ('K1305', 'THDC', '1', '2006-05-20', '8.00', 'Dat'),
	 ('K1305', 'CTRR', '1', '2006-05-13', '10.00', 'Dat')
-----------------------------------
---------TUAN 2 -----
-----Bai1 (QLBH) - II- cau 2-5---
--CAU 2 --
USE QLBH
CREATE TABLE SANPHAM1
(
    MASP char(4) NOT NULL,
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money,
)
INSERT INTO SANPHAM1
SELECT*FROM SANPHAM
SELECT*FROM SANPHAM1
CREATE TABLE KHACHHANG1
(
     MAKH char(4) NOT NULL,
	 HOTEN varchar(40),
	 DCHI varchar(50),
	 SODT varchar(20),
	 NGSINH smalldatetime,
	 NGDK smalldatetime,
	 DOANHSO money,
	 LOAIKH VARCHAR(20)
)

INSERT INTO KHACHHANG1
SELECT*FROM KHACHHANG
--CAU 3 --
UPDATE SANPHAM1
SET GIA = GIA*1.05
WHERE NUOCSX = 'THAI LAN'
--CAU 4 --
UPDATE SANPHAM1
SET GIA = GIA*0.95
WHERE NUOCSX = 'TRUNG QUOC' AND GIA <= 10000
--CAU 5 --
SELECT*FROM KHACHHANG1
UPDATE KHACHHANG1
SET LOAIKH = 'VIP'
WHERE (NGDK < '2007/1/1' AND DOANHSO >= 10000000)OR(NGDK > '2007/1/1' AND DOANHSO > 2000000)
--CAU 2-QLGV --I.11-I.14--
--11--
USE QLGV
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_TUOI CHECK (NGSINH <='2001/1/1')
--12--
ALTER TABLE GIANGDAY
ADD CONSTRAINT CHK_NGDAY CHECK (TUNGAY <DENNGAY)
--13--
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHK_TUOIGV CHECK (NGSINH <= '1997/1/1')
--14--
ALTER TABLE MONHOC
ADD CONSTRAINT CHK_TC CHECK (ABS(TCLT-TCTH) <=3 )
----EM KHONG BIET LAM CAU NAY , DO DU LIEU DAU VAO CO MON MA CHENH LECH GIUA HAI  TIN CHI LON HON 3
---CAU 3 - QLBH III.1 TO III.11 ---
--III.1--
USE QLBH
SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
--III.2--
SELECT MASP, TENSP FROM SANPHAM
WHERE DVT = 'CAY' OR DVT = 'QUYEN'
--III.3--
SELECT MASP, TENSP FROM SANPHAM
WHERE MASP  LIKE 'B%' AND MASP LIKE '%01'
--III.4--
SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND (GIA >= 30000 AND GIA <=40000)
--III.5--
SELECT MASP, TENSP FROM SANPHAM
WHERE (NUOCSX = 'THAI LAN' OR NUOCSX = 'TRUNG QUOC') AND (GIA >= 30000 AND GIA <= 40000)
--III.-6-
SELECT SOHD, TRIGIA FROM HOADON
WHERE NGHD <= '2007/1/2' AND NGHD >= '2007/1/1'
--III.7--
SELECT SOHD, TRIGIA FROM HOADON
WHERE MONTH(NGHD) = '1' AND YEAR(NGHD) = '2007'
ORDER BY NGHD ASC, TRIGIA DESC
--III.8--
SELECT HOTEN, T1.MAKH
FROM KHACHHANG T1 JOIN HOADON T2 ON T1.MAKH = T2.MAKH
WHERE T2.NGHD = '2007/1/1'
--III.9--
SELECT SOHD,TRIGIA
FROM HOADON T1 JOIN NHANVIEN T2 ON T1.MANV = T2.MANV
WHERE HOTEN = 'NGUYEN VAN B' AND NGHD ='2006/10/28'
--III.10--
SELECT SANPHAM.MASP,TENSP 
FROM ((HOADON JOIN KHACHHANG ON HOADON.MAKH = KHACHHANG.MAKH) JOIN CTHD ON HOADON.SOHD = CTHD.SOHD) JOIN SANPHAM ON SANPHAM.MASP = CTHD.MASP
WHERE KHACHHANG.HOTEN = 'NGUYEN VAN A' AND MONTH(HOADON.NGHD) = '10' AND YEAR(HOADON.NGHD) = '2006'
--III.11--
SELECT HOADON.SOHD
FROM HOADON JOIN CTHD ON HOADON.SOHD = CTHD.SOHD
WHERE CTHD.MASP = 'BB01' OR CTHD.MASP = 'BB02'
--- CAU 6 QLGV III.1 TO III.5 ---
--III.1--
USE QLGV
SELECT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN, HOCVIEN.NGSINH, HOCVIEN.MALOP
FROM HOCVIEN JOIN LOP ON HOCVIEN.MAHV = LOP.TRGLOP
--III.2--
SELECT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN,KETQUATHI.LT,KETQUATHI.DIEM
FROM HOCVIEN JOIN KETQUATHI ON HOCVIEN.MAHV = KETQUATHI.MAHV
WHERE KETQUATHI.MAMH = 'CTRR' AND HOCVIEN.MALOP = 'K12'
ORDER BY HOCVIEN.TEN ASC, HOCVIEN.HO ASC
--III.3--
SELECT HOCVIEN.MAHV , HOCVIEN.HO, HOCVIEN.TEN, KETQUATHI.MAMH
FROM HOCVIEN JOIN KETQUATHI ON KETQUATHI.MAHV = HOCVIEN.MAHV
WHERE KETQUATHI.LT = '1' AND KETQUATHI.KQUA = 'DAT'
--III.4--
SELECT HOCVIEN.MAHV, HOCVIEN.HO , HOCVIEN.TEN
FROM HOCVIEN JOIN KETQUATHI ON HOCVIEN.MAHV = KETQUATHI.MAHV
WHERE HOCVIEN.MALOP = 'K11' AND KETQUATHI.LT = '1' AND KETQUATHI.KQUA ='KHONG DAT'
--III.5--
SELECT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN
FROM HOCVIEN JOIN KETQUATHI ON HOCVIEN.MAHV = KETQUATHI.MAHV
WHERE HOCVIEN.MALOP LIKE 'K%' AND KETQUATHI.KQUA = 'KHONG DAT' AND KETQUATHI.MAMH = 'CTRR'


-------------------TUAN 3 ----------------------
---------BAI 1 QLBH III.12 VÀ III.13-------
---III.12---
USE QLBH
SELECT*
FROM CTHD
WHERE (MASP = 'BB01' OR MASP = 'BB02') AND ( CTHD.SL BETWEEN 10 AND 20)
---CACH 1 
SELECT SOHD
FROM CTHD
WHERE MASP = 'BB01' AND (CTHD.SL BETWEEN 10 AND 20 )
UNION
SELECT SOHD
FROM CTHD
WHERE MASP = 'BB02' AND (CTHD.SL BETWEEN 10 AND 20 )
----III.13
(SELECT SOHD
FROM CTHD
WHERE MASP = 'BB01' AND (CTHD.SL BETWEEN 10 AND 20 ))
INTERSECT
(SELECT SOHD
FROM CTHD
WHERE MASP = 'BB02' AND (CTHD.SL BETWEEN 10 AND 20 ))
--------BAI 2 (QLGV) II.1 TO II.4----
---II.1--
USE QLGV
UPDATE GIAOVIEN 
SET HESO = HESO + 0.2
FROM GIAOVIEN, KHOA 
WHERE MAGV = KHOA.TRGKHOA
---II.2--
ALTER TABLE HOCVIEN
ALTER COLUMN DIEMTB DECIMAL
UPDATE HOCVIEN
SET DIEMTB = 
(SELECT AVG(DIEM)
 FROM KETQUATHI K1
 WHERE LT = (SELECT MAX(LT) 
             FROM KETQUATHI K2
			 WHERE K1.MAHV = K2.MAHV AND K1.MAMH = K2.MAMH
			 GROUP BY MAHV,MAMH)
 GROUP BY MAHV
 HAVING MAHV = HOCVIEN.MAHV)
---II.3--
SELECT*FROM HOCVIEN

ALTER TABLE HOCVIEN
ADD GHICHU VARCHAR(20)

UPDATE HOCVIEN
SET GHICHU = 'CAM THI'
WHERE EXISTS (SELECT*FROM KETQUATHI WHERE HOCVIEN.MAHV= KETQUATHI.MAHV AND LT = '3' AND DIEM < '5')
---II.4---
ALTER TABLE HOCVIEN
ADD XEPLOAI VARCHAR(20)
UPDATE HOCVIEN
SET XEPLOAI = 'XS'
WHERE DIEMTB >= '9'
UPDATE HOCVIEN
SET XEPLOAI = 'G'
WHERE (DIEMTB  > = 8) AND (DIEMTB <9)
UPDATE HOCVIEN
SET XEPLOAI = 'K'
WHERE DIEMTB  > = 6.5 AND DIEMTB < 8
UPDATE HOCVIEN
SET XEPLOAI = 'TB'
WHERE (DIEMTB < 6.5) AND (DIEMTB >=5)
UPDATE HOCVIEN
SET XEPLOAI = 'Y'
WHERE DIEMTB  < 5 
SELECT*FROM HOCVIEN
--------BAI 3 QLGV III.6 TO III.10--
--- BAI III.6---
SELECT  DISTINCT TENMH
FROM (GIANGDAY T1 JOIN GIAOVIEN T2 ON T1.MAGV = T2.MAGV)  
      JOIN MONHOC T3 ON T1.MAMH = T3.MAMH
WHERE T2.HOTEN = 'TRAN TAM THANH' AND
      T1.HOCKY = '1' AND 
	  T1.NAM =' 2006' 
--- BAI III.7 ---
--7.	Tìm những môn học (mã môn học, tên môn học) 
--mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.--
SELECT DISTINCT TENMH , A.MAMH
FROM (GIANGDAY A JOIN LOP B ON A.MAGV = B.MAGVCN) JOIN 
     MONHOC C ON A.MAMH = C.MAMH
WHERE B.MALOP = 'K11' AND A.HOCKY = '1' AND A.NAM = '2006'
--8.	Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên 
------- “Nguyen To Lan” dạy môn “Co So Du Lieu”.---
SELECT E.HO, E.TEN
FROM (GIANGDAY A JOIN GIAOVIEN B ON A.MAGV = B.MAGV) JOIN
     MONHOC C ON A.MAMH = C.MAMH JOIN
	 LOP D ON A.MALOP = D.MALOP JOIN
	 HOCVIEN E ON D.TRGLOP = E.MAHV
WHERE B.HOTEN = 'NGUYEN TO LAN' AND C.TENMH = 'CO SO DU LIEU'
--9.	In ra danh sách những môn học (mã môn học, tên môn học)
--------phải học liền trước môn “Co So Du Lieu”.
SELECT MONHOC.MAMH , MONHOC.TENMH
FROM MONHOC JOIN DIEUKIEN ON MONHOC.MAMH = DIEUKIEN.MAMH_TRUOC
WHERE DIEUKIEN.MAMH = 'CSDL' 

--10.	Môn “Cau Truc Roi Rac” là môn bắt buộc phải học 
--------liền trước những môn học (mã môn học, tên môn học) nào.
SELECT MONHOC.MAMH , MONHOC.TENMH
FROM MONHOC JOIN DIEUKIEN ON MONHOC.MAMH = DIEUKIEN.MAMH
WHERE DIEUKIEN.MAMH_TRUOC = 'CTRR'
--------Bai 4 (QLBH III.14 TO 19) -------------
---14.	In ra danh sách các sản phẩm (MASP,TENSP) do 
--------“Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
USE QLBH
SELECT MASP, TENSP
FROM SANPHAM 
WHERE NUOCSX = 'TRUNG QUOC'
UNION
SELECT A.MASP, TENSP
FROM SANPHAM A JOIN CTHD B ON A.MASP = B.MASP  JOIN HOADON C ON B.SOHD = C.SOHD
WHERE NGHD = '2007/1/1' 
---15.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT MASP , TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD)
---16.	In ra danh sách các sản phẩm (MASP,TENSP) 
--------không bán được trong năm 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD JOIN HOADON ON CTHD.SOHD = HOADON.SOHD 
                     WHERE YEAR(NGHD) = '2006')
---17.	In ra danh sách các sản phẩm (MASP,TENSP) 
--------do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND MASP NOT IN (
      SELECT MASP 
	  FROM CTHD JOIN HOADON ON CTHD.SOHD = HOADON.SOHD 
	  WHERE YEAR(NGHD)= '2006')

---18.	Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.

Select sohd from HOADON where not exists
(select * from SANPHAM
where nuocsx='SINGAPORE' and not exists
(select * from CTHD where
HOADON.sohd=CTHD.sohd and
CTHD.masp=SANPHAM.masp))
---19.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất 
---cả các sản phẩm do Singapore sản xuất.
SELECT H.SOHD 
FROM HOADON H
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = H.SOHD
AND C.MASP = S.MASP))
-----------BAI 5 QLGV III.11 TO III.18------
--11.	Tìm họ tên giáo viên dạy môn CTRR cho 
--------cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT GIAOVIEN.HOTEN
FROM GIANGDAY JOIN GIAOVIEN ON GIANGDAY.MAGV = GIAOVIEN.MAGV
WHERE GIANGDAY.MALOP = 'K11' AND HOCKY ='1' AND NAM ='2006'
INTERSECT
SELECT GIAOVIEN.HOTEN
FROM GIANGDAY JOIN GIAOVIEN ON GIANGDAY.MAGV = GIAOVIEN.MAGV
WHERE GIANGDAY.MALOP = 'K12' AND HOCKY ='1' AND NAM ='2006'

--12.	Tìm những học viên (mã học viên, họ tên) thi 
--------không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
USE QLGV
SELECT  C.MAHV,C.HO,C.TEN
FROM KETQUATHI A JOIN HOCVIEN C ON A.MAHV = C.MAHV
WHERE   A.MAMH = 'CSDL' AND A.KQUA ='KHONG DAT' 
                  AND NOT EXISTS (SELECT*
                  FROM KETQUATHI B
				  WHERE B.LT>1 AND  B.MAHV = A.MAHV AND B.MAMH = 'CSDL'  )

--13.	Tìm giáo viên (mã giáo viên, họ tên) không được phân 
--------công giảng dạy bất kỳ môn học nào.
SELECT MAGV, HOTEN
FROM GIAOVIEN A
WHERE NOT EXISTS (SELECT*FROM GIANGDAY B WHERE A.MAGV= B.MAGV)
--14.	Tìm giáo viên (mã giáo viên, họ tên) không được phân 
--------công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT MAGV, HOTEN
FROM GIAOVIEN
WHERE NOT EXISTS ( SELECT * FROM GIANGDAY JOIN MONHOC ON GIANGDAY.MAMH = MONHOC.MAMH
               WHERE MONHOC.MAKHOA = GIAOVIEN.MAKHOA AND GIANGDAY.MAGV = GIAOVIEN.MAGV )
--15.	Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ 
-------quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT HO,TEN
FROM HOCVIEN A
WHERE A.MALOP = 'K11' AND A.MAHV NOT IN
             (SELECT MAHV FROM KETQUATHI 
			  WHERE (LT > '3' AND KQUA = 'KHONG DAT' ) OR (LT = 2 AND MAMH ='CTRR' AND DIEM = '5'))

--16.	Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong 
---------cùng một học kỳ của một năm học
SELECT GV.HOTEN FROM GIAOVIEN GV, (SELECT DISTINCT GD1.MAGV FROM GIANGDAY GD1, GIANGDAY GD2
WHERE GD1.MAGV = GD2.MAGV AND GD1.MAMH = 'CTRR' AND GD2.MAMH = 'CTRR' AND GD1.MALOP <> GD2.MALOP AND GD1.HOCKY = GD2.HOCKY) X
WHERE GV.MAGV = X.MAGV;			

--17.	Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của
--------lần thi sau cùng).
SELECT MAHV, DIEM 
FROM KETQUATHI A
WHERE A.LT = (SELECT MAX(B.LT) FROM KETQUATHI B 
              WHERE MAMH = 'CSDL' AND A.MAHV = B.MAHV)
--18.	Danh sách học viên và điểm thi môn “Co So Du Lieu” 
--------(chỉ lấy điểm cao nhất của các lần thi).
SELECT MAHV, DIEM 
FROM KETQUATHI A
WHERE A.DIEM = (SELECT MAX(B.DIEM) FROM KETQUATHI B 
              WHERE MAMH = 'CSDL' AND A.MAHV = B.MAHV)

-------------------TUẦN 4 --------------
--Bài tập yêu cầu
--------1. Bài tập 1
--Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 20 đến 30.
--20.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(SOHD)
FROM HOADON
WHERE MAKH IS NULL
--21.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP)
FROM HOADON A JOIN CTHD B ON A.SOHD = B.SOHD
WHERE YEAR(NGHD) = '2006'
SELECT*FROM HOADON
--22.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) MAX_TRIGIA_HD, MIN(TRIGIA) MIN_TRIGIA_HD
FROM HOADON

--23.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) TRIGIA_TP
FROM HOADON
WHERE YEAR(NGHD) = '2006'
--24.	Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) DOANH_THU
FROM HOADON
WHERE YEAR(NGHD) = '2006'
--25.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD) = '2006')
--26.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN
FROM KHACHHANG A JOIN HOADON  B ON A.MAKH = B.MAKH
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD) = '2006')
--27.	In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
--28.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP
FROM SANPHAM A
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA 
              FROM SANPHAM B
			  ORDER BY GIA DESC)
--CACH 2 CHUA LAM XONG
SELECT MASP, TENSP
FROM SANPHAM A
WHERE  EXISTS (SELECT TOP 3 GIA
              FROM SANPHAM B
			  WHERE A.MASP = B.MASP
			  ORDER BY GIA DESC)
--29.	In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (SELECT TOP 3 GIA
                                     FROM SANPHAM
									 ORDER BY GIA DESC)
--30.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (SELECT TOP 3 GIA
              FROM SANPHAM
			  WHERE NUOCSX = 'TRUNG QUOC'
			  ORDER BY GIA DESC)
--2. Bài tập 2
--Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 19 đến câu 25.
USE QLGV
--19.	Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA, TENKHOA
FROM KHOA 
WHERE NGTLAP = (SELECT MIN(NGTLAP)
                FROM KHOA )
--20.	Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(MAGV) SL_GV__S
FROM GIAOVIEN
WHERE HOCHAM = 'GS' OR HOCHAM = 'PGS'
--21.	Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT HOCVI,COUNT(MAGV) SL
FROM GIAOVIEN
GROUP BY HOCVI
--22.	Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT A.MAMH ,kết_quả_đạt, kết_quả_không_đạt
FROM (SELECT MAMH, COUNT(DISTINCT MAHV) AS kết_quả_đạt
      FROM KETQUATHI 
	  WHERE KQUA = 'DAT' 
	  GROUP BY MAMH) AS A,
	  (SELECT X.MAMH, COUNT( DISTINCT X.MAHV) AS kết_quả_không_đạt
      FROM (SELECT MAMH,  MAHV FROM KETQUATHI Q  WHERE Q.KQUA = 'KHONG DAT'
	        EXCEPT
			SELECT MAMH,  MAHV FROM KETQUATHI R WHERE R.KQUA = 'DAT') AS	X				   
	  GROUP BY X.MAMH) AS B
WHERE A.MAMH = B.MAMH
--23.	Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, 
-------đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT DISTINCT C.MAGV,  HOTEN
FROM (LOP A JOIN GIANGDAY B ON A.MALOP = B.MALOP AND A.MAGVCN = B.MAGV)   JOIN
      GIAOVIEN C ON A.MAGVCN = C.MAGV
--24.	Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT HO, TEN
FROM HOCVIEN
WHERE MAHV IN (SELECT TRGLOP FROM LOP 
              WHERE SISO = (SELECT MAX(SISO) FROM LOP ))
--25.	* Tìm họ tên những LOPTRG thi không đạt quá 3 môn 
---------(mỗi môn đều thi không đạt ở tất cả các lần thi).
SELECT A.HO, A.TEN
FROM HOCVIEN A JOIN LOP B ON A.MAHV = B.TRGLOP
WHERE A.MAHV IN (SELECT MAHV
                FROM (SELECT MAHV,MAMH FROM KETQUATHI WHERE KQUA = 'KHONG DAT'
                      EXCEPT 
				      SELECT MAHV, MAMH FROM KETQUATHI WHERE KQUA = 'DAT' ) C
			    GROUP BY MAHV
				HAVING COUNT(MAMH) >3 )

--3. Bài tập 3
--Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 31 đến 45.
USE  QLBH
--31.	* In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT TOP 3 MAKH
FROM KHACHHANG
ORDER BY DOANHSO DESC
--32.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT  COUNT(MASP) AS Tổng_số_sản_phẩm_của_Tàu 
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
--33.	Tính tổng số sản phẩm của từng nước sản xuất.
SELECT DISTINCT NUOCSX, COUNT(MASP) AS Số_lượng
FROM SANPHAM
GROUP BY NUOCSX
--34.	Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT DISTINCT NUOCSX, MAX(GIA) AS GIÁ_LỚN_NHẤT, MIN(GIA) AS GIÁ_BÉ_NHẤT, AVG(GIA) AS GIA_TB
FROM SANPHAM
GROUP BY NUOCSX
--35.	Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS TỔNG_DOANH_THU
FROM HOADON
GROUP BY NGHD
--36.	Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT COUNT(B.MASP) AS TỔNG_SỐ_LƯỢNG
FROM HOADON A JOIN CTHD B ON A.SOHD = B.SOHD
WHERE MONTH(NGHD) = '10' AND YEAR(NGHD) = '2006'
--37.	Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD),SUM(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = '2006'
GROUP BY MONTH(NGHD)
--38.	Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(MASP) >=4
--39.	Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT SOHD
FROM CTHD A JOIN SANPHAM B ON A.MASP = B.MASP
WHERE NUOCSX = 'VIET NAM'
GROUP BY SOHD
HAVING COUNT(A.MASP) =3
--40.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT TOP 1 A.MAKH,HOTEN, COUNT(SOHD) AS SỐ_LẦN_MUA
FROM HOADON B JOIN KHACHHANG A ON A.MAKH = B.MAKH
GROUP BY A.MAKH,A.HOTEN
ORDER BY  SỐ_LẦN_MUA DESC
--41.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1 MONTH(NGHD) AS THÁNG_DS_CAO_NHẤT, SUM(TRIGIA) AS TỔNG_DOANH_THU
FROM HOADON
WHERE YEAR(NGHD) = '2006'
GROUP BY MONTH(NGHD)
ORDER BY TỔNG_DOANH_THU DESC
--42.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT TOP 1 A.MASP, A.TENSP, SUM(SL) AS TỔNG_SL
FROM (SANPHAM A JOIN CTHD B ON A.MASP = B.MASP) JOIN HOADON C ON B.SOHD = C.SOHD
WHERE YEAR(NGHD) = '2006'
GROUP BY A.MASP,A.TENSP
ORDER BY TỔNG_SL ASC
--43.	*Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT NUOCSX,MASP, TENSP
FROM SANPHAM A
WHERE GIA = (SELECT MAX(GIA) FROM SANPHAM B WHERE A.NUOCSX = B.NUOCSX) 
GROUP BY NUOCSX,MASP,TENSP
--44.	Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX , COUNT(DISTINCT GIA) AS SỐ_SP_CO_GIA_KHACNHAU
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(GIA) >= 3
--45.	Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
SELECT TOP 1 A.MAKH , A.HOTEN
FROM  (SELECT TOP 10 MAKH , HOTEN FROM KHACHHANG  ORDER BY DOANHSO DESC) A
      JOIN HOADON B ON A.MAKH = B.MAKH
GROUP BY A.MAKH, A.HOTEN
ORDER BY COUNT(SOHD)

--4. Bài tập 4
--Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 26 đến câu 35.
USE  QLGV
--26.	Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT TOP 1 A.MAHV, A.HO , A.TEN
FROM HOCVIEN A JOIN KETQUATHI B ON A.MAHV = B.MAHV
WHERE DIEM >= 9
GROUP BY A.MAHV,A.HO, A.TEN
ORDER BY COUNT(MAMH) DESC
--27.	Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT A.MAHV, A.HO, A.TEN, (COUNT(MAMH)) 
FROM HOCVIEN A JOIN KETQUATHI B ON A.MAHV = B.MAHV
WHERE DIEM >=9
GROUP BY MALOP , A.MAHV, A.HO, A.TEN
HAVING COUNT(MAMH) = (SELECT MAX(SO_LUONG)
                      FROM (SELECT C.MAHV, C.HO, C.TEN, (COUNT(MAMH)) AS SO_LUONG
                            FROM HOCVIEN C JOIN KETQUATHI D ON C.MAHV = D.MAHV
                            WHERE DIEM >=9 AND A.MALOP = C.MALOP
                            GROUP BY MALOP , C.MAHV, C.HO, C.TEN )AS TEMP ) 

--28.	Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT NAM,HOCKY, MAGV, COUNT(MAMH)
FROM GIANGDAY
GROUP BY NAM,HOCKY , MAGV
--29.	Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT NAM,HOCKY, MAGV, COUNT(MAMH)
FROM GIANGDAY A
GROUP BY A.NAM,A.HOCKY , A.MAGV
HAVING COUNT(MAMH) = (SELECT MAX(SO_LUONG) 
                      FROM (SELECT NAM,HOCKY, MAGV, COUNT(MAMH) AS SO_LUONG
                            FROM GIANGDAY B
							WHERE A.NAM = B.NAM AND A.HOCKY = B.HOCKY
                            GROUP BY B.NAM,B.HOCKY , B.MAGV) AS TEMP)
--30.	Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT A.MAMH, A.TENMH
FROM MONHOC A JOIN KETQUATHI B ON A.MAMH = B.MAMH
WHERE LT = '1' AND KQUA = 'KHONG DAT'
GROUP BY A.MAMH, A.TENMH
HAVING COUNT(DISTINCT MAHV) = (SELECT MAX(SL) 
                                 FROM (SELECT A.MAMH, A.TENMH, COUNT(MAHV) AS SL
                                 FROM MONHOC A JOIN KETQUATHI B ON A.MAMH = B.MAMH
				  				 WHERE LT = '1' AND KQUA = 'KHONG DAT'
								 GROUP BY A.MAMH, A.TENMH) AS TEMP )
--31.	Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT DISTINCT A.MAHV, HO, TEN
FROM HOCVIEN A JOIN KETQUATHI B ON A.MAHV = B.MAHV
WHERE NOT EXISTS (SELECT*
                  FROM KETQUATHI C 
				  WHERE KQUA = 'KHONG DAT'AND LT ='1' AND B.MAHV = C.MAHV)
--32.	Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT DISTINCT A.MAHV, HO, TEN
FROM HOCVIEN A JOIN KETQUATHI B ON A.MAHV = B.MAHV
WHERE NOT EXISTS (SELECT*
                  FROM KETQUATHI C 
				  WHERE KQUA = 'KHONG DAT'AND LT = (SELECT MAX(LT) 
				                                    FROM KETQUATHI D
													WHERE D.MAHV = C.MAHV AND D.MAHV = B.MAHV AND C.MAMH = D.MAMH)
				                          )
--33.   Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
SELECT DISTINCT A.MAHV, HO, TEN
FROM HOCVIEN A JOIN KETQUATHI B ON A.MAHV = B.MAHV
WHERE NOT EXISTS (SELECT*
                  FROM KETQUATHI C 
				  WHERE KQUA = 'KHONG DAT'AND LT ='1' AND B.MAHV = C.MAHV)
	  AND NOT EXISTS  (SELECT*FROM KETQUATHI  D
	                         WHERE NOT EXISTS (SELECT*FROM GIANGDAY E WHERE D.MAMH = E.MAMH ))
					  ---Chưa làm xong ----
--34.	Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt  (chỉ xét lần thi sau cùng).

--35.	Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
 SELECT Q.MAHV, HO, TEN
 FROM HOCVIEN Q JOIN KETQUATHI R ON Q.MAHV =R.MAHV
 WHERE DIEM IN ( SELECT DISTINCT MAX(DIEM)
                 FROM HOCVIEN A JOIN KETQUATHI B ON A.MAHV = B.MAHV
				 WHERE R.MAMH = B .MAMH
                 GROUP BY MAMH )
-------------------TUẦN 5 ------------------
---1. Bài tập 1
---Sinh viên hoàn thành Phần I bài tập QuanLyBanHang từ câu 11 đến 14.
--11.	Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).
USE QLBH
CREATE TRIGGER TRG_NGHD ON HOADON
FOR INSERT 
AS 
BEGIN 
     DECLARE @NGAYHD SMALLDATETIME , @MAKH CHAR(4), @NGAYDK  SMALLDATETIME 
	 ---LAY THONG TIN CUA HOADON VUA MOI THEM VAO
	 SELECT @NGAYHD = NGHD , @MAKH = MAKH
	 FROM INSERTED
	 ---LAY THONG TIN KHACHHANG TUONG UONG
	 SELECT @NGAYDK = NGDK
	 FROM KHACHHANG 
	 WHERE MAKH = @MAKH
	 --SO SANH
	 IF (@NGAYDK > @NGAYHD) 
	 BEGIN 
	     PRINT 'LOI: NGAY HOA DON KHONG HOP LE!'
		 ROLLBACK TRANSACTION
	 END
	 ELSE
	 BEGIN
	     PRINT 'THEM MOT MOT HOA DON THANH CONG'
	END
END
--12.	Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.
CREATE TRIGGER TRG_NGDK_NV ON HOADON
FOR INSERT
AS
BEGIN
    DECLARE @NGAYHD SMALLDATETIME , @MANV CHAR(4), @NGAYVL SMALLDATETIME
	---LAY THONG TIN CUA HOA DON MOI THEM VAO
	SELECT @NGAYHD = NGHD , @MANV = MANV
	FROM INSERTED
	---LAY THONG TIN NHAN VIEN TUONG UNG 
	SELECT @NGAYVL = NGVL
	FROM NHANVIEN
	WHERE MANV = @MANV
	IF(@NGAYVL > @NGAYHD)
	BEGIN
	    PRINT 'LOI: VUI LONG NHAP LAI'
		ROLLBACK TRANSACTION
	END 
	ELSE 
	BEGIN
	    PRINT 'THEM THANH CONG'
	END
END
SELECT*FROM HOADON
--DELETE FROM HOADON WHERE SOHD ='1024'
--INSERT INTO HOADON VALUES ('1024', '2006-07-23', 'KH01', 'NV02', '320,000');
--13.	Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.
CREATE TRIGGER TRG_TONTAI_CTHD on HOADON
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @SOHD INT
	--LAY THONG TIN CUA HOA DON
	SELECT @SOHD = SOHD 
	FROM INSERTED
	IF(@SOHD NOT IN (SELECT SOHD FROM CTHD))
	BEGIN
	   PRINT 'THEM HOA DON BI LOI'
	   ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN 
	   PRINT 'THEM HOA DON THANH CONG'
	END
END
--14.	Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.
CREATE TRIGGER TRG_INS_CTHD ON CTHD
FOR INSERT
AS
BEGIN
    -- Khai báo các giá trị của trigger
    DECLARE @SOHD INT, @MASP CHAR(4) , @SL INT, @TRIGIA MONEY
	-- Lấy thông tin của CTHD vừa mới thêm vào
	SELECT @SOHD = SOHD , @MASP = MASP , @SL = SL
	FROM INSERTED
	--Tính trị giá của sản phẩm mới thêm vào Hóa Đơn
	SET @TRIGIA = @SL * (SELECT GIA FROM SANPHAM WHERE MASP = @MASP)
	--Khai báo Cusor  duyet qua tat các CTHD da co san trong HoaDon
	DECLARE CUR_CTHD CURSOR
	FOR 
	   SELECT MASP, SL
	   FROM CTHD
	   WHERE SOHD = @SOHD

	OPEN CUR_CTHD 
	FETCH NEXT FROM CUR_CTHD
	INTO @MASP, @SL
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	    --Cộng dồn trị giá của từng sản phẩm vào biến TriGia
		SET @TRIGIA = @TRIGIA + @SL * (SELECT GIA FROM SANPHAM WHERE MASP = @MASP)
	    FETCH NEXT FROM CUR_CTHD
		INTO @MASP, @SL
	END
	
	CLOSE CUR_CTHD
	DEALLOCATE CUR_CTHD
	---Tiến hành cập nhập lại giá trị cho HOADON
	UPDATE  HOADON SET TRIGIA  = @TRIGIA WHERE SOHD = @SOHD
END


CREATE TRIGGER TRG_UPD_CTHD ON CTHD
FOR UPDATE
AS
BEGIN
    -- Khai báo các giá trị của trigger
    DECLARE @SOHD INT, @MASP CHAR(4) , @SL INT, @TRIGIA MONEY, @TRIGIACU MONEY
	-- Lấy thông tin của CTHD vừa mới thêm vào
	SELECT @SOHD = SOHD , @MASP = MASP , @SL = SL
	FROM INSERTED
	--Tính trị giá của sản phẩm mới thêm vào Hóa Đơn
	SET @TRIGIA = @SL * (SELECT GIA FROM SANPHAM WHERE MASP = @MASP)
	SET @TRIGIACU = (SELECT SL FROM CTHD WHERE MASP = @MASP AND SOHD = @SOHD) * (SELECT GIA FROM SANPHAM WHERE MASP = @MASP)
	--Khai báo Cusor  duyet qua tat các CTHD da co san trong HoaDon
	DECLARE CUR_CTHD CURSOR
	FOR 
	   SELECT MASP, SL
	   FROM CTHD
	   WHERE SOHD = @SOHD

	OPEN CUR_CTHD 
	FETCH NEXT FROM CUR_CTHD
	INTO @MASP, @SL
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	    --Cộng dồn trị giá của từng sản phẩm vào biến TriGia
	
		SET @TRIGIA = @TRIGIA + @SL * (SELECT GIA FROM SANPHAM WHERE MASP = @MASP)
		FETCH NEXT FROM CUR_CTHD
		INTO @MASP, @SL
	END
	
	CLOSE CUR_CTHD
	DEALLOCATE CUR_CTHD
	---Tiến hành cập nhập lại giá trị cho HOADON
	UPDATE  HOADON SET TRIGIA  = @TRIGIA-@TRIGIACU WHERE SOHD = @SOHD
END

CREATE TRIGGER CUR_DEL_CTHD ON CTHD
FOR DELETE
AS
BEGIN 
    DECLARE @SOHD INT, @MASP CHAR(4), @SOLUONG INT, @TRIGIA MONEY
	SELECT @SOHD = SOHD, @MASP = MASP , @SOLUONG = SL
	FROM DELETED
	SET @TRIGIA = @SOLUONG* (SELECT GIA FROM SANPHAM WHERE @MASP = MASP)
	UPDATE HOADON SET TRIGIA = TRIGIA - @TRIGIA WHERE SOHD = @SOHD
END

SELECT*FROM SANPHAM
SELECT*FROM CTHD
SELECT*FROM HOADON
DELETE FROM CTHD WHERE MASP = 'BB01' AND SOHD = '1001'
DELETE FROM CTHD WHERE MASP = 'BB01' AND SOHD = '1002'
UPDATE CTHD SET SL = '2' WHERE MASP = 'BB01'
INSERT INTO CTHD VALUES ('1001' ,'BB01', '1')
INSERT INTO CTHD VALUES  ('1002', 'BB01', '1');
--- Tại sao lại thêm hai lần chỗ này ????

--- PHAN I(9,10,15-24) ---
USE QLGV
--9.	Lớp trưởng của một lớp phải là học viên của lớp đó.
CREATE TRIGGER TRG_INS_LT ON LOP
FOR INSERT ,UPDATE
AS
BEGIN
    DECLARE @MALOP CHAR(3), @TRGLOP CHAR(5)
	SELECT @MALOP = MALOP , @TRGLOP = TRGLOP
	FROM INSERTED
	IF (@MALOP <> (SELECT MALOP FROM HOCVIEN WHERE MAHV = @TRGLOP ))
	BEGIN
	     PRINT 'LOI: HOC VIEN LOP TRUONG KHONG HOP LE !!!'
		 ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
	     PRINT'LOP TRUONG HOP LE :3 '
	END
END

CREATE TRIGGER TRG_DEL_LT ON HOCVIEN
FOR DELETE
AS
BEGIN
	DECLARE @MAHV CHAR(5), @MALOP CHAR(3)
	SELECT @MAHV = MAHV , @MALOP = MALOP
	FROM DELETED
	IF ( @MAHV = (SELECT TRGLOP FROM LOP WHERE MALOP = @MALOP))
	BEGIN
		PRINT' DAY LA LOP TRUONG KO THE XOA !'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT' XÓA THÀNH CÔNG ĐÂY KO PHẢI LÀ LỚP TRƯỞNG '
	END

END
--10.	Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.

CREATE TRIGGER TRG_INS_KHOA ON KHOA 
FOR INSERT ,UPDATE
AS
BEGIN
	DECLARE @MAKHOA VARCHAR(4), @TRGKHOA CHAR(4)
	SELECT @MAKHOA = MAKHOA , @TRGKHOA = TRGKHOA 
	FROM INSERTED
	IF (@MAKHOA = (SELECT MAKHOA FROM GIAOVIEN WHERE MAGV = @TRGKHOA) AND 
	    ((SELECT HOCVI FROM GIAOVIEN WHERE MAGV = @TRGKHOA) = 'TS' OR 
		(SELECT HOCVI FROM GIAOVIEN WHERE MAGV = @TRGKHOA)  = 'PTS'))
	BEGIN 
		PRINT'THEM KHOA THANH CONG'
	END
	ELSE
	BEGIN
		PRINT'TRG KHOA KHONG HOP LE'
		ROLLBACK TRANSACTION
	END
END 

CREATE TRIGGER TRG_UPD_TRGKHOA ON GIAOVIEN
FOR UPDATE
AS
BEGIN
	DECLARE @HOCVI VARCHAR(10), @MAGV CHAR(4), @MAKHOA VARCHAR(4)
	SELECT @HOCVI = HOCVI , @MAGV = MAGV , @MAKHOA = MAKHOA
	FROM INSERTED
	IF ((@HOCVI = 'TS' OR @HOCVI = 'PTS') 
		AND @MAGV = (SELECT TRGKHOA FROM KHOA WHERE MAKHOA = @MAKHOA) )
	BEGIN
		PRINT' CHINH SUA THANH CONG'
	END
	ELSE
	BEGIN
		PRINT'HOC VI KO PHU HOP VOI TRG KHOA'
		ROLLBACK TRANSACTION
	END
END

CREATE TRIGGER TRG_DEL_TRGKHOA ON GIAOVIEN
FOR DELETE
AS
BEGIN
	DECLARE @MAGV CHAR(4) , @MAKHOA VARCHAR(4)
	SELECT @MAGV = MAGV , @MAKHOA = MAKHOA
	FROM DELETED
	IF ( @MAGV = (SELECT TRGKHOA FROM KHOA WHERE MAKHOA = @MAKHOA))
	BEGIN
		PRINT'KHONG THE XOA TRUONG KHOA '
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT'XOA THANH CONG GIAO VIEN'
	END
END
--15.	Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
CREATE TRIGGER TRG_UPD_DCTHI ON GIANGDAY
FOR UPDATE
AS
BEGIN
	DECLARE @NGKT SMALLDATETIME, @NGTHI SMALLDATETIME , @MAMH VARCHAR(4)
	SELECT @NGKT = DENNGAY , @MAMH = MAMH
	FROM INSERTED
	DECLARE CUR_THI CURSOR
	FOR 
		SELECT NGTHI
		FROM KETQUATHI
		WHERE MAMH = @MAMH
	OPEN CUR_THI
	FETCH NEXT FROM CUR_THI
	INTO @NGTHI
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@NGKT > @NGTHI)
		BEGIN
			PRINT'NGÀY KET THUC MON HỌC KHÔNG HỢP LỆ '
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			PRINT'CAP NHAP THANH CONG'
		END
	END
	CLOSE CUR_THI
	DEALLOCATE CUR_THI
END
CREATE TRIGGER TRG_INS_KQT ON KETQUATHI
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @NGKT SMALLDATETIME, @NGTHI SMALLDATETIME, @MAMH VARCHAR(10)
	SELECT @NGTHI = NGTHI , @MAMH = MAMH
	FROM INSERTED
	SELECT @NGKT = (SELECT DENNGAY FROM GIANGDAY WHERE MAMH = @MAMH)
	IF(@NGTHI < @NGKT)
	BEGIN
		PRINT' TAC VU KHONG THANH CONG'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT'TAC VU THANH CON '
	END
END
--16.	Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
CREATE TRIGGER  TRG_INS_SOMH ON GIANGDAY
FOR INSERT , UPDATE
AS
BEGIN
	DECLARE @SL_MH INT, @HOCKY TINYINT , @NAM SMALLINT, @MAMH VARCHAR(10)
	SELECT @HOCKY = HOCKY, @NAM = NAM, @MAMH = MAMH 
	FROM INSERTED
	SELECT @SL_MH = (SELECT COUNT(MAMH) FROM GIANGDAY WHERE HOCKY = @HOCKY AND NAM = @NAM GROUP BY NAM, HOCKY)
	IF(@MAMH NOT IN (SELECT MAMH FROM GIANGDAY WHERE NAM = @NAM AND HOCKY = @HOCKY))
	BEGIN
		SET @SL_MH = @SL_MH + 1
	END
	IF(@SL_MH > 3)
	BEGIN
		PRINT'LOP DA FULL CHO KY NAY, KHONG THEM DUOC !'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT'THEM LOP GIANG DAY THANH CONG ^ ^'
	END
END
--17.	Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
SELECT MALOP,COUNT(MAHV) AS SL
FROM HOCVIEN
GROUP BY MALOP
CREATE TRIGGER TRG_SISO_INS ON HOCVIEN
FOR INSERT
AS
BEGIN
    DECLARE @MALOP CHAR(3) , @SL_HV INT
	DECLARE CUR_SISO_HOCVIEN CURSOR
	FOR
		SELECT MALOP ,COUNT(MAHV) AS SL_HV
		FROM HOCVIEN
		GROUP BY MALOP
	OPEN CUR_SISO_HOCVIEN
	FETCH NEXT FROM CUR_SISO_HOCVIEN
	INTO @MALOP, @SL_HV
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	    
	
		
		UPDATE LOP SET SISO = @SL_HV WHERE MALOP = @MALOP
		FETCH NEXT FROM CUR_SISO_HOCVIEN
		INTO @MALOP, @SL_HV
	END
	CLOSE CUR_SISO_HOCVIEN
	DEALLOCATE CUR_SISO_HOCVIEN
END
CREATE TRIGGER TRG_SISO_DEL ON HOCVIEN
FOR DELETE
AS
BEGIN
    DECLARE @MALOP CHAR(3) , @SL_HV INT
	DECLARE CUR_SISO_HOCVIEN CURSOR
	FOR
		SELECT MALOP ,COUNT(MAHV) AS SL_HV
		FROM HOCVIEN
		GROUP BY MALOP
	OPEN CUR_SISO_HOCVIEN
	FETCH NEXT FROM CUR_SISO_HOCVIEN
	INTO @MALOP, @SL_HV
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		UPDATE LOP SET SISO = @SL_HV WHERE MALOP = @MALOP
		FETCH NEXT FROM CUR_SISO_HOCVIEN
		INTO @MALOP, @SL_HV
	END
	CLOSE CUR_SISO_HOCVIEN
	DEALLOCATE CUR_SISO_HOCVIEN
END
--DONE--
SELECT*FROM LOP
SELECT*FROM HOCVIEN
DELETE FROM HOCVIEN WHERE TEN = 'AA'
--SAO CHỖ NÀY INSERT VÀO 1 HỌC VIÊN , NÓ TĂNG 2 LẦN
INSERT INTO HOCVIEN
	( MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP )
VALUES
('K1100', 'Nguyen Van', 'AA', '1986-01-27', 'Nam', 'TpHCM', 'K11'),
     ('K1120', 'Nguyen Van', 'AAA', '1986-01-27', 'Nam', 'TpHCM', 'K12');
	 
--18.	Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
CREATE TRIGGER TRG_DK_MH ON DIEUKIEN
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MAMH VARCHAR(10) , @MAMH_TRUOC VARCHAR(10)
	DECLARE CUR_DK_MH CURSOR
	FOR
		SELECT MAMH, MAMH_TRUOC
		FROM INSERTED
	OPEN CUR_DK_MH
	FETCH NEXT FROM CUR_DK_MH
	INTO @MAMH , @MAMH_TRUOC
	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		IF ((@MAMH = @MAMH_TRUOC) 
		      OR (@MAMH = (SELECT MAMH_TRUOC FROM DIEUKIEN WHERE MAMH = @MAMH_TRUOC )))
		BEGIN
			PRINT'TAC VU KHONG THANH CONG'
			FETCH LAST FROM CUR_DK_MH
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			FETCH NEXT FROM CUR_DK_MH
		END	
	END
	PRINT 'TAC VU THANH CONG'
	CLOSE CUR_DK_MH
	DEALLOCATE CUR_DK_MH

END
--19.	Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
SELECT*FROM GIAOVIEN
CREATE TRIGGER TRG_INS_GV ON GIAOVIEN
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @HOCVI VARCHAR(4), @HOCHAM VARCHAR(4), @HESO NUMERIC, @MUCLUONG MONEY
	DECLARE CUR_GV_ML CURSOR
	FOR
		SELECT HOCVI, HOCHAM, HESO, MUCLUONG
		FROM INSERTED
	OPEN CUR_GV_ML
	FETCH NEXT FROM CUR_GV_ML
	INTO @HOCVI, @HOCHAM, @HESO, @MUCLUONG
	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		IF (@MUCLUONG <> (SELECT MUCLUONG FROM GIAOVIEN WHERE HOCVI = @HOCVI AND HOCHAM = @HOCHAM AND HESO = @HESO))
		BEGIN
			PRINT' TAC VU KHONG THANH CONG'
			FETCH LAST FROM CUR_GV_ML
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			FETCH NEXT FROM CUR_GV_ML
		END
	END
END
--20.	Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
CREATE TRIGGER TRG_KQT_LT ON KETQUATHI
FOR INSERT
AS
BEGIN
	DECLARE @MAHV CHAR(5), @MAMH VARCHAR (10) , @LT TINYINT, @DIEM NUMERIC
	DECLARE CUR_KQT_LT CURSOR
	FOR
		SELECT MAHV, MAMH, LT, DIEM
		FROM INSERTED
	OPEN CUR_KQT_LT 
	FETCH NEXT FROM CUR_KQT_LT
	INTO @MAHV, @MAMH, @LT, @DIEM
	WHILE (@@FETCH_STATUS = 0)
    BEGIN
		IF (@LT > 1 )
		BEGIN
			IF (5 > ALL (SELECT DIEM FROM KETQUATHI WHERE MAMH = @MAMH AND MAHV = @MAHV ))
			BEGIN
				FETCH NEXT FROM CUR_KQT_LT
			END
			ELSE
			BEGIN
				PRINT'TAC VU KHONG THANH CONG'
				FETCH LAST FROM CUR_KQT_LT
				ROLLBACK TRANSACTION
			END
		END
	END
END
SELECT*FROM KETQUATHI
--21.	Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
CREATE TRIGGER TRG_NGTHI_KQT ON KETQUATHI
FOR INSERT , UPDATE
AS
BEGIN
	DECLARE @NGTHI SMALLDATETIME, @MAHV CHAR(5), @MAMH VARCHAR(10), @LT TINYINT
	DECLARE CUR_NGTHI_KQT CURSOR
	FOR 
		SELECT NGTHI, MAHV, MAMH, LT
		FROM INSERTED
	OPEN CUR_NGTHI_KQT
	FETCH NEXT FROM CUR_NGTHI_KQT
	INTO @NGTHI , @MAHV, @MAMH, @LT

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@LT = 1)
		BEGIN
			IF(@NGTHI > ANY (SELECT NGTHI FROM KETQUATHI WHERE MAMH = @MAMH AND MAHV = @MAHV  ))
			BEGIN
				PRINT'TAC VU LOI '
				FETCH LAST FROM CUR_NGTHI_KQT
				ROLLBACK TRANSACTION
			END
			ELSE
			BEGIN
				FETCH NEXT FROM CUR_NGTHI_KQT
			END
		END
		ELSE IF (@LT > 1 )
		BEGIN
			IF (@NGTHI > ALL (SELECT NGTHI FROM KETQUATHI WHERE MAMH = @MAMH AND MAHV = @MAHV AND LT < @LT))
			BEGIN
				FETCH NEXT FROM CUR_NGTHI_KQT
			END
			ELSE
			BEGIN
				PRINT'THONG BAO LOI'
				FETCH LAST FROM CUR_NGTHI_KQT
				ROLLBACK TRANSACTION
			END
		END
	END
END
--22.	Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
---GIỐNG CÂU 15
--23.	Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học xong những môn học phải học trước mới được học những môn liền sau).

--24.	Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.

