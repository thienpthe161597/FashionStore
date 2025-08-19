/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name="CancelOrderController", urlPatterns={"/CancelOrderController"})
public class CancelOrderController extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String orderMsg = "";
        HttpSession session = request.getSession();
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // Call DAO to cancel the order
        OrderDAO orderDAO = new OrderDAO();
        boolean isCancelled = orderDAO.cancelOrder(orderId);

        if (isCancelled) {
            orderMsg = "Order cancelled successfully.";
        } else {
            orderMsg = "Failed to cancel the order.";
        }

        // Redirect back to account.jsp
        session.setAttribute("orderMsg", orderMsg);
        response.sendRedirect("user");
    }

}
