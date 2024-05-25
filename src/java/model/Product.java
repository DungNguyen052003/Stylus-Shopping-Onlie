/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author ngock
 */
public class Product {
    private int productID;
    private String productName;
    private int saleID;
    private int brandID;
   
    private int cateID;
    private String thumbNail;
    private BigDecimal price;
    private int totalQuantity;
    private boolean status;
    private String description;
    private String briefInformation;
    private int starRating;
    private boolean saleStatus;

    public Product() {
    }

    public Product(int productID, String productName, int saleID, int brandID, int cateID, String thumbNail, BigDecimal price, int totalQuantity, boolean status, String description, String briefInformation, int starRating, boolean saleStatus) {
        this.productID = productID;
        this.productName = productName;
        this.saleID = saleID;
        this.brandID = brandID;
        this.cateID = cateID;
        this.thumbNail = thumbNail;
        this.price = price;
        this.totalQuantity = totalQuantity;
        this.status = status;
        this.description = description;
        this.briefInformation = briefInformation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
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

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getThumbNail() {
        return thumbNail;
    }

    public void setThumbNail(String thumbNail) {
        this.thumbNail = thumbNail;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBriefInformation() {
        return briefInformation;
    }

    public void setBriefInformation(String briefInformation) {
        this.briefInformation = briefInformation;
    }

    public int getStarRating() {
        return starRating;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public boolean isSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(boolean saleStatus) {
        this.saleStatus = saleStatus;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", saleID=" + saleID + ", brandID=" + brandID + ", cateID=" + cateID + ", thumbNail=" + thumbNail + ", price=" + price + ", totalQuantity=" + totalQuantity + ", status=" + status + ", description=" + description + ", briefInformation=" + briefInformation + ", starRating=" + starRating + ", saleStatus=" + saleStatus + '}';
    }
    
    

    
    
    
}

  