/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Product {
    private int productID;
    private String productName;
    private int saleID;
    private int brandID;
    private Category cateID;
    private String thumbnail;
    private double price;
    private int total_quantity;
    private int status;
    private String description;
    private String briefInfomation;
    private int starRating;
    private int saleStatus;
    private int featured;

    public int getFeatured() {
        return featured;
    }

    public Product(int productID, String productName, int saleID, int brandID, Category cateID, String thumbnail, double price, int total_quantity, int status, String description, String briefInfomation, int starRating, int saleStatus, int featured, LocalDateTime createDate, LocalDateTime updateDate, int CampainID, double salePrice) {
        this.productID = productID;
        this.productName = productName;
        this.saleID = saleID;
        this.brandID = brandID;
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

    public void setFeatured(int featured) {
        this.featured = featured;
    }
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private int CampainID;
    private double salePrice;

    public Product(int productID, String productName, int saleID, int brandID, Category cateID, String thumbnail, double price, int total_quantity, int status, String description, String briefInfomation, int starRating, int saleStatus, LocalDateTime createDate, LocalDateTime updateDate, int CampainID, double salePrice) {
        this.productID = productID;
        this.productName = productName;
        this.saleID = saleID;
        this.brandID = brandID;
        this.cateID = cateID;
        this.thumbnail = thumbnail;
        this.price = price;
        this.total_quantity = total_quantity;
        this.status = status;
        this.description = description;
        this.briefInfomation = briefInfomation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.CampainID = CampainID;
        this.salePrice = salePrice;
    }

    public int getCampainID() {
        return CampainID;
    }

    public void setCampainID(int CampainID) {
        this.CampainID = CampainID;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }
    

    public Product() {
    }

    public Product(int productID, String productName, int saleID, int brandID, Category cateID, String thumbnail, double price, int total_quantity, int status, String description, String briefInfomation, int starRating, int saleStatus, int CampainID) {
        this.productID = productID;
        this.productName = productName;
        this.saleID = saleID;
        this.brandID = brandID;
        this.cateID = cateID;
        this.thumbnail = thumbnail;
        this.price = price;
        this.total_quantity = total_quantity;
        this.status = status;
        this.description = description;
        this.briefInfomation = briefInfomation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
        this.CampainID = CampainID;
    }

    public Product(int productID, String productName, int saleID, int brandID, Category cateID, String thumbnail, double price, int total_quantity, int status, String description, String briefInfomation, int starRating, int saleStatus, int CampainID, double salePrice) {
        this.productID = productID;
        this.productName = productName;
        this.saleID = saleID;
        this.brandID = brandID;
        this.cateID = cateID;
        this.thumbnail = thumbnail;
        this.price = price;
        this.total_quantity = total_quantity;
        this.status = status;
        this.description = description;
        this.briefInfomation = briefInfomation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
        this.CampainID = CampainID;
        this.salePrice = salePrice;
    }
    
public Product(int productID, String productName, int saleID, int brandID, Category cateID, String thumbnail, double price, int total_quantity, int status, String description, String briefInfomation, int starRating, int saleStatus, LocalDateTime createDate, LocalDateTime updateDate) {
        this.productID = productID;
        this.productName = productName;
        this.saleID = saleID;
        this.brandID = brandID;
        this.cateID = cateID;
        this.thumbnail = thumbnail;
        this.price = price;
        this.total_quantity = total_quantity;
        this.status = status;
        this.description = description;
        this.briefInfomation = briefInfomation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
        this.createDate = createDate;
        this.updateDate = updateDate;
       
    }
    public Product(int productID, String productName, int saleID, int brandID, Category cateID, String thumbnail, double price, int total_quantity, int status, String description, String briefInfomation, int starRating, int saleStatus, LocalDateTime createDate, LocalDateTime updateDate, int campainId) {
        this.productID = productID;
        this.productName = productName;
        this.saleID = saleID;
        this.brandID = brandID;
        this.cateID = cateID;
        this.thumbnail = thumbnail;
        this.price = price;
        this.total_quantity = total_quantity;
        this.status = status;
        this.description = description;
        this.briefInfomation = briefInfomation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.CampainID = campainId;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", saleID=" + saleID + ", brandID=" + brandID + ", cateID=" + cateID + ", thumbnail=" + thumbnail + ", price=" + price + ", total_quantity=" + total_quantity + ", status=" + status + ", description=" + description + ", briefInfomation=" + briefInfomation + ", starRating=" + starRating + ", saleStatus=" + saleStatus + ", createDate=" + createDate + ", updateDate=" + updateDate + ", CampainID=" + CampainID + ", salePrice=" + salePrice + '}';
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

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    

    
}
