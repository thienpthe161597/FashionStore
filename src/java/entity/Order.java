
package entity;

import java.util.Date;

public class Order {
    private int orderId;
    private int userId;
    private double totalPrice;
    private Date createdAt;
    private String status;
    private String address;
    private String phone;

    // Constructors
    public Order() {}

    public Order(int userId, double totalPrice, Date createdAt, String status, String address, String phone) {
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.status = status;
        this.address = address;
        this.phone = phone;
    }

    public Order(int orderId, int userId, double totalPrice, Date createdAt, String status, String address, String phone) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.status = status;
        this.address = address;
        this.phone = phone;
    }
    
    
    
    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
}
