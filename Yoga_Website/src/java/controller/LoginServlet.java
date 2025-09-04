package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        // Xác thực mạnh hơn: kiểm tra file users.txt
        String path = getServletContext().getRealPath("/WEB-INF/users.txt");
        boolean valid = false;
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while((line = br.readLine()) != null) {
                String[] arr = line.split(",");
                if(arr.length >= 2 && arr[0].equals(username) && arr[1].equals(password)) {
                    valid = true; break;
                }
            }
        }
        if(valid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);
            // Redirect context-relative to avoid path issues
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
        } else {
            request.setAttribute("errorMsg", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
