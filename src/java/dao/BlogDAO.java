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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Blog;
import model.Category;
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
            String sql = "Select * From Blog Order By CreateDate DESC";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbNail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                LocalDateTime createDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                int productID = rs.getInt("ProductID");
                boolean status = rs.getBoolean("Status");
                String briefInformation = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                boolean featured = rs.getBoolean("Featured");
                list.add(new Blog(blogID, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Blog getLatestBlog() {
        Blog blog = null;
        try {
            String sql = "SELECT TOP 1 * FROM Blog ORDER BY CreateDate DESC";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                int blogID = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbNail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                LocalDateTime createDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                int productID = rs.getInt("ProductID");
                boolean status = rs.getBoolean("Status");
                String briefInformation = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                boolean featured = rs.getBoolean("Featured");

                blog = new Blog(blogID, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return blog;
    }

    public List<Blog> getFeaturedBlogs() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Blog WHERE Featured = 1";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbNail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                LocalDateTime createDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                int productID = rs.getInt("ProductID");
                boolean status = rs.getBoolean("Status");
                String briefInformation = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                boolean featured = rs.getBoolean("Featured");

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
                int id = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbNail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                LocalDateTime createDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                int productID = rs.getInt("ProductID");
                boolean status = rs.getBoolean("Status");
                String briefInformation = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                boolean featured = rs.getBoolean("Featured");
                return new Blog(id, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured);
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
                Product p = new Product();
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String thumbnail = rs.getString("ThumbNail");
                double price = rs.getDouble("Price");
                int star = rs.getInt("StarRating");
                int sale = rs.getInt("SaleStatus");
                int campainID = rs.getInt("CampainID");
                p.setProductID(productID);
                p.setProductName(productName);
                p.setThumbnail(thumbnail);
                p.setPrice(price);
                p.setStarRating(star);
                p.setSaleStatus(sale);
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    double salePrice = price - (price * discount / 100);
                    p.setSalePrice(salePrice);
                }
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getDiscount(int campainID) {
        String sql = "select * from Campain\n"
                + "where CampainID = ?";
        int a = 0;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, campainID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                a = rs.getInt("DiscountPercent");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return a;
    }

    public List<Blog> getLastestBlog() {
        List<Blog> list = new ArrayList<>();

        try {
            String sql = "Select top 1 * From Blog Order By CreateDate DESC";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                 int blogID = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbNail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                LocalDateTime createDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                int productID = rs.getInt("ProductID");
                boolean status = rs.getBoolean("Status");
                String briefInformation = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                boolean featured = rs.getBoolean("Featured");;
                list.add(new Blog(blogID, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByID() {
        Product product = null;
        PreparedStatement stm = null;
        ResultSet resultSet = null;

        try {
            String sql = "SELECT * FROM Product WHERE ProductID = 2";
            stm = connection.prepareStatement(sql);
            resultSet = stm.executeQuery();
            if (resultSet.next()) {
                Product p = new Product();
                int productID = resultSet.getInt("ProductID");
                String productName = resultSet.getString("ProductName");
                String thumbnail = resultSet.getString("ThumbNail");
                double price = resultSet.getDouble("Price");
                int star = resultSet.getInt("StarRating");
                int sale = resultSet.getInt("SaleStatus");
                int campainID = resultSet.getInt("CampainID");
                p.setProductID(productID);
                p.setProductName(productName);
                p.setThumbnail(thumbnail);
                p.setPrice(price);
                p.setStarRating(star);
                p.setSaleStatus(sale);
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    double salePrice = price - (price * discount / 100);
                    p.setSalePrice(salePrice);
                }
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Category> getAllRootCategories() {
        List<Category> categories = new ArrayList<>();
        try {
            String sql = " SELECT *\n"
                    + "FROM Category\n"
                    + "WHERE ParentID IS NULL;";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int cateID = rs.getInt("CateID");
                String name = rs.getString("Name");
                int status = rs.getInt("Status");
                int parentID = rs.getInt("ParentID");
                categories.add(new Category(cateID, name, status, parentID));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<Blog> getBlogsByCategory(String cateID) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select * from Blog where CateID = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, cateID);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbNail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                LocalDateTime createDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                int productID = rs.getInt("ProductID");
                boolean status = rs.getBoolean("Status");
                String briefInformation = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                boolean featured = rs.getBoolean("Featured");
                list.add(new Blog(id, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> searchBlogsByTitle(String search) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT [BlogID]\n"
                    + "      ,[BlogTitle]\n"
                    + "      ,[ThumbNail]\n"
                    + "      ,[Description]\n"
                    + "      ,[CreateDate]\n"
                    + "      ,[ProductID]\n"
                    + "      ,[Status]\n"
                    + "      ,[Brief_Info]\n"
                    + "      ,[Author]\n"
                    + "      ,[Featured]\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  Where BlogTitle LIKE ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbNail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                LocalDateTime createDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                int productID = rs.getInt("ProductID");
                boolean status = rs.getBoolean("Status");
                String briefInformation = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                boolean featured = rs.getBoolean("Featured");
                list.add(new Blog(blogID, blogTitle, thumbNail, description, createDate, productID, status, briefInformation, author, featured));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//    public static void main(String[] args) {
//        BlogDAO d = new BlogDAO();
//        String search = "example"; // Replace with your search term
//        List<Blog> list = d.searchBlogsByTitle(search);
//        for (Blog blog : list) {
//            System.out.println(blog);
//        }
//    }
}
