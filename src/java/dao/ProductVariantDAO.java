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
        ProductVariant p = new ProductVariant(6, 12, "yellow", 1, 10, "");
        System.out.println(b.updateVariant(p));
    }

    public List<ProductVariant> getAllProductVariant() {
        List<ProductVariant> pv = new ArrayList<>();
        String query = "SELECT pv.PV_ID, pv.Product_ID, pv.Color, pv.Size_ID, pv.Quantity, s.SizeValue "
                + "FROM Product_Variant pv "
                + "JOIN ShoeSize s ON pv.Size_ID = s.Size_ID";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductVariant p = new ProductVariant();
                p.setPv_id(rs.getInt("PV_ID"));
                p.setProduct_id(rs.getInt("Product_ID"));
                p.setColor(rs.getString("Color"));
                p.setSizeID(rs.getInt("Size_ID"));         // lưu Size_ID
                p.setSizeValue(rs.getString("SizeValue"));// lưu giá trị size (39, 40...)
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

    public List<ProductVariant> getVariantsByProductId(int productId) {
        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT * FROM [ShoesOnlineShop].[dbo].[Product_Variant] WHERE product_id = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductVariant variant = new ProductVariant();
                variant.setPv_id(rs.getInt("variant_id"));
                variant.setProduct_id(rs.getInt("product_id"));
                variant.setColor(rs.getString("color"));
                variant.setSize(rs.getInt("size"));
                variant.setQuantity(rs.getInt("quantity"));
                list.add(variant);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductVariant> getVariantByShoesName(int idProduct) {
        List<ProductVariant> pv = new ArrayList<>();
        String query = "SELECT pv.PV_ID, pv.Product_ID, pv.Color, pv.Size_ID, pv.Quantity, s.SizeValue "
                + "FROM Product_Variant pv "
                + "JOIN ShoeSize s ON pv.Size_ID = s.Size_ID "
                + "WHERE pv.Product_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, idProduct);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductVariant p = new ProductVariant();
                    p.setPv_id(rs.getInt("PV_ID"));
                    p.setProduct_id(rs.getInt("Product_ID"));
                    p.setColor(rs.getString("Color"));
                    p.setSizeID(rs.getInt("Size_ID"));
                    p.setSizeValue(rs.getString("SizeValue"));
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
            String query = "INSERT INTO [dbo].[Product_Variant] (Product_ID, Color, Size_ID, Quantity) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, padd.getProduct_id());
            ps.setString(2, padd.getColor());
            ps.setInt(3, padd.getSizeID());  // đây là Size_ID
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
        String query = "UPDATE [dbo].[Product_Variant] "
                + "SET Product_ID = ?, Color = ?, Size_ID = ?, Quantity = ? "
                + "WHERE PV_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, productVariant.getProduct_id());
            ps.setString(2, productVariant.getColor());
            ps.setInt(3, productVariant.getSizeID()); // Size_ID
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

    public int countProductVariant(String search) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product_Variant pv "
                + "JOIN ShoeSize s ON pv.Size_ID = s.Size_ID "
                + "JOIN Product p ON pv.Product_ID = p.Product_ID ";

        if (search != null && !search.isEmpty()) {
            sql += "WHERE p.ProductName LIKE ? OR pv.Color LIKE ? OR s.SizeValue LIKE ? ";
        }

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            if (search != null && !search.isEmpty()) {
                String like = "%" + search + "%";
                ps.setString(1, like);
                ps.setString(2, like);
                ps.setString(3, like);
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

    public List<ProductVariant> getProductVariantByPage(String search, int page, int pageSize) {
        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT pv.PV_ID, pv.Product_ID, pv.Color, pv.Size_ID, "
                + "s.SizeValue, pv.Quantity, p.ProductName "
                + "FROM Product_Variant pv "
                + "JOIN ShoeSize s ON pv.Size_ID = s.Size_ID "
                + "JOIN Product p ON pv.Product_ID = p.Product_ID ";

        if (search != null && !search.isEmpty()) {
            sql += "WHERE p.ProductName LIKE ? OR pv.Color LIKE ? OR s.SizeValue LIKE ? ";
        }

        sql += "ORDER BY pv.PV_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            int idx = 1;
            if (search != null && !search.isEmpty()) {
                String like = "%" + search + "%";
                ps.setString(idx++, like);
                ps.setString(idx++, like);
                ps.setString(idx++, like);
            }

            ps.setInt(idx++, (page - 1) * pageSize);
            ps.setInt(idx, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductVariant pv = new ProductVariant(
                        rs.getInt("PV_ID"),
                        rs.getInt("Product_ID"),
                        rs.getString("Color"),
                        rs.getInt("Size_ID"),
                        rs.getInt("Quantity"), rs.getString("SizeValue")
                );
                list.add(pv);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
