/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import dao.ProductVariantDAO;
import entity.Product;
import entity.ProductVariant;
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
