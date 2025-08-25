
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import dao.ProductVariantDAO;
import dao.ShoeSizeDAO;
import entity.Product;
import entity.ProductVariant;
import entity.ShoeSize;
import java.io.IOException;
import java.util.List;

import entity.Product;
import entity.ProductVariant;
import java.io.IOException;
import java.io.PrintWriter;
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
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "shoesVariantController", urlPatterns = {"/shoesvariant"})
public class shoesVariantController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet shoesVariantController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shoesVariantController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProductDAO pdao = new ProductDAO();
    ProductVariantDAO pvdao = new ProductVariantDAO();

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


        List<ProductVariant> listProductVariant = pvdao.getAllProductVariant();
        List<Product> listProduct = pdao.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listProductVariant", listProductVariant);
        request.getRequestDispatcher("adminDashboard/variant-view.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

        String color;
        String size;
        String quantity;
        String shoesname;
        String idVariant;
        List<ProductVariant> pcheck;
        switch (action) {
            case "add":
                color = request.getParameter("color");
                size = request.getParameter("size");
                quantity = request.getParameter("quantity");
                shoesname = request.getParameter("shoesvariantname");
                pcheck = pvdao.getVariantByShoesName(Integer.parseInt(shoesname));
                for (ProductVariant pc : pcheck) {
                    if (pc.getColor().equalsIgnoreCase(color)) {
                        Product p = pdao.getProductByID(Integer.parseInt(shoesname));
                        request.setAttribute("message", "Color " + color + " for " + p.getProductName() + " already exited");
                        List<ProductVariant> listProductVariant = pvdao.getAllProductVariant();
                        List<Product> listProduct = pdao.getAllProduct();
                        request.setAttribute("listProduct", listProduct);
                        request.setAttribute("listProductVariant", listProductVariant);
                        request.getRequestDispatcher("adminDashboard/variant-view.jsp").forward(request, response);
                        return;
                    }
                }
                ProductVariant padd = new ProductVariant(0, Integer.parseInt(shoesname),
                        color, Integer.parseInt(size), Integer.parseInt(quantity));
                pvdao.addNewVariant(padd);
                pvdao.add404ToNewVariant(pvdao.getLastVariant());
                request.setAttribute("message", "Add variant successfully");
                break;
            case "edit":
                idVariant = request.getParameter("id");
                color = request.getParameter("color");
                size = request.getParameter("size");
                quantity = request.getParameter("quantity");
                shoesname = request.getParameter("shoesvariantname");
                pcheck = pvdao.getVariantByShoesName(Integer.parseInt(shoesname));
                for (ProductVariant pc : pcheck) {
                    if (pc.getColor().equalsIgnoreCase(color)) {
                        Product p = pdao.getProductByID(Integer.parseInt(shoesname));
                        request.setAttribute("message", "Color " + color + " for " + p.getProductName() + " already exited");
                        List<ProductVariant> listProductVariant = pvdao.getAllProductVariant();
                        List<Product> listProduct = pdao.getAllProduct();
                        request.setAttribute("listProduct", listProduct);
                        request.setAttribute("listProductVariant", listProductVariant);
                        request.getRequestDispatcher("adminDashboard/variant-view.jsp").forward(request, response);
                        return;
                    }
                }
                ProductVariant pedit = new ProductVariant(Integer.parseInt(idVariant), Integer.parseInt(shoesname),
                        color, Integer.parseInt(size), Integer.parseInt(quantity));
                pvdao.updateVariant(pedit);
                request.setAttribute("message", "Edit variant successfully");
                break;
            case "delete":
                idVariant = request.getParameter("id");
                pvdao.deleteVariant(Integer.parseInt(idVariant));
                request.setAttribute("message", "Delete variant successfully");
                break;
            default:
                throw new AssertionError();
        }
        List<ProductVariant> listProductVariant = pvdao.getAllProductVariant();
        List<Product> listProduct = pdao.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listProductVariant", listProductVariant);
        request.getRequestDispatcher("adminDashboard/variant-view.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
