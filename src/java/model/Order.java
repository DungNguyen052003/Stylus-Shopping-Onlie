package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Order {
    private int orderId;
    private int customerId;
    private String fullName;
    private String phone;
    private String address;
    private LocalDateTime orderDate;
    private int status;
    private BigDecimal totalAmount;
    private String productName;
    private int countOtherproduct;

    public Order() {
    }

    public Order(int orderId, int customerId, String fullName, String phone, String address, LocalDateTime orderDate, int status, BigDecimal totalAmount, String productName, int countOtherproduct) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.productName = productName;
        this.countOtherproduct = countOtherproduct;
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

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
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

    public int getCountOtherproduct() {
        return countOtherproduct;
    }

    public void setCountOtherproduct(int countOtherproduct) {
        this.countOtherproduct = countOtherproduct;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", customerId=" + customerId + ", fullName=" + fullName + ", phone=" + phone + ", address=" + address + ", orderDate=" + orderDate + ", status=" + status + ", totalAmount=" + totalAmount + ", productName=" + productName + ", countOtherproduct=" + countOtherproduct + '}';
    }

 
    
}
