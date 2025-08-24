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
    public int sizeID;
    public int quantity;
    public String sizeValue;

    public ProductVariant() {
    }

    public ProductVariant(int pv_id, int product_id, String color, int sizeID, int quantity, String sizeValue) {
        this.pv_id = pv_id;
        this.product_id = product_id;
        this.color = color;
        this.sizeID = sizeID;
        this.quantity = quantity;
        this.sizeValue = sizeValue;
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

    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSizeValue() {
        return sizeValue;
    }

    public void setSizeValue(String sizeValue) {
        this.sizeValue = sizeValue;
    }

    @Override
    public String toString() {
        return "ProductVarivant{" + "pv_id=" + pv_id + ", product_id=" + product_id + ", color=" + color + ", sizeid=" + sizeID + ", quantity=" + quantity + ",sizeValue" + sizeValue + '}';
    }

}
