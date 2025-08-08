<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
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
        </style>
    </head>

    <body>
        <div class="container">
            <h2>Đọc file text và hiển thị nội dung</h2>
            <form id="uploadForm" action="controller/UploadServlet" method="post" enctype="multipart/form-data"
                  style="margin-bottom: 24px;">
                Chọn file text: <input type="file" name="file" accept=".txt" required>
                <button type="button" onclick="readFile()">Đọc nội dung file</button>
            </form>
        </div>

        <script>
            function readFile() {
                document.getElementById('uploadForm').submit();
            }
        </script>
    </body>

</html>