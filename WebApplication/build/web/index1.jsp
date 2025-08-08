<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Nhập và Lưu file</title>
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
        }
        h2 {
            color: #ffd700;
        }
        textarea {
            width: 100%;
            height: 160px;
            font-size: 1.1em;
            margin-bottom: 18px;
            border-radius: 5px;
            border: 1px solid #888;
            padding: 10px;
        }
        .btn {
            background: #ffd700;
            color: #222;
            border: none;
            border-radius: 5px;
            padding: 12px 28px;
            font-size: 1.1em;
            margin-right: 16px;
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
        <h2>Nhập nội dung vào file</h2>
        <form action="controller/SaveTextServlet" method="post" accept-charset="UTF-8">
            <textarea name="noidung" placeholder="Nhập nội dung ở đây..." required></textarea><br>
            <button type="submit" class="btn">Ghi vào file</button>
            <button type="button" class="btn" onclick="location.href='index.html'">Trở lại</button>
        </form>
    </div>
</body>
</html>