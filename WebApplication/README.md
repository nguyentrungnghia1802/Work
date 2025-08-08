# WebApplication - Bài tập Java Web

## Tổng quan dự án

Là một ứng dụng web Java sử dụng **Servlet** và **JSP** để xử lý upload file, đọc nội dung file, lưu text và tải file về. Dự án được phát triển trên **NetBeans IDE** và chạy trên **Apache Tomcat**.

## Cấu trúc dự án

```
WebApplication/
├── src/
│   └── java/
│       └── controller/
│           ├── SaveTextServlet.java    # Servlet xử lý lưu text và tải file
│           └── UploadServlet.java      # Servlet xử lý upload và đọc file
├── web/
│   ├── index.html                      # Trang chủ với 2 nút chuyển hướng
│   ├── index.jsp                       # Trang upload và đọc file
│   ├── index1.jsp                      # Trang nhập text và lưu file
│   ├── result.jsp                      # Hiển thị nội dung file đã upload
│   └── result1.jsp                     # Hiển thị kết quả lưu file và nút tải về
├── lib/
│   ├── jakarta.servlet-api-6.1.0.jar   # Jakarta Servlet API
│   └── servlet-api.jar                 # Servlet API
└── build.xml                           # File build Ant
```

## Chức năng chính

### 1. Trang chủ (index.html)
- **Mục đích**: Điểm khởi đầu của ứng dụng
- **Chức năng**: 
  - Hiển thị 2 nút chuyển hướng
  - "Trang Đọc File" → chuyển đến `index.jsp`
  - "Trang Ghi và Tải file" → chuyển đến `index1.jsp`

### 2. Trang đọc file (index.jsp)
- **Mục đích**: Upload file và đọc nội dung
- **Chức năng**:
  - Form upload file với `enctype="multipart/form-data"`
  - Gửi file đến `UploadServlet` để xử lý
  - Hiển thị nút quay lại trang chủ

### 3. Trang nhập text (index1.jsp)
- **Mục đích**: Nhập text và lưu thành file
- **Chức năng**:
  - Textarea để nhập nội dung text
  - Form gửi đến `SaveTextServlet` để lưu file
  - Nút quay lại trang chủ

### 4. UploadServlet.java
- **URL Pattern**: `/controller/UploadServlet`
- **Chức năng**:
  - Nhận file upload từ client
  - Đọc nội dung file với encoding UTF-8
  - Chuyển tiếp nội dung đến `result.jsp` để hiển thị

```java
@WebServlet("/controller/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // Đọc file upload và hiển thị nội dung
    }
}
```

### 5. SaveTextServlet.java
- **URL Pattern**: `/controller/SaveTextServlet`
- **Chức năng kép**:
  - **POST**: Lưu text thành file .txt
  - **GET**: Tải file về máy client

```java
@WebServlet("/controller/SaveTextServlet")
public class SaveTextServlet extends HttpServlet {
    @Override
    protected void doPost() {
        // Lưu text thành file
    }
    
    @Override
    protected void doGet() {
        // Tải file về
    }
}
```

### 6. Trang kết quả đọc file (result.jsp)
- **Mục đích**: Hiển thị nội dung file vừa upload
- **Chức năng**:
  - Hiển thị nội dung file trong thẻ `<pre>` để giữ định dạng
  - Nút quay lại trang chủ

### 7. Trang kết quả lưu file (result1.jsp)
- **Mục đích**: Xác nhận lưu file thành công
- **Chức năng**:
  - Thông báo lưu file thành công
  - Nút "Tải về file txt" gọi đến `SaveTextServlet` (GET)
  - Nút quay lại trang nhập text

## Công nghệ sử dụng

- **Backend**: Java Servlet, JSP
- **Frontend**: HTML5, CSS3, JavaScript
- **IDE**: NetBeans IDE
- **Server**: Apache Tomcat 11.0.9
- **Port**: 9999
- **Encoding**: UTF-8

## Cài đặt và chạy

### Yêu cầu hệ thống
- Java JDK 8+
- NetBeans IDE
- Apache Tomcat 11+

### Hướng dẫn chạy
1. Mở NetBeans IDE
2. Import project vào workspace
3. Cấu hình Tomcat server (port 9999)
4. Build và deploy project
5. Truy cập: `http://localhost:9999/WebApplication/`

## Luồng hoạt động

### Luồng 1: Đọc file
```
index.html → index.jsp → UploadServlet → result.jsp
```

### Luồng 2: Lưu và tải file
```
index.html → index1.jsp → SaveTextServlet (POST) → result1.jsp → SaveTextServlet (GET)
```

## Đặc điểm kỹ thuật

### Xử lý file upload
- Sử dụng `@MultipartConfig` annotation
- Đọc file với `BufferedReader` và encoding UTF-8
- Hiển thị nội dung file trong `<pre>` tag

### Xử lý lưu file
- Tạo tên file unique theo timestamp
- Lưu file vào thư mục webapp root
- Sử dụng `BufferedWriter` với UTF-8 encoding

### Xử lý tải file
- Set `Content-Type` và `Content-Disposition` headers
- Stream file về client với buffer 4096 bytes
- Xử lý lỗi file không tồn tại

## Giao diện người dùng

- **Theme**: Dark theme với màu nền #222
- **Màu chủ đạo**: Vàng (#ffd700) cho buttons
- **Font**: Arial, sans-serif
- **Responsive**: Tối ưu cho desktop
- **Hiệu ứng**: Hover effects cho buttons

## Xử lý lỗi

- Kiểm tra file tồn tại trước khi tải
- Xử lý encoding UTF-8 đúng cách
- Validation input form
- Error handling cho IO operations

## Bảo mật

- Sử dụng `@MultipartConfig` để giới hạn upload
- Kiểm tra file type (nếu cần)
- Sanitize file names
- Proper error handling

## Screenshots

### Trang chủ
- Hiển thị 2 nút chuyển hướng rõ ràng
- Giao diện dark theme chuyên nghiệp

### Trang upload file
- Form upload file đơn giản, dễ sử dụng
- Validation file input

### Trang nhập text
- Textarea rộng rãi cho việc nhập nội dung
- Button submit và quay lại

### Trang kết quả
- Hiển thị nội dung file rõ ràng
- Nút tải về và quay lại

