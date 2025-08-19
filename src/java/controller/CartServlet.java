/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author Admin
 */
import entity.CartItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            for (CartItem item : cart) {
                String qtyParam = request.getParameter("quantity_" + item.getProductId());
                if (qtyParam != null) {
                    int newQty = Integer.parseInt(qtyParam);
                    if (newQty > 0) {
                        item.setQuantity(newQty);
                    }
                }
            }
        } else if ("remove".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            cart.removeIf(item -> item.getProductId() == id);
        } else if ("clear".equals(action)) {
            cart.clear();
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("shop-cart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
