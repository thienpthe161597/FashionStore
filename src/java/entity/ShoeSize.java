package entity;

public class ShoeSize {
    private int sizeId;
    private String sizeValue;

    public ShoeSize() {}

    public ShoeSize(int sizeId, String sizeValue) {
        this.sizeId = sizeId;
        this.sizeValue = sizeValue;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public String getSizeValue() {
        return sizeValue;
    }

    public void setSizeValue(String sizeValue) {
        this.sizeValue = sizeValue;
    }
}
