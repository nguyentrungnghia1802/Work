<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thành viên nhóm</title>
    <link rel="stylesheet" href="style.css">
    <script src="members.js"></script>
</head>
<body>
<header>
    <h1>Thành viên nhóm</h1>
    <nav>
        <a href="index.jsp">Trang chủ</a>
        <a href="register.jsp">Đăng ký lớp học</a>
        <a href="classes.jsp">Danh sách lớp học</a>
        <a href="members.jsp">Thành viên nhóm</a>
        <a href="contact.jsp">Liên hệ</a>
    </nav>
</header>
<main>
    <div class="member-list">
        <!-- Thêm thông tin thành viên nhóm tại đây -->
        <div class="member">
            <img src="member1.jpg" alt="Ảnh thành viên 1" onclick="zoomImage(this)">
            <p>Họ tên: Nguyễn Văn A<br>Ngày sinh: 01/01/2000<br>MSSV: 123456<br>Lớp: CNTT1<br>SĐT: 0901234567<br>Email: a@gmail.com<br>Đơn vị: <a href="https://example.com" target="_blank">Example</a></p>
        </div>
        <!-- Thêm các thành viên khác tương tự -->
    </div>
    <div id="zoomModal" class="modal" onclick="closeZoom()">
        <img id="zoomImg" src="" alt="Zoom">
    </div>
</main>
<footer>
    <p>&copy; 2025 Yoga/Gym Center</p>
</footer>
</body>
</html>
