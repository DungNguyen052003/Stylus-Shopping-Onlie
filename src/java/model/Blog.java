/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ngock
 */
public class Blog {
    private int blogID;
    private String blogTitle;
    private String thumbNail;
    private String description;
    private Date createDate;
    private int productID;
    private boolean status;
    private String briefInformation;
    private String author;
    private boolean featured;

    public Blog() {
    }

    public Blog(int blogID, String blogTitle, String thumbNail, String description, Date createDate, int productID, boolean status, String briefInformation, String author, boolean featured) {
        this.blogID = blogID;
        this.blogTitle = blogTitle;
        this.thumbNail = thumbNail;
        this.description = description;
        this.createDate = createDate;
        this.productID = productID;
        this.status = status;
        this.briefInformation = briefInformation;
        this.author = author;
        this.featured = featured;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getThumbNail() {
        return thumbNail;
    }

    public void setThumbNail(String thumbNail) {
        this.thumbNail = thumbNail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getBriefInformation() {
        return briefInformation;
    }

    public void setBriefInformation(String briefInformation) {
        this.briefInformation = briefInformation;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }
    
}
