
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

@WebServlet(name = "registerController", urlPatterns = {"/register"})
public class registerController extends HttpServlet {

    UserDAO dao = new UserDAO();

import java.security.MessageDigest;
import utils.HashPass;
import utils.Mail;

/**
 *
 * @author Admin
 */
@WebServlet(name = "registerController", urlPatterns = {"/register"})
public class registerController extends HttpServlet {

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
            out.println("<title>Servlet registerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("account-register.jsp").forward(request, response);
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

  
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String hassPass = hass.hashPassword(password);
        User u = new User(username, email, hassPass, "User");
        if (!password.equals(cpassword)) {
            request.setAttribute("mess", "Please check again password");
            request.getRequestDispatcher("account-register.jsp").forward(request, response);
        }
        if (dao.checkEmailExit(email)) {
            request.setAttribute("mess", "Email alreay exited");
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
