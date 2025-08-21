package dao;

import entity.Blog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BlogDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;

    public List<Blog> getAllBlogs() {
        List<Blog> blogs = new ArrayList<>();
        String query = "SELECT * FROM Blogs ORDER BY CreatedAt DESC";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlog_ID(rs.getInt("BlogID"));
                blog.setUser_ID(rs.getInt("UserID"));
                blog.setTitle(rs.getString("Title"));
                blog.setContent(rs.getString("Content"));
                blog.setVisibility(rs.getString("Visibility"));
                blog.setCreatedAt(rs.getTimestamp("CreatedAt")); // dùng Timestamp để giữ thời gian đầy đủ
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public Blog getBlogByID(int blogID) {
        Blog blog = null;
        String query = "SELECT * FROM Blogs WHERE BlogID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, blogID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    blog = new Blog();
                    blog.setBlog_ID(rs.getInt("BlogID"));
                    blog.setUser_ID(rs.getInt("UserID"));
                    blog.setTitle(rs.getString("Title"));
                    blog.setContent(rs.getString("Content"));
                    blog.setVisibility(rs.getString("Visibility"));
                    blog.setCreatedAt(rs.getTimestamp("CreatedAt"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }

    public List<Blog> getBlogsByPage(int start, int total) {
        List<Blog> blogs = new ArrayList<>();
        String query = "SELECT * FROM Blogs ORDER BY CreatedAt DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, start);
            ps.setInt(2, total);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Blog blog = new Blog();
                    blog.setBlog_ID(rs.getInt("BlogID"));
                    blog.setUser_ID(rs.getInt("UserID"));
                    blog.setTitle(rs.getString("Title"));
                    blog.setContent(rs.getString("Content"));
                    blog.setVisibility(rs.getString("Visibility"));
                    blog.setCreatedAt(rs.getTimestamp("CreatedAt"));
                    blogs.add(blog);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public int getTotalBlogCount() {
        String query = "SELECT COUNT(*) FROM Blogs";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
