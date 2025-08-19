package entity;

import java.time.LocalDateTime;

public class BlogDTO {
    private String blogID;  // Định nghĩa kiểu dữ liệu cho BlogID
    private String userID;  // Định nghĩa kiểu dữ liệu cho UserID
    private String title;  // Định nghĩa kiểu dữ liệu cho Title
    private String content;  // Định nghĩa kiểu dữ liệu cho Content
    private String visibility;  // Định nghĩa kiểu dữ liệu cho Visibility
    private LocalDateTime createdAt;  // Định nghĩa kiểu dữ liệu cho CreatedAt

    public BlogDTO(String blogID, String userID, String title, String content, String visibility, LocalDateTime createdAt) {
        this.blogID = blogID;
        this.userID = userID;
        this.title = title;
        this.content = content;
        this.visibility = visibility;
        this.createdAt = createdAt;
    }

    public String getBlogID() {
        return blogID;
    }

    public void setBlogID(String blogID) {
        this.blogID = blogID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getVisibility() {
        return visibility;
    }

    public void setVisibility(String visibility) {
        this.visibility = visibility;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
