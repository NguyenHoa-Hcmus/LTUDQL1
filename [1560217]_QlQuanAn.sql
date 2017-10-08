CREATE DATABASE QLQUANAN
GO

USE QLQUANAN
GO

--create table
CREATE TABLE NHANVIEN
(
	id char(10),
	username varchar(20),
	pass varchar(50),
	phone char(12),
	chinhanh char(10),
	status bit,
	type int,
	PRIMARY KEY (id)
)

CREATE TABLE DANHMUCMONAN
(
	Id char(10),
	Name nvarchar(50),
	Status bit,
	PRIMARY KEY (Id)
)

CREATE TABLE MENUMONAN
(
	Id char(10),
	Name nvarchar(50),
	Status bit,
	DanhMuc char(10),
	PRIMARY KEY (Id)
)

CREATE TABLE DANHMUCMONANCHINHANH
(
	ChiNHanh char(10),
	DanhMuc char(10),
	Status bit
	PRIMARY KEY(ChiNhanh, DanhMuc)
)

CREATE TABLE MENUCHINHANH
(
	ChiNHanh char(10),
	MonAn char(10),
	GiaTien int,
	Status bit
	PRIMARY KEY(ChiNhanh, MonAn)
)
CREATE TABLE CHINHANH
(
	Id char(10),
	Name nvarchar(50),
	Address nvarchar(150),
	Phone char(15),
	City nvarchar(50),
	SoBan int,
	PRIMARY KEY (Id)
)

CREATE TABLE CHIPHI
(
	Id char(10),
	ChiNhanh char(10),
	NoiDung nvarchar(100),
	Ngay date,
	ChiPhi int,
	PRIMARY KEY (Id)
)

CREATE TABLE REPORT
(
	ChiNhanh char(10),
	ChiPhi int,
	DoanhThu int,
	SoDonHangTaiQuan int,
	SoDonHangGiaoDi int,
	SoDonHangTongDai int,
	SoDonHangOnline int,
	Ngay Date,
	PRIMARY KEY (Ngay, ChiNhanh)
)

CREATE TABLE KHACHHANG
(
	Id char(10),
	Name nvarchar(50),
	Phone char(15),
	SoLanMua int,
	LanMuaGanNhat date,
	PRIMARY KEY (Id)
)

CREATE TABLE BAN
(
	Id char(10),
	Status bit,
	ChiNhanh char(10)
	PRIMARY KEY (id)
)

CREATE TABLE HOADON
(
	Id char(10),
	KhachHang char(10),
	ChiNhanh char(10),
	NhanVien char(10),
	Ban char(10),
	Ngay date,
	Type int, --mua ve, online,...
	CacMonAn varchar(1000),
	PRIMARY KEY (id)
)

-- Add foreign key
ALTER TABLE REPORT
ADD CONSTRAINT FK_REPORT_CHINHANH
FOREIGN KEY (ChiNhanh) REFERENCES ChiNhanh(Id);
--
ALTER TABLE NhanVien
ADD CONSTRAINT FK_NHANVIEN_CHINHANH
FOREIGN KEY (ChiNhanh) REFERENCES ChiNhanh(Id);

ALTER TABLE ChiPhi
ADD CONSTRAINT FK_ChiPhi_CHINHANH
FOREIGN KEY (ChiNhanh) REFERENCES ChiNhanh(Id);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HOADON_CHINHANH
FOREIGN KEY (ChiNhanh) REFERENCES ChiNhanh(Id);

ALTER TABLE MenuChiNhanh
ADD CONSTRAINT FK_MENUCHINHANH_CHINHANH
FOREIGN KEY (ChiNhanh) REFERENCES ChiNhanh(Id);

ALTER TABLE DanhMucMonAnChiNhanh
ADD CONSTRAINT FK_DANHMUCMONANCHINHANH_CHINHANH
FOREIGN KEY (ChiNhanh) REFERENCES ChiNhanh(Id);

ALTER TABLE Ban
ADD CONSTRAINT FK_Ban_CHINHANH
FOREIGN KEY (ChiNhanh) REFERENCES ChiNhanh(Id);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HOADON_KHACHHANG
FOREIGN KEY (KhachHang) REFERENCES KhachHang(Id);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HOADON_NHANVIEN
FOREIGN KEY (NhanVien) REFERENCES NhanVien(Id);

ALTER TABLE DanhMucMonAnChiNhanh
ADD CONSTRAINT FK_DANHMUCMONANCHINHANH_DANHMUCMONAN
FOREIGN KEY (DanhMuc) REFERENCES DanhMucMonAn(Id);

ALTER TABLE MenuChiNhanh
ADD CONSTRAINT FK_MENUCHINHANH_MENUMONAN
FOREIGN KEY (MonAn) REFERENCES MenuMonAn(Id);



--ALTER TABLE REPORT DROP CONSTRAINT FK_REPORT_CHINHANH

--insert data
INSERT INTO DANHMUCMONAN VALUES ('A104', N'Cá', 0);
INSERT INTO DANHMUCMONAN VALUES ('A105', N'Cơm', 0);
INSERT INTO DANHMUCMONAN VALUES ('A106', N'Lẩu', 1);
INSERT INTO DANHMUCMONAN VALUES ('A107', N'Chiên', 0);
INSERT INTO DANHMUCMONAN VALUES ('A108', N'Canh', 0);