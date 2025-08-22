/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.security.SecureRandom;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HashPass;
import utils.Mail;

/**
 *
 * @author Admin
 */
@WebServlet(name = "resetPasswordController", urlPatterns = {"/reset"})
public class resetPasswordController extends HttpServlet {

    UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        if (!dao.checkEmailExit(email)) {
            request.setAttribute("mess", "This email is not registered");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        } else {
            try {
                // 1. Tạo mật khẩu mới ngẫu nhiên
                String newPassword = generateRandomPassword(10);

                // 2. Hash mật khẩu
                HashPass hass = new HashPass();
                String hashedPassword = hass.hashPassword(newPassword);

                // 3. Update vào DB
                dao.updatePasswordByEmail(email, hashedPassword);

                // 4. Gửi mật khẩu mới về email
                Mail m = new Mail();
                String subject = "Your new password";
                String content = "Hello,\n\nYour password has been reset successfully.\n"
                               + "Here is your new password: " + newPassword + "\n\n"
                               + "Please log in and change it as soon as possible.";
                m.sendMailCustom(email, subject, content);

                // 5. Thông báo thành công
                request.setAttribute("mess", "A new password has been sent to your email.");
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("mess", "Error while resetting password. Please try again.");
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);
            }
        }
    }

    // Hàm tạo mật khẩu ngẫu nhiên
    private String generateRandomPassword(int length) {
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$%!";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(chars.length());
            sb.append(chars.charAt(index));
        }

        return sb.toString();
    }

    @Override
    public String getServletInfo() {
        return "Reset password and send new one via email";
    }

}
