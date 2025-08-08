<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Admin - Yoga/Gym Center</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <style>
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .login-card {
            max-width: 400px;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.2);
            text-align: center;
        }
        .login-title {
            color: #667eea;
            font-size: 2rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h1 class="login-title">⚙️ Admin Login</h1>
            
            <% if(request.getAttribute("errorMsg") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("errorMsg") %>
                </div>
            <% } %>
            
            <form action="../LoginServlet" method="post">
                <div class="form-group">
                    <label for="username">👤 Tên đăng nhập</label>
                    <input type="text" id="username" name="username" required 
                           placeholder="Nhập tên đăng nhập">
                </div>
                
                <div class="form-group">
                    <label for="password">🔒 Mật khẩu</label>
                    <input type="password" id="password" name="password" required 
                           placeholder="Nhập mật khẩu">
                </div>
                
                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 20px;">
                    🚀 Đăng nhập
                </button>
            </form>
            
            <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #e1e1e1;">
                <p style="color: #666; font-size: 14px;">
                    💡 <strong>Demo:</strong> admin / 123456
                </p>
                <a href="../index.jsp" style="color: #667eea; text-decoration: none;">
                    ← Quay về trang chủ
                </a>
            </div>
        </div>
    </div>
</body>
</html>
