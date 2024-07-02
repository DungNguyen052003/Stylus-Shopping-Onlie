/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class OrderDetailsForSale {
    private int id;
    private Order order;
    private ProductDetails productDetails;
    private int quantity;
    private double price;
    private double total;
    private String saleNote;

    public OrderDetailsForSale() {
    }

    public OrderDetailsForSale(int id, Order order, ProductDetails productDetails, int quantity, double price, double total, String saleNote) {
        this.id = id;
        this.order = order;
        this.productDetails = productDetails;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
        this.saleNote = saleNote;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public ProductDetails getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(ProductDetails productDetails) {
        this.productDetails = productDetails;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getSaleNote() {
        return saleNote;
    }

    public void setSaleNote(String saleNote) {
        this.saleNote = saleNote;
    }

    @Override
    public String toString() {
        return "OrderDetailsForSale{" + "id=" + id + ", order=" + order + ", productDetails=" + productDetails + ", quantity=" + quantity + ", price=" + price + ", total=" + total + ", saleNote=" + saleNote + '}';
    }
    
    
}
