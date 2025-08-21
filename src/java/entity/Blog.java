/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Blog {
    public int blog_ID;
    public int user_ID;
    public String title;
    public String content;
    public String visibility;
    public Date createdAt;

    public Blog() {
    }

    public Blog(int blog_ID, int user_ID, String title, String content, String visibility, Date createAt) {
        this.blog_ID = blog_ID;
        this.user_ID = user_ID;
        this.title = title;
        this.content = content;
        this.visibility = visibility;
        this.createdAt = createAt;
    }

    public int getBlog_ID() {
        return blog_ID;
    }

    public int getUser_ID() {
        return user_ID;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getVisibility() {
        return visibility;
    }

    public Date getCreateAt() {
        return createdAt;
    }

    public void setBlog_ID(int blog_ID) {
        this.blog_ID = blog_ID;
    }

    public void setUser_ID(int user_ID) {
        this.user_ID = user_ID;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setVisibility(String visibility) {
        this.visibility = visibility;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Blog{" + "blog_ID=" + blog_ID + ", user_ID=" + user_ID + ", title=" + title + ", content=" + content + ", visibility=" + visibility + ", createAt=" + createdAt + '}';
    }
}
