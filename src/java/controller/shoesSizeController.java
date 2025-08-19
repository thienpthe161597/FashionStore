package controller;

import dao.ShoeSizeDAO;
import entity.ShoeSize;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShoeSizeController", urlPatterns = {"/shoessize"})
public class shoesSizeController extends HttpServlet {

    private ShoeSizeDAO dao;

    @Override
    public void init() {
        dao = new ShoeSizeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<ShoeSize> list = dao.getAll();

        // get message from session (after redirect)
        HttpSession session = req.getSession();
        String successMsg = (String) session.getAttribute("successMsg");
        if (successMsg != null) {
            req.setAttribute("successMsg", successMsg);
            session.removeAttribute("successMsg");
        }

        req.setAttribute("listSize", list);
        req.getRequestDispatcher("/adminDashboard/size-shoes.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        String errorMsg = null;
        String successMsg = null;

        switch (action) {
            case "add": {
                String sizeValue = req.getParameter("sizeValue");
                if (sizeValue == null || sizeValue.trim().isEmpty()) {
                    errorMsg = "Size cannot be empty!";
                } else if (!sizeValue.matches("^[0-9]{1,2}(\\.5)?$")) {
                    errorMsg = "Size must be a valid number (e.g., 38 or 38.5).";
                } else if (dao.existsByValue(sizeValue.trim())) {
                    errorMsg = "This size already exists!";
                } else {
                    dao.insert(sizeValue.trim());
                    successMsg = "Size added successfully!";
                }
                break;
            }
            case "edit": {
                String idStr = req.getParameter("id");
                String sizeValue = req.getParameter("sizeValue");
                if (idStr == null || idStr.isEmpty()) {
                    errorMsg = "Missing ID for update.";
                } else if (sizeValue == null || sizeValue.trim().isEmpty()) {
                    errorMsg = "Size cannot be empty!";
                } else if (!sizeValue.matches("^([1-9][0-9]?)(\\.5)?$")) {
                    errorMsg = "Size must be a valid number (e.g., 7, 7.5, 38, or 38.5).";
                } else {
                    int id = Integer.parseInt(idStr);
                    if (dao.existsByValueExceptId(sizeValue.trim(), id)) {
                        errorMsg = "This size already exists!";
                    } else {
                        dao.update(id, sizeValue.trim());
                        successMsg = "Size updated successfully!";
                    }
                }
                break;
            }
            case "delete": {
                String idStr = req.getParameter("id");
                if (idStr == null || idStr.isEmpty()) {
                    errorMsg = "Missing ID for deletion.";
                } else {
                    dao.delete(Integer.parseInt(idStr));
                    successMsg = "Size deleted successfully!";
                }
                break;
            }
            default:
                errorMsg = "Invalid action!";
        }

        HttpSession session = req.getSession();
        if (errorMsg != null) {
            // Forward with error message
            List<ShoeSize> list = dao.getAll();
            req.setAttribute("listSize", list);
            session.setAttribute("err", errorMsg);
            req.getRequestDispatcher("/adminDashboard/size-shoes.jsp").forward(req, resp);
        } else {
            // Redirect with success message
            session.setAttribute("msg", successMsg);
            resp.sendRedirect(req.getContextPath() + "/shoessize");
        }
    }
}
