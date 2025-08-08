package java.controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@WebServlet("/AdminListServlet")
public class AdminListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = getServletContext().getRealPath("/WEB-INF/registrations.txt");
        List<String[]> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while((line = br.readLine()) != null) {
                list.add(line.split(","));
            }
        }
        // Tìm kiếm
        String search = request.getParameter("search");
        if(search != null && !search.isEmpty()) {
            list.removeIf(arr -> Arrays.stream(arr).noneMatch(s -> s.toLowerCase().contains(search.toLowerCase())));
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
        PrintWriter out = response.getWriter();
        for(int i=from;i<to;i++) {
            String[] arr = list.get(i);
            out.println("<tr><td>"+i+"</td><td>"+arr[0]+"</td><td>"+arr[1]+"</td><td>"+arr[2]+"</td><td>"+arr[3]+"</td><td>"+arr[4]+"</td><td><button onclick=\"deleteRegistration('"+i+"')\">Xóa</button></td></tr>");
        }
    }
}
