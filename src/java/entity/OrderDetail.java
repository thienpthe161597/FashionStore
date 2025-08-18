/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

public class OrderDetail {
    private int orderDetailId;
    private int orderId;
    private int pvId;
    private double price;
    private int quantity;

    // Constructors
    public OrderDetail() {}

    public OrderDetail(int orderId, int pvId, double price, int quantity) {
        this.orderId = orderId;
        this.pvId = pvId;
        this.price = price;
        this.quantity = quantity;
    }

    
    
    public OrderDetail(int orderDetailId, int orderId, int pvId, double price, int quantity) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.pvId = pvId;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getPvId() {
        return pvId;
    }

    public void setPvId(int pvId) {
        this.pvId = pvId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
