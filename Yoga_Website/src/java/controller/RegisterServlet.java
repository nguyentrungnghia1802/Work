package controller;

import dao.RegistrationDAO;
import model.Registration;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {
    private RegistrationDAO registrationDAO;
    
    @Override
    public void init() throws ServletException {
        registrationDAO = new RegistrationDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        try {
            // Lấy thông tin từ form
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String className = request.getParameter("className");
            String packageType = request.getParameter("package");
            String note = request.getParameter("note");
            
            // Validate dữ liệu
            if (fullname == null || fullname.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty() ||
                className == null || className.trim().isEmpty() ||
                packageType == null || packageType.trim().isEmpty()) {
                
                request.setAttribute("errorMsg", "Vui lòng điền đầy đủ thông tin bắt buộc!");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
                return;
            }
            
            // Validate email format
            if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
                request.setAttribute("errorMsg", "Email không đúng định dạng!");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
                return;
            }
            
            // Validate phone format
            if (!phone.matches("^[0-9]{9,11}$")) {
                request.setAttribute("errorMsg", "Số điện thoại phải từ 9-11 chữ số!");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
                return;
            }
            
            // Tạo đối tượng Registration
            Registration registration = new Registration(fullname, email, phone, className, packageType, note);
            
            // Lưu vào database
            boolean success = registrationDAO.addRegistration(registration);
            
            if (success) {
                request.setAttribute("successMsg", "Đăng ký thành công! Chúng tôi sẽ liên hệ với bạn sớm nhất.");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Có lỗi xảy ra khi đăng ký. Vui lòng thử lại!");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
        }
    }
}
