/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class BlogImage {
    public int Blog_IMG_ID;
    public int Blog_ID;
    public String Image_URL;

    public BlogImage() {
    }

    public BlogImage(int Blog_IMG_ID, int Blog_ID, String Image_URL) {
        this.Blog_IMG_ID = Blog_IMG_ID;
        this.Blog_ID = Blog_ID;
        this.Image_URL = Image_URL;
    }

    public int getBlog_IMG_ID() {
        return Blog_IMG_ID;
    }

    public void setBlog_IMG_ID(int Blog_IMG_ID) {
        this.Blog_IMG_ID = Blog_IMG_ID;
    }

    public int getBlog_ID() {
        return Blog_ID;
    }

    public void setBlog_ID(int Blog_ID) {
        this.Blog_ID = Blog_ID;
    }

    public String getImage_URL() {
        return Image_URL;
    }

    public void setImage_URL(String Image_URL) {
        this.Image_URL = Image_URL;
    }

    @Override
    public String toString() {
        return "BlogImage{" + "Blog_IMG_ID=" + Blog_IMG_ID + ", Blog_ID=" + Blog_ID + ", Image_URL=" + Image_URL + '}';
    }

    
    
    
}
