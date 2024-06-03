/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class Cart {
    private int cartID;
    private int customerID;
    private int productSizeColor;
    private int quantity;

    public Cart() {
    }

    public Cart(int cartID, int customerID, int productSizeColor, int quantity) {
        this.cartID = cartID;
        this.customerID = customerID;
        this.productSizeColor = productSizeColor;
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

    public int getProductSizeColor() {
        return productSizeColor;
    }

    public void setProductSizeColor(int productSizeColor) {
        this.productSizeColor = productSizeColor;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartID=" + cartID + ", customerID=" + customerID + ", productSizeColor=" + productSizeColor + ", quantity=" + quantity + '}';
    }
    
}
