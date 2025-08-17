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
@WebServlet(name = "checkOTPController", urlPatterns = {"/checkOTP"})
public class checkOTPController extends HttpServlet {

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
            out.println("<title>Servlet checkOTPController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkOTPController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UserDAO dao = new UserDAO();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        HashPass hass = new HashPass();
        String action = request.getParameter("action");
        switch (action) {
            case "checkOTPforRegister":
                String otp1 = request.getParameter("otp1");
                String otpCheck1 = (String) s.getAttribute("otp");
                if (!otp1.equals(otpCheck1)) {
                    request.setAttribute("regi", "regi");
                    request.setAttribute("mess", "Please check again OTP");
                    request.getRequestDispatcher("account-check-otp.jsp").forward(request, response);
                } else {
                    User u = (User) s.getAttribute("userRegister");
                    dao.registerAcc(u);
                    s.removeAttribute("userRegister");
                    s.removeAttribute("otp");
                    request.setAttribute("mess", "Register successfully");
                    request.getRequestDispatcher("account-register.jsp").forward(request, response);
                }
                break;
            case "checkOTPforReset":
                String otp2 = request.getParameter("otp2");
                String otpCheck2 = (String) s.getAttribute("otp");
                if (!otp2.equals(otpCheck2)) {
                    request.setAttribute("mess", "Please check again OTP");
                    request.setAttribute("resetpa", "resetpa");
                    request.getRequestDispatcher("account-check-otp.jsp").forward(request, response);
                } else {
                    s.removeAttribute("otp");
                    request.getRequestDispatcher("account-confirm-password-reset.jsp").forward(request, response);
                }
            case "resetPassAfterOTP":
                String password = request.getParameter("password");
                String cpassword = request.getParameter("cpassword");
                if (!password.equals(cpassword)) {
                    request.setAttribute("mess", "Please check again password");
                    request.getRequestDispatcher("account-confirm-password-reset.jsp").forward(request, response);
                } else {
                    
                    User u = (User) s.getAttribute("userReset");
                    User userUpdate = new User(u.getEmail(), hass.hashPassword(password));
                    dao.resetPassword(userUpdate);
                    s.removeAttribute("userReset");
                    request.setAttribute("mess", "Reset password successfully");
                    request.getRequestDispatcher("account-login.jsp").forward(request, response);
                }
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
