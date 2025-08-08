

USE master;
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'YogaGymDB')
BEGIN
    ALTER DATABASE YogaGymDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE YogaGymDB;
END
GO
CREATE DATABASE YogaGymDB;
GO
USE YogaGymDB;
GO


IF OBJECT_ID('registrations', 'U') IS NOT NULL DROP TABLE registrations;
CREATE TABLE registrations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    class_name NVARCHAR(50) NOT NULL,
    package_type NVARCHAR(50) NOT NULL,
    note NVARCHAR(500),
    registration_date DATETIME2 DEFAULT GETDATE(),
    status VARCHAR(20) DEFAULT 'ACTIVE'
);


IF OBJECT_ID('users', 'U') IS NOT NULL DROP TABLE users;
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name NVARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(20) DEFAULT 'ADMIN',
    created_date DATETIME2 DEFAULT GETDATE(),
    status VARCHAR(20) DEFAULT 'ACTIVE'
);


IF OBJECT_ID('classes', 'U') IS NOT NULL DROP TABLE classes;
CREATE TABLE classes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    class_name NVARCHAR(50) NOT NULL,
    description NVARCHAR(500),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    max_students INT DEFAULT 20,
    current_students INT DEFAULT 0,
    price_monthly DECIMAL(10,2) NOT NULL,
    instructor NVARCHAR(100),
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

-- Thêm dữ liệu mẫu cho bảng users
INSERT INTO users (username, password, full_name, email) VALUES 
('admin', '123456', N'Quản trị viên', 'admin@yogagym.com'),
('manager', '123456', N'Trưởng phòng', 'manager@yogagym.com');

-- Thêm dữ liệu mẫu cho bảng classes
INSERT INTO classes (class_name, description, start_time, end_time, max_students, price_monthly, instructor) VALUES 
(N'Yoga Sáng', N'Bắt đầu ngày mới với năng lượng tích cực', '06:00:00', '07:00:00', 20, 500000, N'Cô Lan'),
(N'Yoga Tối', N'Thư giãn sau ngày làm việc căng thẳng', '18:00:00', '19:00:00', 20, 500000, N'Cô Mai'),
(N'Gym', N'Tập luyện sức mạnh và thể lực', '07:00:00', '21:00:00', 999, 400000, N'Thầy Nam'),
(N'Yoga Cơ bản', N'Dành cho người mới bắt đầu', '09:00:00', '10:00:00', 15, 450000, N'Cô Hoa'),
(N'Yoga Nâng cao', N'Dành cho học viên có kinh nghiệm', '19:00:00', '20:30:00', 12, 600000, N'Thầy Minh'),
(N'Yoga Flow', N'Kết hợp nhiều tư thế trong dòng chảy liền mạch', '17:00:00', '18:00:00', 18, 550000, N'Cô Thu');

-- Thêm dữ liệu mẫu cho bảng registrations
INSERT INTO registrations (full_name, email, phone, class_name, package_type, note) VALUES 
(N'Nguyễn Văn An', 'an@email.com', '0901234567', N'Yoga Sáng', N'1 tháng', N'Mới bắt đầu tập yoga'),
(N'Trần Thị Bình', 'binh@email.com', '0912345678', N'Yoga Tối', N'3 tháng', N'Muốn giảm stress'),
(N'Lê Văn Cường', 'cuong@email.com', '0923456789', N'Gym', N'6 tháng', N'Tăng cơ bắp'),
(N'Phạm Thị Dung', 'dung@email.com', '0934567890', N'Yoga Cơ bản', N'1 tháng', N'Người mới'),
(N'Hoàng Văn Em', 'em@email.com', '0945678901', N'Yoga Nâng cao', N'12 tháng', N'Đã có kinh nghiệm');


IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_registrations_email') DROP INDEX IX_registrations_email ON registrations;
CREATE INDEX IX_registrations_email ON registrations(email);
IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_registrations_class_name') DROP INDEX IX_registrations_class_name ON registrations;
CREATE INDEX IX_registrations_class_name ON registrations(class_name);
IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_registrations_registration_date') DROP INDEX IX_registrations_registration_date ON registrations;
CREATE INDEX IX_registrations_registration_date ON registrations(registration_date);

IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_users_username') DROP INDEX IX_users_username ON users;
CREATE INDEX IX_users_username ON users(username);

GO


IF OBJECT_ID('vw_registration_stats', 'V') IS NOT NULL DROP VIEW vw_registration_stats;
GO
CREATE VIEW vw_registration_stats AS
SELECT 
    class_name,
    COUNT(*) as total_registrations,
    COUNT(CASE WHEN status = 'ACTIVE' THEN 1 END) as active_registrations
FROM registrations 
GROUP BY class_name;
GO


