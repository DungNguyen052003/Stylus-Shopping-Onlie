/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author 84976
 */
public class FeedBack {
    private int id;
    private int customerID;
    private int productID;
    private Date createDate;
    private int rateStar;
    private String comment;
    private int status;
    private String customerName;
    private String feedbackImage;
    private String productName;
    public FeedBack() {
    }

    public FeedBack(int id, int customerID, int productID, Date createDate, int rateStar, String comment, int status) {
        this.id = id;
        this.customerID = customerID;
        this.productID = productID;
        this.createDate = createDate;
        this.rateStar = rateStar;
        this.comment = comment;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getFeedbackImage() {
        return feedbackImage;
    }

    public void setFeedbackImage(String feedbackImage) {
        this.feedbackImage = feedbackImage;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getRateStar() {
        return rateStar;
    }

    public void setRateStar(int rateStar) {
        this.rateStar = rateStar;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "id=" + id + ", customerID=" + customerID + ", productID=" + productID + ", createDate=" + createDate + ", rateStar=" + rateStar + ", comment=" + comment + ", status=" + status + ", customerName=" + customerName + ", feedbackImage=" + feedbackImage + ", productName=" + productName + '}';
    }
}
