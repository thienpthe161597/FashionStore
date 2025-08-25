package controller;

import entity.CartItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy session
        HttpSession session = request.getSession();

        // Lấy giỏ hàng từ session (nếu chưa có thì tạo mới)
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Lấy dữ liệu từ form/product page
        String idStr = request.getParameter("id");
        int productId = 0;
        try {
            if (idStr != null && !idStr.trim().isEmpty()) {
                productId = Integer.parseInt(idStr);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp"); // hoặc xử lý khác
            return;
        }
        String name = request.getParameter("name");
        double price = 0.0;
        try {
            String priceStr = request.getParameter("price");
            if (priceStr != null && !priceStr.trim().isEmpty()) {
                price = Double.parseDouble(priceStr);
            }
        } catch (NumberFormatException e) {
            // Nếu lỗi thì có thể chuyển hướng hoặc set mặc định
            price = 0.0;
        }
        String image = request.getParameter("image");
        // Xử lý quantity an toàn
        String quantityStr = request.getParameter("quantity");
        int quantity = 1; // mặc định 1
        if (quantityStr != null && !quantityStr.trim().isEmpty()) {
            try {
                quantity = Integer.parseInt(quantityStr);
            } catch (NumberFormatException e) {
                quantity = 1; // fallback nếu parse fail
            }
        }

        // Kiểm tra sản phẩm đã có trong giỏ chưa
        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProductId() == productId) {
                // Nếu có rồi thì cộng dồn số lượng
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        // Nếu chưa có thì thêm mới
        if (!found) {
            CartItem newItem = new CartItem(productId, name, price, quantity, image);
            cart.add(newItem);
        }

        // Lưu lại vào session
        session.setAttribute("cart", cart);

        // Chuyển hướng về giỏ hàng hoặc trang trước
        response.sendRedirect("shop-cart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
