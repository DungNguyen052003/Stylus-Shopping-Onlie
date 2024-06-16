/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class ProductDetails {
    private int productDetailID;
    private Product product;
    private Size size;
    private Color color;
    private int quantity;

    public ProductDetails() {
    }

    public ProductDetails(int productDetailID, Product productID, Size sizeID, Color colorID, int quantity) {
        this.productDetailID = productDetailID;
        this.product = productID;
        this.size = sizeID;
        this.color = colorID;
        this.quantity = quantity;
    }

    public int getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(int productDetailID) {
        this.productDetailID = productDetailID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
    @Override
    public String toString() {
        return "ProductDetails{" + "productDetailID=" + productDetailID + ", productID=" + product + ", sizeID=" + size + ", colorID=" + color + ", quantity=" + quantity + '}';
    }
    
}
