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
        public void init() {
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

                // Lấy product đầy đủ
                Product product = productDAO.getProductByIDFull(id);

                if (product != null) {
                    // Lấy danh sách variant theo product
                    List<ProductVariant> variants = productVariantDAO.getVariantByShoesName(id);

                    // set request
                    request.setAttribute("product", product);
                    request.setAttribute("variants", variants);

                    // forward sang JSP
                    request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Nếu id không hợp lệ hoặc product null
        response.sendRedirect("shop.jsp");
    }
    }
