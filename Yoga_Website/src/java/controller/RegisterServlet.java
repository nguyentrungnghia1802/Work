package java.controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String className = request.getParameter("className");
        String pack = request.getParameter("package");
        String line = fullname + "," + email + "," + phone + "," + className + "," + pack;
        String path = getServletContext().getRealPath("/WEB-INF/registrations.txt");
        synchronized(this) {
            try (PrintWriter out = new PrintWriter(new FileWriter(path, true))) {
                out.println(line);
            }
        }
        response.sendRedirect("register.jsp?success=1");
    }
}
