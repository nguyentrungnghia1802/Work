<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../style.css">
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
        <%-- Dữ liệu sẽ được load từ file qua Servlet hoặc scriptlet --%>
        <jsp:include page="../AdminListServlet" />
        </tbody>
    </table>
    <div class="pagination">
        <%-- Phân trang sẽ được xử lý ở Servlet và truyền biến pageCount, currentPage --%>
        <% for(int i=1;i<=request.getAttribute("pageCount")==null?1:(Integer)request.getAttribute("pageCount");i++){ %>
            <a href="dashboard.jsp?page=<%=i%>&search=<%=request.getParameter("search")!=null?request.getParameter("search"):""%>" <%=i==((request.getAttribute("currentPage")==null)?1:(Integer)request.getAttribute("currentPage"))?"class='active'":""%>><%=i%></a>
        <% } %>
    </div>
</main>
<footer>
    <p>&copy; 2025 Yoga/Gym Center</p>
</footer>
</body>
</html>
