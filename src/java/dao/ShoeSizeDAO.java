package dao;

import entity.ShoeSize;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShoeSizeDAO {

    public List<ShoeSize> getAll() {
        List<ShoeSize> list = new ArrayList<>();
        String sql = "SELECT Size_ID, SizeValue FROM ShoeSize ";
        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new ShoeSize(rs.getInt("Size_ID"), rs.getString("SizeValue")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int insert(String sizeValue) {
        String sql = "INSERT INTO ShoeSize (SizeValue) VALUES (?)";
        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, sizeValue);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int update(int id, String sizeValue) {
        String sql = "UPDATE ShoeSize SET SizeValue=? WHERE Size_ID=?";
        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, sizeValue);
            ps.setInt(2, id);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int delete(int id) {
        String sql = "DELETE FROM ShoeSize WHERE Size_ID=?";
        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ShoeSize findById(int id) {
        String sql = "SELECT Size_ID, SizeValue FROM ShoeSize WHERE Size_ID=?";
        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()){
                if (rs.next()) {
                    return new ShoeSize(rs.getInt("Size_ID"), rs.getString("SizeValue"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /** Kiểm tra trùng SizeValue (thêm mới) */
    public boolean existsByValue(String sizeValue) {
        String sql = "SELECT 1 FROM ShoeSize WHERE SizeValue = ?";
        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, sizeValue);
            try (ResultSet rs = ps.executeQuery()){
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /** Kiểm tra trùng SizeValue (khi sửa), loại trừ chính nó */
    public boolean existsByValueExceptId(String sizeValue, int excludeId) {
        String sql = "SELECT 1 FROM ShoeSize WHERE SizeValue = ? AND Size_ID <> ?";
        try (Connection con = new DBContext().connection;
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, sizeValue);
            ps.setInt(2, excludeId);
            try (ResultSet rs = ps.executeQuery()){
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
