<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
<header>
    <h1>Đăng nhập Admin</h1>
</header>
<main>
    <form action="../LoginServlet" method="post">
        <label>Tên đăng nhập:<input type="text" name="username" required></label><br>
        <label>Mật khẩu:<input type="password" name="password" required></label><br>
        <button type="submit">Đăng nhập</button>
    </form>
    <div style="color:red;">${errorMsg}</div>
</main>
<footer>
    <p>&copy; 2025 Yoga/Gym Center</p>
</footer>
</body>
</html>
