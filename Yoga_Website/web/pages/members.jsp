<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thành viên nhóm</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../assets/js/members.js"></script>
</head>
<body>
<%@ include file="../components/header.jspf" %>
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
<%@ include file="../components/footer.jspf" %>
</body>
</html>
