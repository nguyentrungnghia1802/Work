### Yoga/Gym Center – Tài liệu dự án (UI + Web)

Website giao diện cho trung tâm Yoga/Gym, xây dựng bằng JSP/Servlet, HTML/CSS và JavaScript thuần, tập trung vào trải nghiệm người dùng, hiệu ứng mượt và cấu trúc thành phần tái sử dụng.

### Demo nhanh
- Trang chủ: `http://localhost:8080/Yoga_Website/`
- Đăng ký lớp: `http://localhost:8080/Yoga_Website/pages/register.jsp`
- Lớp học: `http://localhost:8080/Yoga_Website/pages/classes.jsp`
- Danh sách lớp: `http://localhost:8080/Yoga_Website/pages/members.jsp`
- Liên hệ: `http://localhost:8080/Yoga_Website/pages/contact.jsp`
- Nhóm phát triển: `http://localhost:8080/Yoga_Website/pages/team.jsp`
- Admin (đăng nhập): `http://localhost:8080/Yoga_Website/admin/login.jsp`
- Admin (dashboard): `http://localhost:8080/Yoga_Website/admin/dashboard.jsp`

### Công nghệ sử dụng
- **JSP/JSTL**: Xây dựng giao diện động, include thành phần (`header.jspf`, `footer.jspf`, `nav.jspf`, `alert.jspf`, `pagination.jspf`, ...)
- **Jakarta Servlet (Jakarta EE 10, web.xml 6.0)**: Định tuyến các servlet (đã khai báo trong `WEB-INF/web.xml`)
- **HTML5/CSS3**: Giao diện hiện đại, responsive, hiệu ứng gradient, shadow, animation
- **JavaScript thuần**: Tương tác UI (smooth scroll, active nav, tìm kiếm realtime, hiệu ứng xuất hiện, toggle danh sách, back-to-top)
- **Máy chủ ứng dụng**: Khuyến nghị Apache Tomcat 10.1+ (Jakarta EE 10)

Lưu ý: Dự án không import Bootstrap trong code hiện tại; toàn bộ UI dùng CSS thuần.

### Cấu trúc thư mục
```
web/
├─ index.jsp                  # Trang chủ
├─ components/                # Thành phần JSP tái sử dụng (.jspf)
│  ├─ header.jspf, footer.jspf, nav.jspf, nav_new.jspf
│  ├─ alert.jspf, pagination.jspf
│  ├─ button.jspf, submitButton.jspf, deleteButton.jspf
│  └─ zoomModal.jspf
├─ pages/                     # Các trang giao diện chính
│  ├─ register.jsp, classes.jsp, members.jsp, contact.jsp, team.jsp
├─ admin/                     # Khu vực quản trị (UI demo)
│  ├─ login.jsp, dashboard.jsp
├─ assets/
│  ├─ css/                    # style.css (global) + css theo trang
│  │  ├─ style.css, team.css, classes.css, contact.css, login.css, dashboard.css
│  └─ js/                     # main.js (global) + js theo trang
│     ├─ main.js, team.js, members.js, contact.js, search.js, register.js
│     └─ admin.js, dashboard.js
├─ WEB-INF/
│  ├─ web.xml                 # Cấu hình web-app (servlet-mapping)
│  ├─ users.txt, registrations.txt (demo storage)
└─ META-INF/
   └─ context.xml            # Context path: /Yoga_Website
```

### Giao diện & chức năng từng trang
- **Trang chủ (`index.jsp`)**
  - Thanh điều hướng, hero section, khối tính năng (features), CTA “Đăng ký ngay”.
  - Hiệu ứng xuất hiện mượt, xác định link nav đang active, nút back-to-top.

- **Đăng ký lớp (`pages/register.jsp`)**
  - Form thông tin (Họ tên, Email, SĐT, Lớp học, Gói tập, Ghi chú), validate phía client.
  - Thông báo thành công dạng alert (JS), reset form sau submit. Link nhanh đến “Xem lớp học”.
  - JS: `assets/js/register.js` (handleSubmit, validate email/phone).

- **Lớp học (`pages/classes.jsp`)**
  - Lưới thẻ lớp học (tên lớp, mô tả, thời gian, giá, số lượng học viên), nút “Đăng ký ngay”.
  - Bộ lọc tìm kiếm realtime theo tiêu đề/mô tả/thời gian.
  - Bảng giá gói tập tổng hợp theo loại lớp.
  - JS: `assets/js/search.js` (lọc realtime + thông báo “không có kết quả”).

- **Danh sách lớp (`pages/members.jsp`)**
  - Danh sách lớp dạng accordion/toggle; mỗi lớp hiển thị lịch học, giảng viên, phòng, stats, và danh sách học viên mẫu.
  - Nút “👥 Xem danh sách học viên” để mở/đóng; tự động đóng danh sách lớp khác khi mở lớp mới.
  - JS: `assets/js/members.js` (toggleMembers, hiệu ứng xuất hiện tuần tự).

- **Liên hệ (`pages/contact.jsp`)**
  - Cột thông tin liên hệ (địa chỉ, hotline, email, website), bảng giờ làm việc.
  - Form gửi tin nhắn với validate client, khu vực “bản đồ” placeholder và liên kết mạng xã hội.
  - JS: `assets/js/contact.js` (handleContactSubmit, hiệu ứng slide-in cho contact items).

- **Nhóm phát triển (`pages/team.jsp`)**
  - Thẻ thành viên (avatar icon, tên, vai trò, thông tin, liên kết xã hội), intro về dự án.
  - JS: `assets/js/team.js` (hiệu ứng click avatar + IntersectionObserver cho card).

- **Admin – Đăng nhập (`admin/login.jsp`)**
  - UI form đăng nhập. Có hiển thị thông báo lỗi nếu có (`request.getAttribute("errorMsg")`).
  - Demo credential: `admin / 123456` (hiển thị trong giao diện).

- **Admin – Dashboard (`admin/dashboard.jsp`)**
  - Thống kê tổng quan (tổng học viên, số lớp, đăng ký hôm nay, tỉ lệ lấp đầy).
  - Bảng danh sách đơn đăng ký (mẫu) + tìm kiếm nội bảng, xóa dòng (demo, client-side).
  - JS: `assets/js/dashboard.js` (searchTable, deleteRegistration nội bộ).

### Thành phần tái sử dụng (components)
- **`header.jspf`**: Include `nav.jspf` cho menu chuẩn trên các trang.
- **`footer.jspf`**: Footer chung, thông tin trung tâm.
- **`nav.jspf`/`nav_new.jspf`**: Thanh điều hướng (các link nội bộ, link Admin ở mép phải).
- **`alert.jspf`**: Render thông báo `errorMsg`/`successMsg` từ request scope.
- **`pagination.jspf`**: Phân trang động (dựa trên `pageCount`/`currentPage`).
- **`button.jspf`, `submitButton.jspf`, `deleteButton.jspf`**: Nút chuẩn/submit/xóa (JS hook `deleteRegistration`).
- **`zoomModal.jspf`**: Modal phóng to ảnh, dùng chung.

### Tài nguyên CSS/JS chính
- CSS global: `assets/css/style.css`
  - Reset, layout, container, nav, buttons, cards, table, alert, pagination, hero, features, responsive.
- CSS theo trang: `team.css`, `classes.css`, `contact.css`, `login.css`, `dashboard.css`.
- JS global: `assets/js/main.js`
  - Smooth scroll, đánh dấu nav active, IntersectionObserver cho cards, thông báo nhanh, loading overlay, back-to-top.
- JS theo trang: `register.js`, `search.js`, `members.js`, `contact.js`, `team.js`, `dashboard.js`, `admin.js` (gọi `DeleteRegistrationServlet` dạng fetch – demo).

### Cấu hình ứng dụng
- `WEB-INF/web.xml` (Jakarta EE 6.0 schema):
  - Khai báo servlet và mapping: `RegisterServlet`, `LoginServlet`, `LogoutServlet`, `DeleteRegistrationServlet`, `AdminListServlet`.
  - `welcome-file`: `index.jsp`.
- `META-INF/context.xml`: `path="/Yoga_Website"` (context path khi deploy).
- Demo storage (placeholder): `WEB-INF/users.txt`, `WEB-INF/registrations.txt`.

### Cách chạy dự án
1) Cài đặt yêu cầu
   - JDK 17+ (khuyến nghị)
   - Apache Tomcat 10.1+ hoặc máy chủ tương thích Jakarta EE 10

2) Deploy
   - Cách A (IDE): Import dự án dạng Dynamic Web Project, đặt `web/` làm WebContent, đảm bảo `web.xml` được IDE nhận diện; chạy trên Tomcat 10.1+.
   - Cách B (Thủ công): Đóng gói `web/` thành WAR có context `Yoga_Website` hoặc copy nội dung `web/` vào `TOMCAT/webapps/Yoga_Website/` rồi khởi động Tomcat.

3) Truy cập
   - Mặc định: `http://localhost:8080/Yoga_Website/`
   - Khu vực Admin: `http://localhost:8080/Yoga_Website/admin/login.jsp` (demo: `admin/123456`).
   (Theo như hướng dẫn của giao viên thì đổi port sang 9999)

### Ghi chú & giới hạn hiện tại
- Nhiều dữ liệu đang là demo/hard-code trong JSP/JS để minh họa UI.
- Form đăng ký/đăng nhập hiện xử lý ở phía client (alert), chưa kết nối thực tế đến `RegisterServlet`, `LoginServlet`, ...
- `admin.js` có ví dụ gọi `DeleteRegistrationServlet` bằng fetch, nhưng `dashboard.jsp` mặc định xóa ở client-side.
- Không sử dụng DB thực tế trong thư mục `web/` này; nếu backend/DAO nằm ngoài, cần build và deploy kèm theo.

### Hướng phát triển (gợi ý)
- Kết nối form (đăng ký/đăng nhập/xóa) với các Servlet đã khai báo; thêm validate server-side và thông báo bằng `alert.jspf`.
- Tách layout: chuẩn hóa header/nav/footer thành layout chung, áp dụng mọi trang.
- Tích hợp cơ sở dữ liệu (MySQL/PostgreSQL), ORM (JPA/Hibernate) hoặc JDBC.
- Thêm phân trang thực, tìm kiếm server-side cho dashboard, xác thực phiên (session) và phân quyền.
- Bổ sung test (UI e2e + unit test cho controllers/service), CI/CD.

---
Tác giả: NGUYEN TRUNG NGHIA. Nếu cần hỗ trợ tích hợp backend/DB hoặc triển khai, vui lòng liên hệ qua sđt 0353295709.



