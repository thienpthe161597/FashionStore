package controller;

import dao.UserDAO;
import java.io.IOException;
import java.security.SecureRandom;
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
}
