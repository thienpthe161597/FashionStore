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
import java.util.List;
import utils.HashPass;

/**
 * 
 *
 * @author admin
 */
@WebServlet(name = "AdminUserController", urlPatterns = {"/userlist"})
public class AdminUserController extends HttpServlet {

    private UserDAO dao = new UserDAO();
    private static final int PAGE_SIZE = 5; // Number of users per page

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method to display the user list.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Do not create new session
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;
        if (currentUser == null || !"Admin".equalsIgnoreCase(currentUser.getRole())) {
            request.setAttribute("mess", "Error: Unauthorized access! Please log in as an admin.");
            request.getRequestDispatcher("account-login.jsp").forward(request, response);
            return;
        }

        String nameSearch = request.getParameter("nameSearch");
        String pageStr = request.getParameter("page");
        int page = (pageStr == null || pageStr.isEmpty()) ? 1 : Integer.parseInt(pageStr);

        List<User> users;
        int totalUsers;
        int totalPages;

        if (nameSearch == null || nameSearch.trim().isEmpty()) {
            // No search: retrieve all users with pagination
            users = dao.getAllUsersWithPaging(page, PAGE_SIZE);
            totalUsers = dao.getTotalUsers();
        } else {
            // Search by User_Name or Email
            users = dao.searchUsersByNameOrEmail(nameSearch, page, PAGE_SIZE);
            totalUsers = dao.getTotalUsersByNameOrEmail(nameSearch);
            request.setAttribute("nameSearch", nameSearch); // Store keyword for pagination
        }

        totalPages = (int) Math.ceil((double) totalUsers / PAGE_SIZE);

        request.setAttribute("users", users);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentUser", currentUser); // Pass current user to JSP
        request.getRequestDispatcher("adminDashboard/user-list.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method for add, update, delete, and search actions.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Do not create new session
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;
        if (currentUser == null || !"Admin".equalsIgnoreCase(currentUser.getRole())) {
            request.setAttribute("mess", "Error: Unauthorized access! Please log in as an admin.");
            request.getRequestDispatcher("account-login.jsp").forward(request, response);
            return;
        }

        try {
            String action = request.getParameter("action");
            System.out.println("Action received: " + action); // Debug

            if (action == null) {
                throw new IllegalArgumentException("Invalid action!");
            }

            if ("add".equals(action)) {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                System.out.println("Add User - Username: " + username + ", Email: " + email + ", Password: " + password + ", Role: " + role); // Debug

                // Validate input data
                if (username == null || email == null || password == null || role == null ||
                    username.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty() || role.trim().isEmpty()) {
                    throw new IllegalArgumentException("Please fill in all required fields!");
                }

                // Check if email already exists
                if (dao.checkEmailExit(email)) {
                    throw new IllegalArgumentException("Email already exists!");
                }

                // Hash password
                HashPass hash = new HashPass();
                User newUser = new User(email, hash.hashPassword(password));
                newUser.setUser_Name(username);
                newUser.setRole(role);

                boolean success = dao.registerAcc(newUser);

                if (success) {
                    response.sendRedirect("userlist");
                } else {
                    throw new IllegalStateException("Failed to add user!");
                }
            } else if ("update".equals(action)) {
                String idStr = request.getParameter("id");
                if (idStr == null || idStr.trim().isEmpty()) {
                    throw new IllegalArgumentException("Invalid user ID!");
                }
                int userId;
                try {
                    userId = Integer.parseInt(idStr);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("Invalid user ID format!");
                }

                // Check if the user being edited is an admin and not the current admin
                User userToEdit = dao.getUserById(userId);
                if (userToEdit == null) {
                    throw new IllegalArgumentException("User not found!");
                }
                if ("Admin".equalsIgnoreCase(userToEdit.getRole()) && userId != currentUser.getUser_ID()) {
                    throw new IllegalArgumentException("You are not authorized to edit other admins!");
                }

                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String role = request.getParameter("role");

                // Validate input data
                if (username == null || email == null || role == null ||
                    username.trim().isEmpty() || email.trim().isEmpty() || role.trim().isEmpty()) {
                    throw new IllegalArgumentException("Please fill in all required fields!");
                }

                // Check if email is already used by another user
                User existingUser = dao.getUser(email);
                if (existingUser != null && existingUser.getUser_ID() != userId) {
                    throw new IllegalArgumentException("Email already exists!");
                }

                // Create updated user object
                User updatedUser = new User();
                updatedUser.setUser_ID(userId);
                updatedUser.setUser_Name(username);
                updatedUser.setEmail(email);
                updatedUser.setRole(role);
                updatedUser.setAddress("");
                updatedUser.setPhone("");

                // Update password if provided
                if (password != null && !password.trim().isEmpty()) {
                    HashPass hash = new HashPass();
                    updatedUser.setPassword(hash.hashPassword(password));
                } else {
                    updatedUser.setPassword(userToEdit.getPassword());
                }

                // Update user information
                dao.updateUser(updatedUser);
                response.sendRedirect("userlist");
            } else if ("delete".equals(action)) {
                String idStr = request.getParameter("idtodel");
                if (idStr == null || idStr.trim().isEmpty()) {
                    throw new IllegalArgumentException("Invalid user ID!");
                }
                int userId;
                try {
                    userId = Integer.parseInt(idStr);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("Invalid user ID format!");
                }
                dao.deleteUser(userId);
                response.sendRedirect("userlist");
            } else if ("searchname".equals(action)) {
                String nameSearch = request.getParameter("nameSearch");
                String pageStr = request.getParameter("page");
                int page = (pageStr == null || pageStr.isEmpty()) ? 1 : Integer.parseInt(pageStr);

                List<User> users = dao.searchUsersByNameOrEmail(nameSearch, page, PAGE_SIZE);
                int totalUsers = dao.getTotalUsersByNameOrEmail(nameSearch);
                int totalPages = (int) Math.ceil((double) totalUsers / PAGE_SIZE);

                request.setAttribute("users", users);
                request.setAttribute("nameSearch", nameSearch);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentUser", currentUser); // Pass current user to JSP
                request.getRequestDispatcher("adminDashboard/user-list.jsp").forward(request, response);
            } else {
                throw new IllegalArgumentException("Unsupported action: " + action);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in doPost: " + e.getMessage()); // Debug
            request.setAttribute("mess", "Error: " + e.getMessage());
            List<User> users = dao.getAllUsersWithPaging(1, PAGE_SIZE);
            request.setAttribute("users", users);
            request.setAttribute("currentPage", 1);
            request.setAttribute("totalPages", (int) Math.ceil((double) dao.getTotalUsers() / PAGE_SIZE));
            // Do not set currentUser if session is null or user is not logged in
            request.getRequestDispatcher("adminDashboard/user-list.jsp").forward(request, response);
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
    }
}