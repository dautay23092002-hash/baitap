# Phần Mềm Quản Lý Thư Viện (Java Swing + SQL Server)

Đồ án môn học Lập trình phần mềm Java - Quản lý thư viện sách, độc giả và mượn/trả sách.

## Chức năng chính
1. **Đăng nhập hệ thống (`LoginForm`)**: Xác thực tài khoản nhân viên từ bảng `NhanVien`.
2. **Giao diện chính (`MainForm`)**: Điều hướng nhanh tới các phân hệ quản lý.
3. **Quản lý Sách (`QuanLySachForm`)**: Thêm, sửa, xóa, tìm kiếm sách theo mã/tên/tác giả.
4. **Quản lý Độc giả (`QuanLyDocGiaForm`)**: Thêm, sửa, xóa, tìm kiếm độc giả.
5. **Quản lý Mượn - Trả (`QuanLyMuonTraForm`)**: Lập phiếu mượn, cập nhật trạng thái trả sách và tìm kiếm phiếu mượn.

## Hướng dẫn cài đặt & chạy
1. Mở **SQL Server Management Studio (SSMS)** và chạy file `QuanLyThuVienDB.sql` để tạo cơ sở dữ liệu và dữ liệu mẫu.
2. Mở project bằng **Apache NetBeans** (hoặc IntelliJ IDEA / Eclipse).
3. Thêm thư viện `mssql-jdbc` (SQL Server JDBC Driver) vào Libraries của project.
4. Cập nhật tài khoản/mật khẩu SQL Server trong file `src/connect/DBConnection.java` (mặc định `user = "sa"`, `pass = "123456"`).
5. Chạy file `src/view/LoginForm.java` (Tài khoản mẫu: `NV01` / Mật khẩu: `123456`).
