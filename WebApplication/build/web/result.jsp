<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String fileContent = (String) request.getAttribute("fileContent");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Nội dung file đã upload</title>
    <style>
        body {
            background: #222;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
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
        pre {
            background: #222;
            color: #fff;
            text-align: left;
            padding: 16px;
            border-radius: 6px;
            font-size: 1.1em;
            overflow-x: auto;
            margin-bottom: 24px;
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
        <h2>Nội dung file vừa upload</h2>
        <pre><%= fileContent != null ? fileContent : "Không có nội dung!" %></pre>
<button class="btn" onclick="location.href='../index.html'">Trở lại</button>    </div>
</body>
</html>