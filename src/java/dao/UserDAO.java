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
import java.util.ArrayList;
import java.util.List;

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
    
    public boolean create(User userAccount) {
        try {
            String query = "INSERT INTO [dbo].[User] (User_Name,Email,Password,Address,Phone,Role) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userAccount.getUser_Name());
            ps.setString(2, userAccount.getEmail());
            ps.setString(3, userAccount.getPassword());
            ps.setString(4, userAccount.getAddress());
            ps.setString(5, userAccount.getPhone());
            ps.setString(6, userAccount.getRole());

            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findUserById(int userId) {
        String query = "SELECT * FROM [dbo].[User] WHERE User_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Return null if no user is found or an error occurs
    }

    public boolean deleteUserById(int userId) {
        String query = "DELETE FROM [dbo].[User] WHERE User_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
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

    public List<User> getUsers(int start, int total) {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[User] ORDER BY User_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, start);
            ps.setInt(2, total);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User user = new User();
                    user.setUser_ID(rs.getInt("User_ID"));
                    user.setUser_Name(rs.getString("User_Name"));
                    user.setEmail(rs.getString("Email"));
                    user.setPassword(rs.getString("Password"));
                    user.setAddress(rs.getString("Address"));
                    user.setPhone(rs.getString("Phone"));
                    user.setRole(rs.getString("Role"));
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead of printing
        }
        return users;
    }

    public int getTotalUsers() {
        int count = 0;
        String countQuery = "SELECT COUNT(*) FROM [dbo].[User]";
        try (PreparedStatement preparedStatement = con.prepareStatement(countQuery)) {
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
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

    public List<User> searchUsers(String keyword) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[User] WHERE User_Name LIKE ? OR Email LIKE ? OR Address LIKE ?";

        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

            String searchKeyword = "%" + keyword + "%";
            preparedStatement.setString(1, searchKeyword);
            preparedStatement.setString(2, searchKeyword);
            preparedStatement.setString(3, searchKeyword);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUser_ID(rs.getInt("User_ID"));
                user.setUser_Name(rs.getString("User_Name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setRole(rs.getString("Role"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
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

    //minh code
    public User getUserById(int userId) {
        User userAccount = new User();
        String query = " select * from [dbo].[User] where User_ID = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
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
    
    public String getUserNameById(int userId) {
        String userName = "";
        String query = " select User_Name from [dbo].[User] where User_ID = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userName = rs.getString("User_Name");
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userName;
    }
}
