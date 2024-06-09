/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author 84976
 */
public class Blog {

    private int blogID;
    private String blogTitle;
    private String thumbnail;
    private String description;
    private LocalDateTime createDate;
    private int productID;
    private int status;
    private String brief_info;
    private String author;
    private int featured;

    
    private Category category;

    public Blog() {
    }

    public Blog(int blogID, String blogTitle, String thumbnail, String description, int productID, int status, String brief_info, String author, int featured, LocalDateTime createDate, Category category) {
        this.blogID = blogID;
        this.blogTitle = blogTitle;
        this.thumbnail = thumbnail;
        this.description = description;
        this.productID = productID;
        this.status = status;
        this.brief_info = brief_info;
        this.author = author;
        this.featured = featured;
        this.createDate = createDate;
        this.category = category;
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBrief_info() {
        return brief_info;
    }

    public void setBrief_info(String brief_info) {
        this.brief_info = brief_info;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogID=" + blogID + ", blogTitle=" + blogTitle + ", thumbnail=" + thumbnail + ", description=" + description + ", productID=" + productID + ", status=" + status + ", brief_info=" + brief_info + ", author=" + author + ", featured=" + featured + ", createDate=" + createDate + ", category=" + category + '}';
    }
    
    

   
       
}
