CREATE DATABASE QuanLyThuVienDB;
GO
USE QuanLyThuVienDB;
GO

CREATE TABLE NhanVien (
    MaNV VARCHAR(20) PRIMARY KEY,
    MatKhau VARCHAR(100) NOT NULL,
    HoTen NVARCHAR(100) NOT NULL,
    ChucVu NVARCHAR(50) DEFAULT N'Nhân viên',
    Sdt VARCHAR(15)
);

CREATE TABLE DocGia (
    MaDocGia VARCHAR(20) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Sdt VARCHAR(15),
    NgayLapThe DATE DEFAULT GETDATE()
);

CREATE TABLE Sach (
    MaSach VARCHAR(20) PRIMARY KEY,
    TenSach NVARCHAR(200) NOT NULL,
    TacGia NVARCHAR(100),
    TheLoai NVARCHAR(50),
    NamXuatBan INT CHECK (NamXuatBan > 1900),
    SoLuong INT DEFAULT 0 CHECK (SoLuong >= 0),
    GiaTien DECIMAL(18,2) DEFAULT 0
);

CREATE TABLE PhieuMuon (
    MaPhieu VARCHAR(20) PRIMARY KEY,
    MaDocGia VARCHAR(20) NOT NULL,
    MaNV VARCHAR(20) NOT NULL,
    NgayMuon DATE DEFAULT GETDATE(),
    NgayHenTra DATE NOT NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Đang mượn',
    CONSTRAINT FK_PhieuMuon_DocGia FOREIGN KEY (MaDocGia) REFERENCES DocGia(MaDocGia),
    CONSTRAINT FK_PhieuMuon_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE ChiTietPhieuMuon (
    MaPhieu VARCHAR(20) NOT NULL,
    MaSach VARCHAR(20) NOT NULL,
    SoLuong INT DEFAULT 1 CHECK (SoLuong > 0),
    NgayTraThucTe DATE NULL,
    TienPhat DECIMAL(18,2) DEFAULT 0,
    GhiChu NVARCHAR(255) NULL,
    CONSTRAINT PK_ChiTietPhieuMuon PRIMARY KEY (MaPhieu, MaSach),
    CONSTRAINT FK_CTPM_PhieuMuon FOREIGN KEY (MaPhieu) REFERENCES PhieuMuon(MaPhieu),
    CONSTRAINT FK_CTPM_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);
GO

INSERT INTO NhanVien VALUES
('NV01', '123456', N'Nguyễn Văn A', N'Quản lý', '0912345678'),
('NV02', '123456', N'Trần Thị B', N'Nhân viên', '0987654321');

INSERT INTO DocGia (MaDocGia, HoTen, NgaySinh, GioiTinh, Sdt) VALUES
('DG01', N'Lê Văn C', '2003-05-15', N'Nam', '0901112223'),
('DG02', N'Phạm Thị D', '2004-08-20', N'Nữ', '0904445556');

INSERT INTO Sach VALUES
('S01', N'Lập trình Java cơ bản', N'Nguyễn Văn X', N'Công nghệ thông tin', 2022, 10, 120000),
('S02', N'Cơ sở dữ liệu SQL Server', N'Trần Văn Y', N'Công nghệ thông tin', 2021, 15, 95000),
('S03', N'Đắc Nhân Tâm', N'Dale Carnegie', N'Kỹ năng sống', 2019, 8, 85000);
