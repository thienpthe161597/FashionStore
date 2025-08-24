/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {
    DBContext db = new DBContext();
    Connection con = db.connection;
    
    public void insertOrderDetail(OrderDetail orderDetail) throws SQLException {
    String query = "INSERT INTO Order_Details (Order_ID, PV_ID, Price, Quantity) VALUES (?, ?, ?, ?)";

    try (PreparedStatement stmt = con.prepareStatement(query)) {
        stmt.setInt(1, orderDetail.getOrderId());
        stmt.setInt(2, orderDetail.getPvId());
        stmt.setDouble(3, orderDetail.getPrice());
        stmt.setInt(4, orderDetail.getQuantity());

        int rowsInserted = stmt.executeUpdate();  // 🔥 Use executeUpdate() instead of executeQuery()
        
        if (rowsInserted <= 0) {
            throw new SQLException("Failed to insert order detail");
        }
    } catch (SQLException e) {
        System.out.println("Error inserting order detail: " + e.getMessage());
        e.printStackTrace();
        throw e;
    }
}

    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM Order_Details WHERE Order_ID = ?";
        
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    OrderDetail detail = new OrderDetail(
                        rs.getInt("Order_ID"),
                        rs.getInt("PV_ID"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity")
                    );
                    orderDetails.add(detail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

}
