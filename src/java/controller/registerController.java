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
import utils.Mail;

/**
 *
 * @author Admin
 */
@WebServlet(name = "registerController", urlPatterns = {"/register"})
public class registerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("account-register.jsp").forward(request, response);
    }

    UserDAO dao = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        HashPass hass = new HashPass();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");

        // Regex kiểm tra password
        // Bắt buộc có @, có thêm ít nhất 1 ký tự đặc biệt khác, không chứa khoảng trắng, tối thiểu 6 ký tự
        String passwordRegex = "^(?=.*[@])(?=.*[^a-zA-Z0-9@])(?!.*\\s).{6,}$";

        // Kiểm tra username
        if (username.length() < 6) {
            request.setAttribute("mess", "Username must be at least 6 characters");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // Kiểm tra password == confirm password
        if (!password.equals(cpassword)) {
            request.setAttribute("mess", "Password and Confirm Password do not match");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        // Kiểm tra password hợp lệ
        if (!password.matches(passwordRegex)) {
            request.setAttribute("mess", "Password must contain '@', at least one special character, no spaces, and be at least 6 characters long");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
            return;
        }

        String hassPass = hass.hashPassword(password);
        User u = new User(username, email, hassPass, "User");

        // Kiểm tra email tồn tại
        if (dao.checkEmailExit(email)) {
            request.setAttribute("mess", "Email already exists");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
        } else {
            Mail m = new Mail();
            String otps = m.sendEmail(email);
            s.setAttribute("otp", otps);
            s.setAttribute("userRegister", u);
            request.setAttribute("regi", "regi");
            request.getRequestDispatcher("account-check-otp.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Register Controller";
    }

}
