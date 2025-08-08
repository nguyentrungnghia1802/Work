<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Yoga/Gym Center</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/dashboard.css">
    <script src="../assets/js/dashboard.js"></script>
</head>
<body>
    <div class="dashboard-container">
        <div class="dashboard-header">
            <h1 style="color: #667eea; margin: 0;">⚙️ Dashboard Admin</h1>
            <div>
                <a href="dashboard.jsp" class="btn" style="margin-right: 10px;">📊 Dashboard</a>
                <a href="login.jsp" class="btn btn-danger">🚪 Đăng xuất</a>
            </div>
        </div>

        <!-- Thống kê tổng quan -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number">156</div>
                <h3>👥 Tổng học viên</h3>
                <p>Đăng ký tất cả lớp</p>
            </div>
            <div class="stat-card">
                <div class="stat-number">6</div>
                <h3>🏃‍♀️ Lớp học</h3>
                <p>Đang hoạt động</p>
            </div>
            <div class="stat-card">
                <div class="stat-number">23</div>
                <h3>📅 Hôm nay</h3>
                <p>Đăng ký mới</p>
            </div>
            <div class="stat-card">
                <div class="stat-number">89%</div>
                <h3>📈 Lấp đầy</h3>
                <p>Tỷ lệ trung bình</p>
            </div>
        </div>

        <div class="card">
            <h2 style="color: #667eea; margin-bottom: 30px;">📋 Danh sách đơn đăng ký lớp học</h2>
            
            <div class="search-container">
                <input type="text" id="searchInput" placeholder="🔍 Tìm kiếm học viên..." style="width: 100%; padding: 12px 15px; border: 2px solid #e1e1e1; border-radius: 25px;">
            </div>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>👤 Họ tên</th>
                            <th>📧 Email</th>
                            <th>📱 SĐT</th>
                            <th>🏃‍♀️ Lớp</th>
                            <th>💳 Gói tập</th>
                            <th>📅 Ngày đăng ký</th>
                            <th>⚙️ Thao tác</th>
                        </tr>
                    </thead>
                    <tbody id="registrationTable">
                        <tr>
                            <td>1</td>
                            <td>Nguyễn Văn An</td>
                            <td>an.nguyen@email.com</td>
                            <td>0901234567</td>
                            <td>Yoga Sáng</td>
                            <td>3 tháng</td>
                            <td>15/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(1)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Trần Thị Bình</td>
                            <td>binh.tran@email.com</td>
                            <td>0912345678</td>
                            <td>Yoga Tối</td>
                            <td>1 tháng</td>
                            <td>16/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(2)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Lê Văn Cường</td>
                            <td>cuong.le@email.com</td>
                            <td>0923456789</td>
                            <td>Gym</td>
                            <td>12 tháng</td>
                            <td>17/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(3)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Phạm Thị Dung</td>
                            <td>dung.pham@email.com</td>
                            <td>0934567890</td>
                            <td>Yoga Cơ bản</td>
                            <td>6 tháng</td>
                            <td>18/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(4)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Hoàng Văn Em</td>
                            <td>em.hoang@email.com</td>
                            <td>0945678901</td>
                            <td>Yoga Nâng cao</td>
                            <td>3 tháng</td>
                            <td>19/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(5)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Vũ Thị Phượng</td>
                            <td>phuong.vu@email.com</td>
                            <td>0956789012</td>
                            <td>Yoga Flow</td>
                            <td>1 tháng</td>
                            <td>20/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(6)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Đặng Văn Giang</td>
                            <td>giang.dang@email.com</td>
                            <td>0967890123</td>
                            <td>Yoga Sáng</td>
                            <td>6 tháng</td>
                            <td>21/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(7)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>Bùi Thị Hạnh</td>
                            <td>hanh.bui@email.com</td>
                            <td>0978901234</td>
                            <td>Gym</td>
                            <td>3 tháng</td>
                            <td>22/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(8)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>Ngô Văn Ích</td>
                            <td>ich.ngo@email.com</td>
                            <td>0989012345</td>
                            <td>Yoga Tối</td>
                            <td>12 tháng</td>
                            <td>23/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(9)">🗑️ Xóa</button></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>Tôn Thị Kim</td>
                            <td>kim.ton@email.com</td>
                            <td>0990123456</td>
                            <td>Yoga Cơ bản</td>
                            <td>1 tháng</td>
                            <td>24/01/2025</td>
                            <td><button class="btn btn-danger" onclick="deleteRegistration(10)">🗑️ Xóa</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
            </div>
        </div>
    </div>
</body>
</html>
