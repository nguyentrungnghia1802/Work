package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String path = getServletContext().getRealPath("/WEB-INF/users.txt");
        boolean valid = false;
        String hashedInput = Integer.toHexString(password.hashCode());
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while((line = br.readLine()) != null) {
                String[] arr = line.split(",");
                if(arr.length >= 2 && arr[0].equals(username) && arr[1].equals(hashedInput)) {
                    valid = true; break;
                }
            }
        }
        if(valid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
        } else {
            request.setAttribute("errorMsg", "Invalid username or password!");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
