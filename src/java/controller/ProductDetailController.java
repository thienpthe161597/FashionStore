package controller;

import dao.ProductDAO;
import dao.ProductVariantDAO;
import entity.Product;
import entity.ProductVariant;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/product-detail")
public class ProductDetailController extends HttpServlet {

    private ProductDAO productDAO;
    private ProductVariantDAO productVariantDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        productVariantDAO = new ProductVariantDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                Product product = productDAO.getProductByID(id);

                if (product != null) {
                    // lấy danh sách variant (màu + size theo product)
                    List<ProductVariant> variants = productVariantDAO.getVariantsByProductId(id);

                    // set vào request để JSP dùng
                    request.setAttribute("product", product);
                    request.setAttribute("variants", variants);

                    // forward sang trang chi tiết sản phẩm
                    request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("shop.jsp");
    }
}
