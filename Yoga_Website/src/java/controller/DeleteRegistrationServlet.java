package controller;

import dao.RegistrationDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteRegistrationServlet extends HttpServlet {
    private RegistrationDAO registrationDAO;

    @Override
    public void init() throws ServletException {
        registrationDAO = new RegistrationDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.setStatus(401); // Unauthorized
            return;
        }
        String idStr = request.getParameter("id");
        try {
            int id = Integer.parseInt(idStr);
            boolean success = registrationDAO.deleteRegistration(id);
            response.setStatus(success ? 200 : 500);
        } catch (Exception e) {
            response.setStatus(500);
        }
    }
}
