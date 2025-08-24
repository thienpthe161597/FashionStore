package controller;

import dao.ProductDAO;
import dao.ProductVariantDAO;
import dao.ShoeSizeDAO;
import entity.Product;
import entity.ProductVariant;
import entity.ShoeSize;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "shoesVariantController", urlPatterns = {"/shoesvariant"})
public class shoesVariantController extends HttpServlet {

    ProductDAO pdao = new ProductDAO();
    ProductVariantDAO pvdao = new ProductVariantDAO();
    ShoeSizeDAO sdao = new ShoeSizeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy tham số search + page
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
        int pageSize = 5;

        // Lấy dữ liệu phân trang
        List<ProductVariant> listProductVariant = pvdao.getProductVariantByPage(search, page, pageSize);
        int totalRecords = pvdao.countProductVariant(search);
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        // Dữ liệu phụ
        List<Product> listProduct = pdao.getAllProductt();
        List<ShoeSize> listSize = sdao.getAll();

        // Truyền về JSP
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listProductVariant", listProductVariant);
        request.setAttribute("listSize", listSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("search", search);

        // Lấy message từ session (sau redirect)
        String message = (String) request.getSession().getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            request.getSession().removeAttribute("message");
        }

        request.getRequestDispatcher("adminDashboard/variant-view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String message = "";

        try {
            switch (action) {
                case "add": {
                    int productID = Integer.parseInt(request.getParameter("shoesvariantname"));
                    String color = request.getParameter("color");
                    int sizeID = Integer.parseInt(request.getParameter("size"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    // check trùng color + size cho cùng 1 product
                    List<ProductVariant> existing = pvdao.getVariantByShoesName(productID);
                    boolean exists = existing.stream().anyMatch(v ->
                            v.getColor().equalsIgnoreCase(color) && v.getSizeID() == sizeID);

                    if (exists) {
                        ShoeSize s = sdao.findById(sizeID);
                        Product p = pdao.getProductByID(productID);
                        message = "Color " + color + " and Size " + s.getSizeValue()
                                + " for " + p.getProductName() + " already exists";
                    } else {
                        ProductVariant padd = new ProductVariant(0, productID, color, sizeID, quantity, null);
                        pvdao.addNewVariant(padd);
                        pvdao.add404ToNewVariant(pvdao.getLastVariant());
                        message = "Add variant successfully";
                    }
                    break;
                }
                case "edit": {
                    int idVariant = Integer.parseInt(request.getParameter("id"));
                    int productID = Integer.parseInt(request.getParameter("shoesvariantname"));
                    String color = request.getParameter("color");
                    int sizeID = Integer.parseInt(request.getParameter("size"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    

                    ProductVariant pedit = new ProductVariant(idVariant, productID, color, sizeID, quantity, null);
                    pvdao.updateVariant(pedit);
                    message = "Edit variant successfully";
                    break;
                }
                case "delete": {
                    int idVariant = Integer.parseInt(request.getParameter("id"));
                    pvdao.deleteVariant(idVariant);
                    message = "Delete variant successfully";
                    break;
                }
                default:
                    message = "Invalid action!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        }

        // Đặt message vào session để hiển thị sau redirect
        request.getSession().setAttribute("message", message);
        response.sendRedirect("shoesvariant");
    }

    @Override
    public String getServletInfo() {
        return "Shoes Variant Controller with CRUD + search + pagination";
    }
}
