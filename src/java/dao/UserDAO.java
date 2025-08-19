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
        
        UserDAO dao = new UserDAO();
        List<User> users = dao.getAllUsers();
        for (User user : users) {
            System.out.println(
                "ID: " + user.getUser_Name() +
                ", Email: " + user.getEmail() +
                ", Password: " + user.getPassword() +
                ", Role: " + user.getRole()
            );
        }
        
    }
    
    public List<User> getAllUsers() {
    List<User> list = new ArrayList<>();
    String sql = "SELECT * FROM [User]";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            User u = new User();
            u.setUser_ID(rs.getInt("User_ID"));
            u.setUser_Name(rs.getString("User_Name"));
            u.setEmail(rs.getString("Email"));
            u.setPassword(rs.getString("Password"));
            u.setAddress(rs.getString("Address"));
            u.setPhone(rs.getString("Phone"));
            u.setRole(rs.getString("Role"));
            list.add(u);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}


    public boolean registerAcc(User userAccount) {
        try {
            String query = "INSERT INTO [dbo].[User] (User_Name, Email, Password, Role, Created_At) VALUES (?,?,?,?,GETDATE())";
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
        String query = "SELECT * FROM [dbo].[User] WHERE Email = ?";
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
                    userAccount.setCreated_At(rs.getTimestamp("Created_At"));
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
        String query = "UPDATE [dbo].[User] SET [User_Name] = ?, [Address] = ?, [Phone] = ? WHERE User_ID = ?";
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
