/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;

    public static void main(String[] args) {
        UserDAO d = new UserDAO();
        User u = new User(6, "aaaaa", "aaaaa", "aaaaa");
        d.updateProfileUser(u);
        
    }

    public boolean registerAcc(User userAccount) {
        try {
            String query = "INSERT INTO [dbo].[User] (User_Name,Email,Password,Role) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userAccount.getUser_Name());
            ps.setString(2, userAccount.getEmail());
            ps.setString(3, userAccount.getPassword());
            ps.setString(4, userAccount.getRole());

            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkEmailExit(String email) {
        String query = "SELECT * FROM [dbo].[User] WHERE Email = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkLogin(User u) {
        String email = u.getEmail();
        String password = u.getPassword();
        String query = "SELECT * FROM [dbo].[User] WHERE Email = ? and Password = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUser(String email) {
        User userAccount = new User();
        String query = " select * from [dbo].[User] where Email = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userAccount.setUser_ID(rs.getInt("User_ID"));
                    userAccount.setUser_Name(rs.getString("User_Name"));
                    userAccount.setEmail(rs.getString("Email"));
                    userAccount.setPassword(rs.getString("Password"));
                    userAccount.setAddress(rs.getString("Address"));
                    userAccount.setPhone(rs.getString("Phone"));
                    userAccount.setRole(rs.getString("Role"));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userAccount;
    }

    public void resetPassword(User user) {
        String query = "UPDATE [dbo].[User] SET [Password] = ? WHERE Email = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getEmail());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProfileUser(User user) {
        String query = "UPDATE [dbo].[User] SET [User_Name] = ?,[Address] = ?,[Phone] = ? WHERE User_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getUser_Name());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getPhone());
            ps.setInt(4, user.getUser_ID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePassword(int user_ID, String new_pwd) {
        String query = "UPDATE [dbo].[User] SET [Password] = ? WHERE User_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, new_pwd);
            ps.setInt(2, user_ID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
