package controller;

import dao.RegistrationDAO;
import model.Registration;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class AdminListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            dao.RegistrationDAO regDao = new dao.RegistrationDAO();
            dao.ClassDAO classDao = new dao.ClassDAO();
            dao.TeacherDAO teacherDao = new dao.TeacherDAO();

            List<model.Registration> registrations = regDao.getAllRegistrations();
            List<model.Class> classes = classDao.getAllClasses();
            List<model.Teacher> teachers = teacherDao.getAllTeachers();

            request.setAttribute("registrations", registrations);
            request.setAttribute("classes", classes);
            request.setAttribute("teachers", teachers);
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMsg", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        }
    }
}
