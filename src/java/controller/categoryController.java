/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
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
@WebServlet(name = "categoryController", urlPatterns = {"/brand"})
public class categoryController extends HttpServlet {

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
            out.println("<title>Servlet brandController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet brandController at " + request.getContextPath() + "</h1>");
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
        List<Category> listCate = cdao.getAllCategory();
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("adminDashboard/brand-view.jsp").forward(request, response);
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
        switch (action) {
            case "addCate":
                String nameCate = request.getParameter("catename");
                if (cdao.getCategoryByName(nameCate) != null) {
                    request.setAttribute("message", "Category name " + nameCate + " already exited");
                } else {
                    cdao.addNewCate(nameCate);
                    request.setAttribute("message", "Add category successfully");
                }
                break;
            case "deleteCate":
                String idcate = request.getParameter("idcate");
                if (pdao.getProductByIDCate(Integer.parseInt(idcate)) != null) {
                    request.setAttribute("message", "Can't delete category because there product have this category");
                } else {
                    cdao.deleteCate(Integer.parseInt(idcate));
                    request.setAttribute("message", "Delete category successfully");
                }

                break;
            default:
                throw new AssertionError();
        }
        List<Category> listCate = cdao.getAllCategory();
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("adminDashboard/brand-view.jsp").forward(request, response);
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
