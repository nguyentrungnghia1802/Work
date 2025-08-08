package controller;

import dao.RegistrationDAO;
import model.Registration;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;

public class AdminListServlet extends HttpServlet {
    private RegistrationDAO registrationDAO;

    @Override
    public void init() throws ServletException {
        registrationDAO = new RegistrationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Registration> list;
        if (search != null && !search.isEmpty()) {
            list = registrationDAO.searchRegistrations(search);
        } else {
            list = registrationDAO.getAllRegistrations();
        }
        // Phân trang
        int pageSize = 10;
        int page = 1;
        if(request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
        int total = list.size();
        int pageCount = (int)Math.ceil(total/(double)pageSize);
        int from = (page-1)*pageSize, to = Math.min(page*pageSize, total);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("currentPage", page);
        request.setAttribute("registrations", list.subList(from, to));
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}
