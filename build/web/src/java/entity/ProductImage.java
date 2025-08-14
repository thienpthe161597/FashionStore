/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class ProductImage {
    public int img_id;
    public int pv_id;
    public String image_url;
    public int isMain;

    public ProductImage() {
    }

    public ProductImage(int img_id, int pv_id, String image_url, int isMain) {
        this.img_id = img_id;
        this.pv_id = pv_id;
        this.image_url = image_url;
        this.isMain = isMain;
    }

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public int getPv_id() {
        return pv_id;
    }

    public void setPv_id(int pv_id) {
        this.pv_id = pv_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getIsMain() {
        return isMain;
    }

    public void setIsMain(int isMain) {
        this.isMain = isMain;
    }

    @Override
    public String toString() {
        return "ProductImage{" + "img_id=" + img_id + ", pv_id=" + pv_id + ", image_url=" + image_url + ", isMain=" + isMain + '}';
    }
    
    
    
}
