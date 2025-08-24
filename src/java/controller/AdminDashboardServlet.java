/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;




/**
 *
 * @author Admin
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/dashBoard"})
public class AdminDashboardServlet extends HttpServlet {
    private ProductDAO pdao = new ProductDAO();
    private CategoryDAO cdao = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int totalShoes = pdao.getTotalProducts();
        int totalRevenue = pdao.getTotalPages(totalShoes);
        int totalCategories = cdao.getAllCategory().size();

        request.setAttribute("totalShoes", totalShoes);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalCategories", totalCategories);

        request.getRequestDispatcher("adminDashboard/dashBoard.jsp").forward(request, response);
    }
}
