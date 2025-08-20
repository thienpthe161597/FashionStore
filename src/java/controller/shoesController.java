/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "shoesController", urlPatterns = {"/shoes"})
public class shoesController extends HttpServlet {

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
            out.println("<title>Servlet shoesControssller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shoesController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    CategoryDAO cdao = new CategoryDAO();
    ProductDAO pdao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String pageParam = request.getParameter("page");
        Integer page = null;
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        if (page == null) {
            page = 1;
        }
        List<Product> listProduct = pdao.getAllProduct(page, 5);
        int totalPages = pdao.getTotalPages(5);
        List<Category> listCategory = cdao.getAllCategory();
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (isLoggedIn == null) {
            String message = (String) request.getSession().getAttribute("message");
            if (message != null) {
                request.setAttribute("message", message);
                request.getSession().removeAttribute("message"); 
            }
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.getRequestDispatcher("adminDashboard/shoe-view.jsp").forward(request, response);
        } else {
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("loginMessage", "Login successfully!");
            session.removeAttribute("isLoggedIn");
            request.getRequestDispatcher("adminDashboard/shoe-view.jsp").forward(request, response);
        }
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
        String id = request.getParameter("id");
        String name, price, category, gender, desc;
        Product product;
        switch (action) {
            case "add":
                name = request.getParameter("shoesname");
                price = request.getParameter("shoesprice");
                category = request.getParameter("shoescategory");
                gender = request.getParameter("shoesgender");
                desc = request.getParameter("shoesdescription");
                if (pdao.getProductByNamee(name) != null) {
                    request.getSession().setAttribute("message", "Product name " + name + " already exited");
                } else {
                    product = new Product(0, Integer.parseInt(category),
                            1, name, desc, Integer.parseInt(price), gender, "");
                    pdao.addNewProduct(product);
                    request.getSession().setAttribute("message", "Add successfully");
                }
                break;
            case "update":
                name = request.getParameter("shoesname");
                price = request.getParameter("shoesprice");
                category = request.getParameter("shoescategory");
                gender = request.getParameter("shoesgender");
                desc = request.getParameter("shoesdescription");
                if (pdao.getProductByName(name, Integer.parseInt(id)) != null) {
                    request.getSession().setAttribute("message", "Product name " + name + " already exited");
                } else {
                    product = new Product(Integer.parseInt(id), Integer.parseInt(category),
                            1, name, desc, Integer.parseInt(price), gender, "");
                    pdao.updateProduct(product);
                    request.getSession().setAttribute("message", "Edit successfully");
                }

                break;
            case "delete":
                int idToDel = Integer.parseInt(request.getParameter("idtodel"));
                pdao.deleteProduct(idToDel);
                request.getSession().setAttribute("message", "Delete successfully");
                break;
            case "searchname":
                String nameSearch = request.getParameter("nameSearch");
                String pageParam = request.getParameter("page");
                Integer page = null;
                if (pageParam != null && !pageParam.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageParam);
                    } catch (NumberFormatException e) {
                        page = 1;
                    }
                }
                if (page == null) {
                    page = 1;
                }
                List<Product> listProduct = pdao.searchByName(nameSearch, page, 5);
                List<Category> listCategory = cdao.getAllCategory();
                int totalPages = pdao.getTotalPagesBySearch(nameSearch, 5);
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("listProduct", listProduct);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("nameSearch", nameSearch);
                request.getRequestDispatcher("adminDashboard/shoe-view.jsp").forward(request, response);
                return;
            case "filter":
                int brandCheck = Integer.parseInt(request.getParameter("brandCheck"));
                String pageParamm = request.getParameter("page");
                Integer pagee = null;
                if (pageParamm != null && !pageParamm.isEmpty()) {
                    try {
                        pagee = Integer.parseInt(pageParamm);
                    } catch (NumberFormatException e) {
                        pagee = 1;
                    }
                }
                if (pagee == null) {
                    pagee = 1;
                }
                List<Product> listProductt = pdao.filterByBrand(brandCheck, pagee, 5);
                List<Category> listCategoryy = cdao.getAllCategory();
                int totalPagess = pdao.getTotalPagesByFilter(brandCheck, 5);
                request.setAttribute("listCategory", listCategoryy);
                request.setAttribute("listProduct", listProductt);
                request.setAttribute("currentPage", pagee);
                request.setAttribute("totalPages", totalPagess);
                request.setAttribute("brandCheck", brandCheck);
                request.getRequestDispatcher("adminDashboard/shoe-view.jsp").forward(request, response);
                return;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("shoes");
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
