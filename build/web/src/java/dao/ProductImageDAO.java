/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Category;
import entity.ProductImage;
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
public class ProductImageDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;

    public static void main(String[] args) {
        ProductImageDAO b = new ProductImageDAO();
        System.out.println(b.addImageInShoes(12,"a"));
    }

    public List<ProductImage> getAllProductImage() {
        List<ProductImage> pi = new ArrayList<>();
        String query = "select * from Shoes_Image ";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductImage p = new ProductImage();
                p.setImg_id(rs.getInt("ImgID"));
                p.setPv_id(rs.getInt("PV_ID"));
                p.setImage_url(rs.getString("ImgURL"));
                p.setIsMain(rs.getInt("isMain"));
                pi.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pi;
    }

    public boolean addNewImageForVariant(ProductImage i) {
        try {
            String query = "INSERT INTO [dbo].[Shoes_Image] (PV_ID, ImgURL, isMain) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, i.getPv_id());
            ps.setString(2, i.getImage_url());
            ps.setInt(3, i.getIsMain());
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteAllImage(int id) {
        String query = "DELETE FROM [dbo].[Shoes_Image] WHERE PV_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean add404Image(int id) {
        try {
            String query = "INSERT INTO [dbo].[Shoes_Image] (PV_ID, ImgURL, isMain) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, "assets/img/404.jpg");
            ps.setInt(3, 1);
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addImageInShoes(int id,String url) {
        try {
            String query = "UPDATE [dbo].[Product] SET [Image] = ? WHERE Product_ID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, url);
            ps.setInt(2, id);
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteImageInShoes(int product_id) {
        String query = "UPDATE [dbo].[Product] SET [Image] = ? WHERE Product_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, "");
            ps.setInt(2, product_id);
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
