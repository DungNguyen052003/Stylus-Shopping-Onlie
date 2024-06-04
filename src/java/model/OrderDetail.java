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

import java.math.BigDecimal;
import java.util.Date;


   public class OrderDetail {
    private int orderID;
    private Date orderDate;
    private BigDecimal totalAmount;
    private String status;
    private String fullName;
    private String gender;
    private String email;
    private String phone;
    private int quantity;
    private BigDecimal price;
    private BigDecimal totalPrice;
    private int productID;
    private int sizeID;
    private int colorID;
    private int productQuantity;
    private String productName;
    private int cateID;
    private String productCategory;
    private String productThumbnail;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, Date orderDate, BigDecimal totalAmount, String status, String fullName, String gender, String email, String phone, int quantity, BigDecimal price, BigDecimal totalPrice, int productID, int sizeID, int colorID, int productQuantity, String productName, int cateID, String productCategory, String productThumbnail) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
        this.productID = productID;
        this.sizeID = sizeID;
        this.colorID = colorID;
        this.productQuantity = productQuantity;
        this.productName = productName;
        this.cateID = cateID;
        this.productCategory = productCategory;
        this.productThumbnail = productThumbnail;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public int getColorID() {
        return colorID;
    }

    public void setColorID(int colorID) {
        this.colorID = colorID;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductThumbnail() {
        return productThumbnail;
    }

    public void setProductThumbnail(String productThumbnail) {
        this.productThumbnail = productThumbnail;
    }

    
    
    
}


  

    


