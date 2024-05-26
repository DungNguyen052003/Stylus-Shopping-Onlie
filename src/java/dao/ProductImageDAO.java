/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.ProductImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84976
 */
public class ProductImageDAO extends DBContext {

    public List<ProductImage> get(int productID) {
        List<ProductImage> productImages = new ArrayList<>();
        String sql = "SELECT pi.* FROM Product p INNER JOIN ProductImage pi ON p.ProductID = pi.productID WHERE p.ProductID = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductImage productImage = new ProductImage();
                productImage.setProductID(rs.getInt("productID"));
                productImage.setProductImages(rs.getString("image"));
                productImages.add(productImage);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productImages;
    }

    public List<ProductImage> getAll() {
        List<ProductImage> productImages = new ArrayList<>();
        String sql = "SELECT * FROM ProductImage";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductImage productImage = new ProductImage();
                productImage.setProductID(rs.getInt("productID"));
                productImage.setProductImages(rs.getString("image"));
                productImages.add(productImage);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productImages;
        
}
    public static void main(String[] args) {
         List<ProductImage> productImages = new ProductImageDAO().get(1);
         for (ProductImage productImage : productImages) {
             System.out.println(productImage.getProductImages());
        }
    }
}
