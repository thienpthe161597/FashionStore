/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ProductDAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="ProductController", urlPatterns={"/ProductController"})
public class ProductController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ProductController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ProductDAO productDao = new ProductDAO();
    
    int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int pageSize = 9; 

    int categoryId = request.getParameter("category") != null ? Integer.parseInt(request.getParameter("category")) : 0;
    String sort = request.getParameter("sort") != null ? request.getParameter("sort") : "default";
    String gender = request.getParameter("gender") != null ? request.getParameter("gender") : "default";

    try {
        List<Product> productList = productDao.getFilteredProducts(categoryId, sort, gender, page, pageSize);
List<Product> allProducts = productDao.getAllProductt(); // lấy tất cả sản phẩm
int totalProducts = allProducts.size();


        request.setAttribute("productList", productList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalProducts);
        request.setAttribute("category", categoryId);
        request.setAttribute("gender", gender);
        request.setAttribute("sort", sort);
        
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace(response.getWriter());
    }
}
 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}