package controller;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.HashPass;
import utils.Mail;

@WebServlet(name = "registerController", urlPatterns = {"/register"})
public class registerController extends HttpServlet {

    UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("account-register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        HashPass hass = new HashPass();

        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String cpassword = request.getParameter("cpassword").trim();

        // 🚫 Không cho phép khoảng trắng hoặc rỗng
        if (username.isEmpty() || email.isEmpty() || password.isEmpty() || cpassword.isEmpty()
                || username.contains(" ") || email.contains(" ") || password.contains(" ") || cpassword.contains(" ")) {
            request.setAttribute("mess", "Fields cannot be empty or contain spaces");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // ✅ Validate username
        if (username.length() < 6) {
            request.setAttribute("mess", "Username must be at least 6 characters");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // ✅ Validate password (ít nhất 1 thường, 1 hoa, 1 số, 1 ký tự @, >=8 ký tự, không khoảng trắng)
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*@)[^\\s]{8,}$";
        if (!password.matches(passwordRegex)) {
            request.setAttribute("mess", "Password must be at least 8 characters, include uppercase, lowercase, number, '@' and no spaces");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // ✅ Confirm password
        if (!password.equals(cpassword)) {
            request.setAttribute("mess", "Password and Confirm Password do not match");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // ✅ Check email exists
        if (dao.checkEmailExit(email)) {
            request.setAttribute("mess", "Email already exists");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // ✅ Hash password & create user
        String hassPass = hass.hashPassword(password);
        User u = new User(username, email, hassPass, "User");

        // ✅ Gửi OTP để xác thực đăng ký
        Mail m = new Mail();
        String otps = m.sendEmail(email);
        s.setAttribute("otp", otps);
        s.setAttribute("userRegister", u);
        request.setAttribute("regi", "regi");
        request.getRequestDispatcher("account-check-otp.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Register Controller";
    }
}

  
