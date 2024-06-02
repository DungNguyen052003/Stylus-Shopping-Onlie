package model;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
    private int orderId;
    private int customerId;
    private String fullName;
    private String phone;
    private String address;
    private Date orderDate;
    private String status;
    private BigDecimal totalAmount;
    private String productName;

 
    public Order() {
    }

    
    public Order(int orderId, int customerId, String fullName, String phone, String address, Date orderDate, String status, BigDecimal totalAmount, String productName) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.productName = productName;
    }

    // Constructor chỉ với các trường cần thiết
    public Order(int orderId, Date orderDate, String productName, BigDecimal totalAmount, String status) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.productName = productName;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
}
