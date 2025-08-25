
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.security.SecureRandom;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.Mail;
import utils.PasswordUtil;

@WebServlet(name = "resetPasswordController", urlPatterns = {"/reset"})
public class resetPasswordController extends HttpServlet {

    UserDAO dao = new UserDAO();

    // Sinh mật khẩu mới hợp lệ (ít nhất 1 hoa, thường, số, ký tự đặc biệt, >= 8 ký tự)
    private String generateValidPassword() {
        String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lower = "abcdefghijklmnopqrstuvwxyz";
        String digits = "0123456789";
        String special = "@";
        String all = upper + lower + digits + special;

        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        sb.append(upper.charAt(random.nextInt(upper.length())));
        sb.append(lower.charAt(random.nextInt(lower.length())));
        sb.append(digits.charAt(random.nextInt(digits.length())));
        sb.append(special.charAt(random.nextInt(special.length())));

        // Thêm ký tự còn lại (tổng độ dài 10)
        for (int i = 4; i < 10; i++) {
            sb.append(all.charAt(random.nextInt(all.length())));
        }

        return sb.toString();
    }

import jakarta.servlet.http.HttpSession;
import utils.Mail;

/**
 *
 * @author Admin
 */
@WebServlet(name = "resetPasswordController", urlPatterns = {"/reset"})
public class resetPasswordController extends HttpServlet {

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
            out.println("<title>Servlet resetPasswordController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet resetPasswordController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        // Kiểm tra email tồn tại
        if (!dao.checkEmailExit(email)) {
            request.setAttribute("mess", "Email is not registered!");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
            return;
        }

        // Sinh mật khẩu mới
        String newPass = generateValidPassword();
        String hashedPass = PasswordUtil.hashPassword(newPass);

        // Update mật khẩu đã hash vào DB
        boolean updated = dao.updatePasswordByEmail(email, hashedPass);

        if (updated) {
            // Gửi mật khẩu gốc qua email cho user
            Mail mail = new Mail();
            mail.sendEmailWithContent(
                email,
                "Your New Password",
                "Hello,\n\nYour new password is: " + newPass +
                "\nPlease change it after login.\n\nBest regards,\nFashion Store Team"
            );

            request.setAttribute("mess", "New password has been sent to your email!");
            request.getRequestDispatcher("account-login.jsp").forward(request, response);
        } else {
            request.setAttribute("mess", "Error while resetting password, please try again!");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
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
    UserDAO dao = new UserDAO();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        String email = request.getParameter("email");
        if(!dao.checkEmailExit(email)){
            request.setAttribute("mess", "Mail isn't register");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        } else {
           Mail m = new Mail();
           String otp = m.sendEmail(email);
           User u = new User(email);
           s.setAttribute("userReset", u);
           s.setAttribute("otp", otp);
           request.setAttribute("resetpa", "resetpa");
           request.getRequestDispatcher("account-check-otp.jsp").forward(request, response);
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
