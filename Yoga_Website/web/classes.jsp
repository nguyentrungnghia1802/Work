<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách lớp học</title>
    <link rel="stylesheet" href="style.css">
    <script src="search.js"></script>
</head>
<body>
<header>
    <h1>Danh sách lớp học</h1>
    <nav>
        <a href="index.jsp">Trang chủ</a>
        <a href="register.jsp">Đăng ký lớp học</a>
        <a href="classes.jsp">Danh sách lớp học</a>
        <a href="members.jsp">Thành viên nhóm</a>
        <a href="contact.jsp">Liên hệ</a>
    </nav>
</header>
<main>
    <input type="text" id="searchClass" placeholder="Tìm kiếm lớp học..." onkeyup="searchClassFunc()">
    <table id="classTable" border="1">
        <thead>
            <tr><th>Tên lớp</th><th>Lịch học</th><th>Giá gói tập</th></tr>
        </thead>
        <tbody>
            <tr><td>Yoga Sáng</td><td>6:00 - 7:00</td><td>500.000đ/tháng</td></tr>
            <tr><td>Yoga Tối</td><td>18:00 - 19:00</td><td>500.000đ/tháng</td></tr>
            <tr><td>Gym</td><td>7:00 - 21:00</td><td>400.000đ/tháng</td></tr>
        </tbody>
    </table>
</main>
<footer>
    <p>&copy; 2025 Yoga/Gym Center</p>
</footer>
</body>
</html>
