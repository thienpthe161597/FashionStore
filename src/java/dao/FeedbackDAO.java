/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Feedback;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class FeedbackDAO {
    DBContext db = new DBContext();
    Connection con = db.connection;
    
    public List<Feedback> getFeedbackByProductId(int productId, int page, int pageSize) throws SQLException {
        List<Feedback> feedbackList = new ArrayList<>();
        String query = "SELECT * FROM Feedback WHERE Product_ID = ? ORDER BY Date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, productId);
            pstmt.setInt(2, (page - 1) * pageSize); // Calculate OFFSET
            pstmt.setInt(3, pageSize);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback(
                    rs.getInt("Feedback_ID"),
                    rs.getInt("User_ID"),
                    rs.getInt("Product_ID"),
                    rs.getInt("Rating"),
                    rs.getString("Comment"),
                    rs.getString("Date")
                );
                feedbackList.add(feedback);
            }
        }
        return feedbackList;
    }

    
    public boolean hasUserReviewed(int userId, int productId) throws SQLException {
        String query = "SELECT COUNT(*) FROM Feedback WHERE User_ID = ? AND Product_ID = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, productId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Returns true if count > 0 (user already reviewed)
            }
        }
        return false;
    }
    
    // Get the user's rating for a specific product
    public int getUserRating(int userId, int productId) {
        String sql = "SELECT rating FROM Feedback WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("rating");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Default to 0 if no rating found
    }
    
    public String getUserComment(int userId, int productId) {
        String sql = "SELECT comment FROM Feedback WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("comment");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ""; // Return empty string if no comment found
    }
    
    public void addOrUpdateFeedback(int userId, int productId, int rating, String comment) throws SQLException {
        if (hasUserReviewed(userId, productId)) {
            // If user already reviewed, update existing review
            String query = "UPDATE Feedback SET Rating = ?, Comment = ?, Date = GETDATE() WHERE User_ID = ? AND Product_ID = ?";
            try (PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setInt(1, rating);
                pstmt.setString(2, comment);
                pstmt.setInt(3, userId);
                pstmt.setInt(4, productId);
                pstmt.executeUpdate();
            }
        } else {
            // If no review exists, insert a new one
            String query = "INSERT INTO Feedback (User_ID, Product_ID, Rating, Comment, Date) VALUES (?, ?, ?, ?, GETDATE())";
            try (PreparedStatement pstmt = con.prepareStatement(query)) {
                pstmt.setInt(1, userId);
                pstmt.setInt(2, productId);
                pstmt.setInt(3, rating);
                pstmt.setString(4, comment);
                pstmt.executeUpdate();
            }
        }
    }

    
    public int getTotalFeedbacks(int productId) throws SQLException {
        String query = "SELECT COUNT(*) FROM Feedback WHERE Product_ID = ?";

        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        }
        return 0;
    }
    
    public double getAverageRating(int productId) {
        double avgRating = 0.0;
        String query = "SELECT AVG(CAST(Rating AS FLOAT)) FROM Feedback WHERE Product_ID = ?";

        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                avgRating = rs.getDouble(1);  // Retrieve the first column (AVG value)
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return avgRating;
    }

}
