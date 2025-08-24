/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import dao.ProductImageDAO;
import dao.ProductVariantDAO;
import entity.Product;
import entity.ProductImage;
import entity.ProductVariant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "shoesImageController", urlPatterns = {"/shoesimage"})
@MultipartConfig
public class shoesImageController extends HttpServlet {

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
            out.println("<title>Servlet shoesImageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shoesImageController at " + request.getContextPath() + "</h1>");
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
    ProductImageDAO pidao = new ProductImageDAO();
    ProductVariantDAO pvdao = new ProductVariantDAO();
    ProductDAO pdao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ProductImage> listImage = pidao.getAllProductImage();
        List<ProductVariant> listVariant = pvdao.getAllProductVariant();
        List<Product> listPro = pdao.getAllProductt();
        request.setAttribute("listImage", listImage);
        request.setAttribute("listPro", listPro);
        request.setAttribute("listVariant", listVariant);
        request.getRequestDispatcher("adminDashboard/shoes-image.jsp").forward(request, response);
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
        String pvid;
        switch (action) {
            case "addimage":
                pvid = request.getParameter("pvid");
                pidao.deleteAllImage(Integer.parseInt(pvid));
                Collection<Part> parts = request.getParts();
                List<String> pi = new ArrayList<>();
                for (Part part : parts) {
                    if (part.getName().equals("imageA") && part.getSubmittedFileName() != null) {
                        String fileName = part.getSubmittedFileName();
                        String uploadDir = getServletContext().getRealPath("/assets/img/imagevariant");
                        File uploadDirFile = new File(uploadDir);
                        if (!uploadDirFile.exists()) {
                            uploadDirFile.mkdirs();
                        }
                        File file = new File(uploadDir, fileName);
                        part.write(file.getAbsolutePath());
                        int index = file.getAbsolutePath().indexOf("assets");
                        String relativePath = file.getAbsolutePath().substring(index).replace("\\", "/");
                        ProductImage i = new ProductImage(0,Integer.parseInt(pvid),relativePath,1);
                        pidao.addNewImageForVariant(i);
                        pi.add(relativePath);
                    }
                }
                ProductVariant pva = pvdao.getProductVariantByID(Integer.parseInt(pvid));
                pidao.addImageInShoes(pva.getProduct_id(),pi.get(0));
                break;
            case "delete":
                pvid = request.getParameter("pvid");
                ProductVariant pvar = pvdao.getProductVariantByID(Integer.parseInt(pvid));
                pidao.deleteAllImage(Integer.parseInt(pvid));
                pidao.add404Image(Integer.parseInt(pvid));
                pidao.deleteImageInShoes(pvar.getProduct_id());
                break;
            default:
                throw new AssertionError();
        }
        List<ProductImage> listImage = pidao.getAllProductImage();
        List<ProductVariant> listVariant = pvdao.getAllProductVariant();
        List<Product> listPro = pdao.getAllProductt();
        request.setAttribute("listImage", listImage);
        request.setAttribute("listPro", listPro);
        request.setAttribute("listVariant", listVariant);
        request.getRequestDispatcher("adminDashboard/shoes-image.jsp").forward(request, response);
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
