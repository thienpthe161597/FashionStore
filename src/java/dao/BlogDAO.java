/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Blog;
import entity.BlogImage;
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
public class BlogDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;
    public static void main(String[] args) {
        BlogDAO b = new BlogDAO();
        System.out.println(b.getBlogImgByID(1));
    }
    public List<Blog> getAllBlog() {
        List<Blog> blog = new ArrayList<>();
        String query = "select * from Blog ";
        try (PreparedStatement ps = con.prepareStatement(query); 
        ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_ID(rs.getInt("Blog_ID"));
                b.setBlog_Name(rs.getString("Blog_Name"));
                b.setDescription(rs.getString("Description"));
                b.setImage(rs.getString("Image"));
                blog.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }
    public List<BlogImage> getAllBlogImg() {
        List<BlogImage> blog = new ArrayList<>();
        String query = "select * from Blog_Img ";
        try (PreparedStatement ps = con.prepareStatement(query); 
        ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                BlogImage b = new BlogImage();
                b.setBlog_IMG_ID(rs.getInt("Blog_IMG_ID"));
                b.setBlog_ID(rs.getInt("Blog_ID"));
                b.setImage_URL(rs.getString("Image_URL"));
                blog.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }

    public Blog getBlogByID(int blogID) {
        Blog blog = new Blog();
        String query = " select * from [dbo].[Blog] where Blog_ID = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, blogID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    blog.setBlog_ID(rs.getInt("Blog_ID"));
                    blog.setBlog_Name(rs.getString("Blog_Name"));
                    blog.setDescription(rs.getString("Description"));
                    blog.setImage(rs.getString("Image"));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }

    public BlogImage getBlogImgByID(int blogID) {
        BlogImage blog = new BlogImage();
        String query = " select * from [dbo].[Blog_Img] where Blog_ID = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, blogID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    blog.setBlog_IMG_ID(rs.getInt("Blog_IMG_ID"));
                    blog.setBlog_ID(rs.getInt("Blog_ID"));
                    blog.setImage_URL(rs.getString("Image_URL"));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }
}
