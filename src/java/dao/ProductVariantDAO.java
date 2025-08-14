/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Category;
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
public class ProductVariantDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;

    public static void main(String[] args) {
        ProductVariantDAO b = new ProductVariantDAO();
        ProductVariant p = new ProductVariant(6, 12, "yellow", 1, 10);
        System.out.println(b.updateVariant(p));
    }

    public List<ProductVariant> getAllProductVariant() {
        List<ProductVariant> pv = new ArrayList<>();
        String query = "select * from Product_Variant ";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductVariant p = new ProductVariant();
                p.setPv_id(rs.getInt("PV_ID"));
                p.setProduct_id(rs.getInt("Product_ID"));
                p.setColor(rs.getString("Color"));
                p.setSize(rs.getInt("Size"));
                p.setQuantity(rs.getInt("Quantity"));
                pv.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pv;
    }

    public ProductVariant getProductVariantByID(int pvid) {
        ProductVariant pv = new ProductVariant();
        String query = " select * from [dbo].[Product_Variant] where PV_ID = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, pvid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    pv.setProduct_id(rs.getInt("Product_ID"));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pv;
    }

    public List<ProductVariant> getVariantByShoesName(int idProduct) {
        List<ProductVariant> pv = new ArrayList<>();
        String query = " select * from [dbo].[Product_Variant] where Product_ID = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, idProduct);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductVariant p = new ProductVariant();
                    p.setPv_id(rs.getInt("PV_ID"));
                    p.setProduct_id(rs.getInt("Product_ID"));
                    p.setColor(rs.getString("Color"));
                    p.setSize(rs.getInt("Size"));
                    p.setQuantity(rs.getInt("Quantity"));
                    pv.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pv;
    }

    public boolean addNewVariant(ProductVariant padd) {
        try {
            String query = "INSERT INTO [dbo].[Product_Variant] (Product_ID,Color,Size,"
                    + "Quantity) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, padd.getProduct_id());
            ps.setString(2, padd.getColor());
            ps.setInt(3, padd.getSize());
            ps.setInt(4, padd.getQuantity());
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getLastVariant() {
        ProductVariant pv = new ProductVariant();
        String query = "SELECT [PV_ID]\n"
                + "FROM [ShoesOnlineShop].[dbo].[Product_Variant]\n"
                + "ORDER BY PV_ID DESC\n"
                + "OFFSET 0 ROWS\n"
                + "FETCH NEXT 1 ROWS ONLY;";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    pv.setPv_id(rs.getInt("PV_ID"));
                } else {
                    return 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pv.getPv_id();
    }

    public boolean add404ToNewVariant(int pvid) {
        try {
            String query = "INSERT INTO [dbo].[Shoes_Image] (PV_ID, ImgURL, isMain) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pvid);
            ps.setString(2, "assets/img/404.jpg");
            ps.setInt(3, 1);
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateVariant(ProductVariant productVariant) {
        String query = "UPDATE [dbo].[Product_Variant]\n"
                + "SET \n"
                + "    [Product_ID] = ?, \n"
                + "    [Color] = ?, \n"
                + "    [Size] = ?, \n"
                + "    [Quantity] = ? \n"
                + "WHERE [PV_ID] = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, productVariant.getProduct_id());
            ps.setString(2, productVariant.getColor());
            ps.setInt(3, productVariant.getSize());
            ps.setInt(4, productVariant.getQuantity());
            ps.setInt(5, productVariant.getPv_id());
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteVariant(int id) {
        String query = "Delete from [dbo].[Product_Variant]\n"
                + "WHERE [PV_ID] = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
