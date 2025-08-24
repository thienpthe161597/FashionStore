/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.HashPass;

/**
 *
 * @author Admin
 */
@WebServlet(name = "profileController", urlPatterns = {"/user"})
public class profileController extends HttpServlet {

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
            out.println("<title>Servlet profileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profileController at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("account.jsp").forward(request, response);
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
        HashPass hash = new HashPass();
        UserDAO dao = new UserDAO();
        HttpSession s = request.getSession();
        String action = request.getParameter("action");
        User u = (User) s.getAttribute("user");
        switch (action) {
            case "changeprofile":
                String username = request.getParameter("username");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                User user = new User(u.getUser_ID(), username, address, phone);
                dao.updateProfileUser(user);
                User user1 = dao.getUser(u.getEmail());
                s.removeAttribute("user");
                s.setAttribute("user", user1);
                request.getRequestDispatcher("account.jsp").forward(request, response);
                break;
            case "changepass":
                String current_pwd = request.getParameter("current-pwd");
                String new_pwd = request.getParameter("new-pwd");
                User user2 = dao.getUser(u.getEmail());
                if (!user2.getPassword().equals(hash.hashPassword(current_pwd))) {
                    request.setAttribute("error", "Current password is incorrect.");
                    request.getRequestDispatcher("account.jsp").forward(request, response);
                } else {
                    dao.updatePassword(user2.getUser_ID(), hash.hashPassword(new_pwd));
                    request.setAttribute("error", "Change password successfully");
                    request.getRequestDispatcher("account.jsp").forward(request, response);
                }

                break;
            default:
                throw new AssertionError();
        }
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
