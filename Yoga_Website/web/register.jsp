<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký lớp học Yoga/Gym</title>
    <link rel="stylesheet" href="style.css">
    <script src="register.js"></script>
</head>
<body>
<header>
    <h1>Đăng ký lớp học</h1>
    <nav>
        <a href="index.jsp">Trang chủ</a>
        <a href="register.jsp">Đăng ký lớp học</a>
        <a href="classes.jsp">Danh sách lớp học</a>
        <a href="members.jsp">Thành viên nhóm</a>
        <a href="contact.jsp">Liên hệ</a>
    </nav>
</header>
<main>
    <form id="registerForm" action="RegisterServlet" method="post" onsubmit="return validateForm()">
        <label>Họ tên:<input type="text" name="fullname" required></label><br>
        <label>Email:<input type="email" name="email" required></label><br>
        <label>Số điện thoại:<input type="text" name="phone" required></label><br>
        <label>Chọn lớp:
            <select name="className" required>
                <option value="Yoga Sáng">Yoga Sáng</option>
                <option value="Yoga Tối">Yoga Tối</option>
                <option value="Gym">Gym</option>
            </select>
        </label><br>
        <label>Gói tập:
            <select name="package" required>
                <option value="1 tháng">1 tháng</option>
                <option value="3 tháng">3 tháng</option>
                <option value="6 tháng">6 tháng</option>
            </select>
        </label><br>
        <button type="submit">Đăng ký</button>
    </form>
    <div id="registerMsg"></div>
</main>
<footer>
    <p>&copy; 2025 Yoga/Gym Center</p>
</footer>
</body>
</html>
