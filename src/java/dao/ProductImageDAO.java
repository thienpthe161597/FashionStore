/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Category;
import entity.ProductImage;
import entity.ProductVariant;
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
    public int countVariant(String productName, String color) {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT pv.Pv_id) "
                   + "FROM Product_Variant pv "
                   + "JOIN Product p ON pv.Product_ID = p.Product_ID ";

        List<String> conditions = new ArrayList<>();
        if (productName != null && !productName.isEmpty()) {
            conditions.add("p.ProductName LIKE ?");
        }
        if (color != null && !color.isEmpty()) {
            conditions.add("pv.Color LIKE ?");
        }
        if (!conditions.isEmpty()) {
            sql += " WHERE " + String.join(" AND ", conditions);
        }

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            int idx = 1;
            if (productName != null && !productName.isEmpty()) {
                ps.setString(idx++, "%" + productName + "%");
            }
            if (color != null && !color.isEmpty()) {
                ps.setString(idx++, "%" + color + "%");
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<ProductVariant> getVariantByPage(String productName, String color, int page, int pageSize, String sort) {
        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT pv.* FROM Product_Variant pv "
                   + "JOIN Product p ON pv.Product_ID = p.Product_ID ";

        List<String> conditions = new ArrayList<>();
        if (productName != null && !productName.isEmpty()) {
            conditions.add("p.ProductName LIKE ?");
        }
        if (color != null && !color.isEmpty()) {
            conditions.add("pv.Color LIKE ?");
        }
        if (!conditions.isEmpty()) {
            sql += " WHERE " + String.join(" AND ", conditions);
        }

        // sort
        if ("color".equalsIgnoreCase(sort)) {
            sql += " ORDER BY pv.Color ASC ";
        } else {
            sql += " ORDER BY pv.Pv_id DESC ";
        }

        // paging
        sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            int idx = 1;
            if (productName != null && !productName.isEmpty()) {
                ps.setString(idx++, "%" + productName + "%");
            }
            if (color != null && !color.isEmpty()) {
                ps.setString(idx++, "%" + color + "%");
            }
            ps.setInt(idx++, (page - 1) * pageSize);
            ps.setInt(idx++, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductVariant pv = new ProductVariant();
                pv.setPv_id(rs.getInt("Pv_id"));
                pv.setProduct_id(rs.getInt("Product_ID"));
                pv.setColor(rs.getString("Color"));
                pv.setSizeID(rs.getInt("Size_ID"));
                pv.setQuantity(rs.getInt("Quantity"));
                list.add(pv);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

