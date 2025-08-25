package controller;

import dao.UserDAO;
import entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer-list")
public class CustomerListServlet extends HttpServlet {

    private static final int PAGE_SIZE = 5;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("search");
        String pageParam = request.getParameter("page");
        int page = 1;
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        UserDAO dao = new UserDAO();
        List<User> customers;

        int totalUsers;
        if (search != null && !search.trim().isEmpty()) {
            customers = dao.searchUsersByRoleAndKeyword("user", search.trim(), page, PAGE_SIZE);
            totalUsers = dao.getTotalUsersByRoleAndKeyword("user", search.trim());
        } else {
            customers = dao.getUsersByRoleWithPaging("user", page, PAGE_SIZE);
            totalUsers = dao.getTotalUsersByRole("user");
        }

        int totalPages = (int) Math.ceil((double) totalUsers / PAGE_SIZE);

        request.setAttribute("customers", customers);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("search", search);

        request.getRequestDispatcher("adminDashboard/customer-list.jsp").forward(request, response);
    }
}
