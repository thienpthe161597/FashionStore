package entity;

public class ProductImage {
    private int imgId;
    private int productId;
    private String color;
    private String imgUrl;
    private boolean isMain;

    // Constructors
    public ProductImage() {}

    public ProductImage(int imgId, int productId, String color, String imgUrl, boolean isMain) {
        this.imgId = imgId;
        this.productId = productId;
        this.color = color;
        this.imgUrl = imgUrl;
        this.isMain = isMain;
    }

    // Getters and Setters
    public int getImgId() {
        return imgId;
    }

    public void setImgId(int imgId) {
        this.imgId = imgId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public boolean isMain() {
        return isMain;
    }

    public void setMain(boolean isMain) {
        this.isMain = isMain;
    }

    @Override
    public String toString() {
        return "ProductImage{" +
                "imgId=" + imgId +
                ", productId=" + productId +
                ", color='" + color + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", isMain=" + isMain +
                '}';
    }
}
