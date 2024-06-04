/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class CartList {
    private int cartID;
    private String productName;
    private String colorName;
    private String sizeName;
    private int quantity;
    private double price;
    private int remainingAmount;

    public CartList() {
    }

    public CartList(int cartID, String productName, String colorName, String sizeName, int quantity, double price, int remainingAmount) {
        this.cartID = cartID;
        this.productName = productName;
        this.colorName = colorName;
        this.sizeName = sizeName;
        this.quantity = quantity;
        this.price = price;
        this.remainingAmount = remainingAmount;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
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

    public int getRemainingAmount() {
        return remainingAmount;
    }

    public void setRemainingAmount(int remainingAmount) {
        this.remainingAmount = remainingAmount;
    }

    @Override
    public String toString() {
        return "CartList{" + "cartID=" + cartID + ", productName=" + productName + ", colorName=" + colorName + ", sizeName=" + sizeName + ", quantity=" + quantity + ", price=" + price + ", remainingAmount=" + remainingAmount + '}';
    }
}
