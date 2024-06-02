/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngock
 */
import java.math.BigDecimal;
import java.util.Date;

public class Product {
    private int productId;
    private String productName;
    private int saleId;
    private int brandId;
    private int cateId;
    private String thumbnail;
    private BigDecimal price;
    private int totalQuantity;
    private boolean status;
    private String description;
    private String briefInformation;
    private int starRating;
    private boolean saleStatus;
    private boolean featured;
    private int campainId;
    private Date createDate;
    private Date updateDate;

    // Constructors
    public Product() {
    }

    public Product(String productName, int saleId, int brandId, int cateId, String thumbnail, BigDecimal price, int totalQuantity, boolean status, String description, String briefInformation, int starRating, boolean saleStatus, boolean featured, int campainId, Date createDate, Date updateDate) {
        this.productName = productName;
        this.saleId = saleId;
        this.brandId = brandId;
        this.cateId = cateId;
        this.thumbnail = thumbnail;
        this.price = price;
        this.totalQuantity = totalQuantity;
        this.status = status;
        this.description = description;
        this.briefInformation = briefInformation;
        this.starRating = starRating;
        this.saleStatus = saleStatus;
        this.featured = featured;
        this.campainId = campainId;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    // Getters and Setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
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

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }

    public int getCampainId() {
        return campainId;
    }

    public void setCampainId(int campainId) {
        this.campainId = campainId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
