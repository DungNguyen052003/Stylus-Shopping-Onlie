/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Blog;
import model.Product;

/**
 *
 * @author ngock
 */
public class BlogDAO extends DBContext {

    PreparedStatement stm; //thực hiện câu lệnh sql
    ResultSet rs; //lưu trữ dữ liệu lấy về từ câu lệnh select

    public List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();

        try {
            String sql = "Select * From Blog";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt(1);
                String blogTitle = rs.getString(2);
                String thumbNail = rs.getString(3);
                String description = rs.getString(4);
                Date createDate = rs.getDate(5);
                int productID = rs.getInt(6);
                boolean status = rs.getBoolean(7);
                String briefInformation = rs.getString(8);
                String author = rs.getString(9);
                boolean featured = rs.getBoolean(10);
                list.add(new Blog(blogID, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getFeaturedBlogs() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Blog WHERE Featured = 1";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt(1);
                String blogTitle = rs.getString(2);
                String thumbNail = rs.getString(3);
                String description = rs.getString(4);
                Date createDate = rs.getDate(5);
                int productID = rs.getInt(6);
                boolean status = rs.getBoolean(7);
                String briefInformation = rs.getString(8);
                String author = rs.getString(9);
                boolean featured = rs.getBoolean(10);
                list.add(new Blog(blogID, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Blog getBlogByID(int blogID) {
        try {
            String sql = "SELECT * FROM Blog WHERE BlogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, blogID);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String thumbnail = rs.getString(3);
                String description = rs.getString(4);
                Date createDate = rs.getDate(5);
                int productID = rs.getInt(6);
                boolean status = rs.getBoolean(7);
                String briefInformation = rs.getString(8);
                String author = rs.getString(9);
                boolean featured = rs.getBoolean(10);
                return new Blog(id, title, thumbnail, description, createDate, productID, status, briefInformation, author, featured);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Product getRelatedProducts(int blogID) {
        try {
            String sql = "SELECT p.* FROM Blog b JOIN Product p ON b.ProductID = p.ProductID where b.BlogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, blogID);
            rs = stm.executeQuery();
            while (rs.next()) {

                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                int saleID = rs.getInt("SaleID");
                int brandID = rs.getInt("BrandID");
                int colorID = rs.getInt("ColorID");
                int cateID = rs.getInt("CateID");
                String thumbNail = rs.getString("ThumbNail");
                BigDecimal price = rs.getBigDecimal("Price");
                int totalQuantity = rs.getInt("Total_Quantity");
                boolean status = rs.getBoolean("Status");
                String description = rs.getString("Description");
                String briefInformation = rs.getString("BriefInformation");
                int starRating = rs.getInt("StarRating");
                boolean saleStatus = rs.getBoolean("SaleStatus");

                return new Product(productID, productName, saleID, brandID, colorID, cateID, thumbNail, price, totalQuantity, status, description, briefInformation, starRating, saleStatus);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        BlogDAO d = new BlogDAO();
        System.out.println(d.getRelatedProducts(1));

    }

    public Product getProductByID() {
        Product product = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM Product WHERE ProductID = 2";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                int saleID = rs.getInt("SaleID");
                int brandID = rs.getInt("BrandID");
                int colorID = rs.getInt("ColorID");
                int cateID = rs.getInt("CateID");
                String thumbNail = rs.getString("ThumbNail");
                BigDecimal price = rs.getBigDecimal("Price");
                int totalQuantity = rs.getInt("Total_Quantity");
                boolean status = rs.getBoolean("Status");
                String description = rs.getString("Description");
                String briefInformation = rs.getString("BriefInformation");
                int starRating = rs.getInt("StarRating");
                boolean saleStatus = rs.getBoolean("SaleStatus");
                
                product = new Product(productID, productName, saleID, brandID, colorID, cateID, thumbNail, price, totalQuantity, status, description, briefInformation, starRating, saleStatus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    

//   public static void main(String[] args) {
//    // Tạo một đối tượng BlogDAO
//    BlogDAO blogDAO = new BlogDAO();
//    
//    // Gọi phương thức getAllBlogs() để lấy danh sách các bài viết từ cơ sở dữ liệu
//    List<Blog> blogs = blogDAO.getAllBlogs();
//    
//    // In thông tin của các bài viết
//    for (Blog blog : blogs) {
//        System.out.println("Blog ID: " + blog.getBlogID());
//        System.out.println("Title: " + blog.getBlogTitle());
//        System.out.println("Thumbnail: " + blog.getThumbNail());
//        System.out.println("Description: " + blog.getDescription());
//        System.out.println("Create Date: " + blog.getCreateDate());
//        System.out.println("Product ID: " + blog.getProductID());
//        System.out.println("Status: " + blog.isStatus());
//        System.out.println("Brief Information: " + blog.getBriefInformation());
//        System.out.println("Author: " + blog.getAuthor());
//        System.out.println("Featured: " + blog.isFeatured());
//        System.out.println("--------------------------------------");
//    }
//}
}
