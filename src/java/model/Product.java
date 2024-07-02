/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;

/**
 *
 * @author ASUS
 */
public class Product {

    private int productID;
    private String productName;
    private int marketerID;
    private Brand brand;
    private Category cateID;
    private String thumbnail;
    private BigDecimal price;
    private int total_quantity;
    private int status;
    private String description;
    private String briefInfomation;
    private int starRating;
    private int saleStatus;
    private int featured;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private int CampainID;
    private BigDecimal salePrice;

    public Product() {
    }

    public Product(int productID, String productName, int marketerID, Brand brandID, Category cateID, String thumbnail, BigDecimal price, int total_quantity, int status, String description, String briefInfomation, int starRating, int saleStatus, int featured, LocalDateTime createDate, LocalDateTime updateDate, int CampainID, BigDecimal salePrice) {
        this.productID = productID;
        this.productName = productName;
        this.marketerID = marketerID;
        this.brand = brandID;
        this.cateID = cateID;
        this.thumbnail = thumbnail;
        this.price = price;
        this.total_quantity = total_quantity;
        this.status = status;
        this.description = description;
        this.briefInfomation = briefInfomation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
        this.featured = featured;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.CampainID = CampainID;
        this.salePrice = salePrice;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getMarketerID() {
        return marketerID;
    }

    public void setMarketerID(int marketerID) {
        this.marketerID = marketerID;
    }

    public Brand getBrandID() {
        return brand;
    }

    public void setBrandID(Brand brandID) {
        this.brand = brandID;
    }

    public Category getCateID() {
        return cateID;
    }

    public void setCateID(Category cateID) {
        this.cateID = cateID;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getTotal_quantity() {
        return total_quantity;
    }

    public void setTotal_quantity(int total_quantity) {
        this.total_quantity = total_quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBriefInfomation() {
        return briefInfomation;
    }

    public void setBriefInfomation(String briefInfomation) {
        this.briefInfomation = briefInfomation;
    }

    public int getStarRating() {
        return starRating;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public int getSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(int saleStatus) {
        this.saleStatus = saleStatus;
    }

    public int getFeatured() {
        return featured;
    }

    public void setFeatured(int featured) {
        this.featured = featured;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public LocalDateTime getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(LocalDateTime updateDate) {
        this.updateDate = updateDate;
    }

    public int getCampainID() {
        return CampainID;
    }

    public void setCampainID(int CampainID) {
        this.CampainID = CampainID;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price.setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal price, int discount) {
        BigDecimal discountPercentage = BigDecimal.valueOf(discount);
        BigDecimal discountAmount = price.multiply(discountPercentage).divide(BigDecimal.valueOf(100));
        BigDecimal salePrice = price.subtract(discountAmount);
        this.salePrice = salePrice.setScale(2, RoundingMode.HALF_UP);;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", marketerID=" + marketerID + ", brand=" + brand + ", cateID=" + cateID + ", thumbnail=" + thumbnail + ", price=" + price + ", total_quantity=" + total_quantity + ", status=" + status + ", description=" + description + ", briefInfomation=" + briefInfomation + ", starRating=" + starRating + ", saleStatus=" + saleStatus + ", featured=" + featured + ", createDate=" + createDate + ", updateDate=" + updateDate + ", CampainID=" + CampainID + ", salePrice=" + salePrice + '}';
    }

}
