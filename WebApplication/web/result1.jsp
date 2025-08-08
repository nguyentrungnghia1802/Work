<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String fileName = (String) request.getAttribute("fileName");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả lưu file</title>
    <style>
        body {
            background: #222;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 500px;
            margin: 60px auto;
            background: #333;
            border-radius: 8px;
            padding: 32px;
            box-shadow: 0 2px 8px #0008;
            text-align: center;
        }
        h2 {
            color: #ffd700;
        }
        .btn {
            background: #ffd700;
            color: #222;
            border: none;
            border-radius: 5px;
            padding: 12px 28px;
            font-size: 1.1em;
            margin: 0 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.2s;
        }
        .btn:hover {
            background: #fff200;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Đã lưu file thành công!</h2>
        <% if (fileName != null) { %>
            <a class="btn" href="<%= request.getContextPath() %>/controller/SaveTextServlet?file=<%= fileName %>">Tải về file txt</a>
        <% } %>
        <button class="btn" onclick="location.href = '../index.html'">Trở lại</button>
    </div>
</body>
</html>