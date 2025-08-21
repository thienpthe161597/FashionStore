/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class ProductVariant {
    public int pv_id;
    public int product_id;
    public String color;
    public int size;
    public String sizeValue;
    public int quantity;

    public ProductVariant() {
    }

    public ProductVariant(int pv_id, int product_id, String color, int size, String sizeValue, int quantity) {
        this.pv_id = pv_id;
        this.product_id = product_id;
        this.color = color;
        this.size = size;
        this.sizeValue = sizeValue;
        this.quantity = quantity;
    }

    public int getPv_id() {
        return pv_id;
    }

    public void setPv_id(int pv_id) {
        this.pv_id = pv_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getSizeValue() {
        return sizeValue;
    }

    public void setSizeValue(String sizeValue) {
        this.sizeValue = sizeValue;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductVarivant{" + "pv_id=" + pv_id + ", product_id=" + product_id + ", color=" + color + ", size=" + size + ", sizeValue="+ sizeValue + ",quantity=" + quantity + '}';
    }


    
    
}
