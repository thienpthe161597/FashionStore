/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Blog;
import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;

    public static void main(String[] args) {
        CategoryDAO b = new CategoryDAO();
        System.out.println(b.getAllCategory());
    }

    public List<Category> getAllCategory() {
        List<Category> category = new ArrayList<>();
        String query = "select * from Category ";
        try (PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("Category_ID"));
                c.setCategoryName(rs.getString("Category_Name"));
                category.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public boolean addNewCate(String nameCate) {
         try {
            String query = "INSERT INTO [dbo].[Category] (Category_Name) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nameCate);
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCate(int id) {
        String query = "DELETE FROM [dbo].[Category] WHERE Category_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
     public Category getCategoryByName(String nameCate) {
        Category category = new Category();
        String query = " select * from [dbo].[Category] where Category_Name = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nameCate);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    category.setCategoryID(rs.getInt("Category_ID"));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }
     
     // Minh Codes
     
     public List<Category> getAllCategories() throws SQLException {
        List<Category> categoryList = new ArrayList<>();
        String query = "SELECT * FROM Category";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int categoryId = resultSet.getInt("Category_ID");
                String name = resultSet.getString("Category_Name");

                categoryList.add(new Category(categoryId,name));
            }
        }
        return categoryList;
    }
}
