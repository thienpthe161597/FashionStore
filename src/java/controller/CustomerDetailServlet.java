package controller;

import dao.UserDAO;
import entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/customer-detail")
public class CustomerDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                UserDAO dao = new UserDAO();
                User user = dao.getUserById(id);

                if (user != null && "user".equalsIgnoreCase(user.getRole())) {
                    request.setAttribute("customer", user);
                    request.getRequestDispatcher("adminDashboard/customer-detail.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("adminDashboard/customer-list");
    }
}
