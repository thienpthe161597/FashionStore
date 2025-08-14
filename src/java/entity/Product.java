/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Product {
    public int productID;          
    public int categoryID;         
    public int saleID;            
    public String productName;    
    public String description;     
    public int price;              
    public String gender;          
    public String image;           

    public Product() {
    }

    public Product(int productID, int categoryID, int saleID, String productName, String description, int price, String gender, String image) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.saleID = saleID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.gender = gender;
        this.image = image;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", categoryID=" + categoryID + ", saleID=" + saleID + ", productName=" + productName + ", description=" + description + ", price=" + price + ", gender=" + gender + ", image=" + image + '}';
    }
    
    
}

