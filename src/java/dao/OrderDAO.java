/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Order;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;

    public void insertOrder(Order order) throws SQLException {
        String query = "INSERT INTO Orders (User_ID, TotalPrice, Created_At, Status, Address, Phone) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query, java.sql.Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, order.getUserId());
            stmt.setDouble(2, order.getTotalPrice());
            stmt.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis())); // Better to use SQL Timestamp
            stmt.setString(4, order.getStatus());
            stmt.setString(5, order.getAddress());
            stmt.setString(6, order.getPhone());
            stmt.executeUpdate();
        }
    }

    public int getOrderId() throws SQLException {
        int orderId = -1;
        String query = "SELECT IDENT_CURRENT('Orders') AS LastID"; // Gets last inserted ID
        try (PreparedStatement stmt = con.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                orderId = rs.getInt("LastID");
            }
        }
        return orderId;
    }

    public List<Order> getOrdersByUserId(int userId, int page, int pageSize) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE User_ID = ? ORDER BY Created_At DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, (page - 1) * pageSize);
            stmt.setInt(3, pageSize);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("Order_ID");
                int userID = rs.getInt("User_ID");
                double totalPrice = rs.getDouble("TotalPrice");
                Date createdAt = rs.getTimestamp("Created_At");
                String status = rs.getString("Status");
                String address = rs.getString("Address");
                String phone = rs.getString("Phone");

                orders.add(new Order(orderId, userID, totalPrice, new java.util.Date(rs.getTimestamp("Created_At").getTime()), status, address, phone));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return orders;
    }
    
    public int getTotalOrdersCount(int userId) throws SQLException {
        String query = "SELECT COUNT(*) FROM Orders WHERE User_ID = ?";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public List<Order> getAllOrder() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders ORDER BY Created_At DESC";
        con = DBContext.getConnection();

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("Order_ID");
                int userID = rs.getInt("User_ID");
                double totalPrice = rs.getDouble("TotalPrice");
                Date createdAt = rs.getTimestamp("Created_At");
                String status = rs.getString("Status");
                String address = rs.getString("Address");
                String phone = rs.getString("Phone");

                orders.add(new Order(orderId, userID, totalPrice, new java.util.Date(rs.getTimestamp("Created_At").getTime()), status, address, phone));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return orders;
    }

    public boolean cancelOrder(int orderId) {
    PreparedStatement updateOrderStmt = null;

    try {
        con.setAutoCommit(false);

        String updateOrderSQL = "UPDATE Orders SET Status = 'Cancelled' WHERE Order_ID = ?";
        updateOrderStmt = con.prepareStatement(updateOrderSQL);
        updateOrderStmt.setInt(1, orderId);
        int updatedRows = updateOrderStmt.executeUpdate();

        if (updatedRows > 0) {
            con.commit();
            return true;
        } else {
            con.rollback();
            return false;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        if (con != null) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    } finally {
        try {
            if (updateOrderStmt != null) {
                updateOrderStmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

    public boolean updateOrder(int orderId, String status) {
        PreparedStatement updateOrderStmt = null;

        try {
            con.setAutoCommit(false);

            String updateOrderSQL = "UPDATE Orders SET Status = ? WHERE Order_ID = ?";
            updateOrderStmt = con.prepareStatement(updateOrderSQL);
            updateOrderStmt.setInt(2, orderId);
            updateOrderStmt.setString(1, status);

            int updatedRows = updateOrderStmt.executeUpdate();

            if (updatedRows > 0) {
                con.commit();
                return true;
            } else {
                con.rollback();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            try {
                if (updateOrderStmt != null) {
                    updateOrderStmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
  public double getTotalRevenue() {
    double revenue = 0;
    String sql = "SELECT SUM(TotalAmount) FROM [Order]"; // thay TotalAmount bằng cột doanh thu
    try {
        Connection conn = DBContext.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            revenue = rs.getDouble(1);
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return revenue;
}



}
