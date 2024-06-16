/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import model.ProductDetails;

/**
 *
 * @author acer
 */
public class Cart {
    private int cartID;
    private int customerID;
    private ProductDetails productDetails;
    private int quantity;

    public Cart() {
    }

    public Cart(int cartID, int customerID, ProductDetails productDetails, int quantity) {
        this.cartID = cartID;
        this.customerID = customerID;
        this.productDetails = productDetails;
        this.quantity = quantity;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
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

    @Override
    public String toString() {
        return "Cart{" + "cartID=" + cartID + ", customerID=" + customerID + ", productDetails=" + productDetails + ", quantity=" + quantity + '}';
    }
    
    
        
}
