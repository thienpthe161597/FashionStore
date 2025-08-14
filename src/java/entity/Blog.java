/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Blog {
    public int Blog_ID;
    public String Blog_Name;
    public String Image;
    public String Description;

    public Blog() {
    }

    public Blog(int Blog_ID, String Blog_Name, String Image, String Description) {
        this.Blog_ID = Blog_ID;
        this.Blog_Name = Blog_Name;
        this.Image = Image;
        this.Description = Description;
    }

    public int getBlog_ID() {
        return Blog_ID;
    }

    public void setBlog_ID(int Blog_ID) {
        this.Blog_ID = Blog_ID;
    }

    public String getBlog_Name() {
        return Blog_Name;
    }

    public void setBlog_Name(String Blog_Name) {
        this.Blog_Name = Blog_Name;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "BlogImage{" + "Blog_ID=" + Blog_ID + ", Blog_Name=" + Blog_Name + ", Image=" + Image + ", Description=" + Description + '}';
    }
}
