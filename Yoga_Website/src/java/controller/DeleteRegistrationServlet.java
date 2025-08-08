package java.controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@WebServlet("/DeleteRegistrationServlet")
public class DeleteRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String path = getServletContext().getRealPath("/WEB-INF/registrations.txt");
        List<String> lines = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line; int idx = 0;
            while((line = br.readLine()) != null) {
                if(!String.valueOf(idx).equals(id)) lines.add(line);
                idx++;
            }
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(path))) {
            for(String l : lines) out.println(l);
        }
        response.setStatus(200);
    }
}
