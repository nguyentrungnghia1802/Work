<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../admin.js"></script>
</head>
<body>
<header>
    <h1>Dashboard Admin</h1>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="../LogoutServlet">Logout</a>
    </nav>
</header>
<main>
    <h2>Danh sách đăng ký lớp học</h2>
    <form method="get" action="dashboard.jsp">
        <input type="text" name="search" placeholder="Tìm kiếm học viên..." value="${param.search}">
        <button type="submit">Tìm kiếm</button>
    </form>
    <table border="1">
        <thead>
            <tr><th>STT</th><th>Họ tên</th><th>Email</th><th>SĐT</th><th>Lớp</th><th>Gói tập</th><th>Xóa</th></tr>
        </thead>
        <tbody>
        <%-- Hiển thị danh sách đăng ký từ DB --%>
        <c:forEach var="reg" items="${registrations}" varStatus="status">
            <tr>
                <td>${(currentPage-1)*10 + status.index + 1}</td>
                <td>${reg.fullName}</td>
                <td>${reg.email}</td>
                <td>${reg.phone}</td>
                <td>${reg.className}</td>
                <td>${reg.packageType}</td>
                <td><button onclick="deleteRegistration('${reg.id}')">Xóa</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <%-- Phân trang với JSTL --%>
        <c:forEach var="i" begin="1" end="${pageCount}">
            <a href="dashboard.jsp?page=${i}&search=${param.search}" ${i==currentPage ? 'class="active"' : ''}>${i}</a>
        </c:forEach>
    </div>
</main>
<footer>
    <p>&copy; 2025 Yoga/Gym Center</p>
</footer>
</body>
</html>
