CREATE TABLE Dim_Ngay (
    MaNgay CHAR(4)  PRIMARY KEY,
    Ngay INT NOT NULL,
    Thang INT NOT NULL,
    Quy INT NOT NULL,
    Nam INT NOT NULL,
    NgayTrongTuan NVARCHAR(20) NOT NULL
);
---Bảng Dim_CuaHang
CREATE TABLE Dim_CuaHang (
MaCuaHang CHAR(5) PRIMARY KEY,
TenThanhPho NVARCHAR(30) NOT NULL,
TenQuanHuyen NVARCHAR(30) NOT NULL,
TenCuaHang NVARCHAR(100) NOT NULL,
DiaChi NVARCHAR(100) NOT NULL
);

---Bảng Dim_NhanVien
CREATE TABLE Dim_NhanVien(
MaNhanVien VARCHAR (5) PRIMARY KEY,
MaCuaHang CHAR(5) NOT NULL,
TenNhanVien NVARCHAR (50) NOT NULL,
ChucVu NVARCHAR(25) NOT NULL,
SDT char (10) ,
GioiTinh nvarchar (3)

);
---Bảng Dim_NhaCungCap
CREATE TABLE Dim_NhaCungCap(
MaNhaCungCap VARCHAR(4) PRIMARY KEY,
TenNhaCungCap NVARCHAR (40) NOT NULL,
Email VARCHAR(40) NOT NULL,
SoDienThoai CHAR (10) NOT NULL 
);
---Bảng Dim_DanhMuc
CREATE TABLE Dim_DanhMuc(
MaDanhMuc VARCHAR(4) PRIMARY KEY ,
TenDanhMuc NVARCHAR (40) NOT NULL,
MoTa NVARCHAR (100)
);
---Bảng Dim_LoaiSanPham
CREATE TABLE Dim_LoaiSanPham (
MaLoai VARCHAR(5) PRIMARY KEY,
MaDanhMuc VARCHAR(4) NOT NULL,
TenLoai NVARCHAR(40) NOT NULL,
MoTa NVARCHAR(150)
); 
---Bảng Dim_SanPham
CREATE TABLE Dim_SanPham(
MaSanPham VARCHAR (6) PRIMARY KEY,
MaLoai VARCHAR(5) NOT NULL,
MaNhaCungCap VARCHAR(4) NOT NULL,
TenSanPham NVARCHAR(150) NOT NULL,
ThuongHieu NVARCHAR(25) NOT NULL,
QuocGia NVARCHAR(25) NOT NULL,
DoiTuongPhuHop NVARCHAR (40) NOT NULL,
GiaBan DECIMAL (18,3) NOT NULL,
);

---Bảng Dim_HangThanhVien
CREATE TABLE Dim_HangThanhVien (
    MaHangTV CHAR(3) PRIMARY KEY,
    TenHang NVARCHAR(50) NOT NULL,
    SoLuotMua INT NOT NULL,
    UuDai NVARCHAR(100)
);
---Bảng Dim_KhachHang
CREATE TABLE Dim_KhachHang (
    MaKhachHang CHAR(5) PRIMARY KEY,
    MaHangTV CHAR(3) NOT NULL,
    TenKhachHang NVARCHAR(50) NOT NULL,
DiaChi NVARCHAR(50) NOT NULL,
TenThanhPho NVARCHAR(30) NOT NULL,
TenQuanHuyen NVARCHAR(30) NOT NULL,
    GioiTinh NVARCHAR(3) NOT NULL,
    NgaySinh DATE NOT NULL,
    SDT CHAR(10) NOT NULL,
 );

---Bảng Dim_PhuongThucThanhToan
CREATE TABLE Dim_PhuongThucThanhToan(
MaPTTT VARCHAR(4) PRIMARY KEY,
TenPTTT NVARCHAR (20) NOT NULL
);

---b) Bảng FACT
---Bảng Fact_BanHang
CREATE TABLE Fact_BanHang(
MaGiaoDich VARCHAR (6) primary key,
MaNgay char(4)  NOT NULL,
MaNhanVien VARCHAR(5) NOT NULL,
MaKhachHang CHAR(5) NOT NULL,
MaSanPham VARCHAR(6) NOT NULL,
MaPTTT VARCHAR (4) NOT NULL,
SoLuong INT NOT NULL,
HinhThucMua NVARCHAR (25) NOT NULL,
TongTien decimal (18,3) NOT NULL 
);








---Script tạo RBTV
ALTER TABLE Dim_Ngay
ADD CONSTRAINT CK_Ngay CHECK (Ngay BETWEEN 1 AND 31);
ALTER TABLE Dim_Ngay
ADD CONSTRAINT CK_Thang CHECK (Thang BETWEEN 1 AND 12);
ALTER TABLE Dim_Ngay
ADD CONSTRAINT CK_Quy CHECK (Quy BETWEEN 1 AND 4);
ALTER TABLE Dim_Ngay
ADD CONSTRAINT CK_NgayTrongTuan CHECK (NgayTrongTuan IN (N'Thứ Hai', N'Thứ Ba', N'Thứ Tư', N'Thứ Năm', N'Thứ Sáu', N'Thứ Bảy', N'Chủ Nhật'));


ALTER TABLE Dim_NhanVien
ADD CONSTRAINT CK_NhanVien_SDT CHECK (LEN(SDT) = 10 AND SDT LIKE '[0-9]%');
ALTER TABLE Dim_NhanVien
ADD CONSTRAINT CK_NhanVien_GioiTinh CHECK (GioiTinh IN (N'Nam', N'Nữ'));
ALTER TABLE Dim_NhanVien
ADD CONSTRAINT FK_NhanVien_CuaHang FOREIGN KEY (MaCuaHang) REFERENCES Dim_CuaHang (MaCuaHang);

ALTER TABLE Dim_NhaCungCap
ADD CONSTRAINT CK_NhaCungCap_Email CHECK (Email LIKE '%@%.com');
ALTER TABLE Dim_NhaCungCap
ADD CONSTRAINT CK_NhaCungCap_SDT CHECK (LEN(SoDienThoai) = 10 AND SoDienThoai LIKE '[0-9]%');

ALTER TABLE Dim_LoaiSanPham
ADD CONSTRAINT FK_LoaiSanPham_DanhMuc FOREIGN KEY (MaDanhMuc) REFERENCES Dim_DanhMuc (MaDanhMuc);

ALTER TABLE Dim_SanPham 
ADD CONSTRAINT FK_SanPham_NhaCungCap FOREIGN KEY (MaNhaCungCap) REFERENCES Dim_NhaCungCap (MaNhaCungCap);
ALTER TABLE Dim_SanPham 
ADD CONSTRAINT FK_SanPham_Loai FOREIGN KEY (MaLoai) REFERENCES Dim_LoaiSanPham (MaLoai);

ALTER TABLE Dim_HangThanhVien
ADD CONSTRAINT CK_HangThanhVien_TenHangTV CHECK (
    TenHang IN ('Diamond', 'Silver', 'Gold','Platinum','VIP')
);

ALTER TABLE Dim_KhachHang
ADD CONSTRAINT FK_KhachHang_HangTV FOREIGN KEY (MaHangTV) REFERENCES Dim_HangThanhVien(MaHangTV);
ALTER TABLE Dim_KhachHang
ADD CONSTRAINT CK_KhachHang_SDT CHECK (LEN(SDT) = 10 AND SDT LIKE '[0-9]%');
ALTER TABLE Dim_KhachHang
ADD CONSTRAINT CK_KhachHang_GioiTinh CHECK (GioiTinh IN (N'Nam', N'Nữ'));
ALTER TABLE Fact_BanHang 
ADD CONSTRAINT FK_BanHang_Ngay FOREIGN KEY (MaNgay) REFERENCES Dim_Ngay (MaNgay);
ALTER TABLE Fact_BanHang
ADD CONSTRAINT FK_BanHang_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES Dim_NhanVien (MaNhanVien);
ALTER TABLE Fact_BanHang 
ADD CONSTRAINT FK_BanHang_KhachHang FOREIGN KEY (MaKhachHang) REFERENCES Dim_KhachHang (MaKhachHang);
ALTER TABLE Fact_BanHang 
ADD CONSTRAINT FK_BanHang_SanPham FOREIGN KEY (MaSanPham) REFERENCES Dim_SanPham (MaSanPham);

ALTER TABLE Fact_BanHang 
ADD CONSTRAINT FK_BanHang_PTTT FOREIGN KEY (MaPTTT) REFERENCES Dim_PhuongThucThanhToan (MaPTTT);

ALTER TABLE Fact_BanHang
ADD CONSTRAINT CK_SoLuong CHECK (SoLuong > 0);
ALTER TABLE Fact_BanHang
ADD CONSTRAINT CK_BanHang_HinhThucMua CHECK (HinhThucMua IN ('Offline', 'Online'));




