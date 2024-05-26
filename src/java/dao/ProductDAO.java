/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import context.DBContext;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import java.sql.ResultSet;
import model.Campain;

/**
 *
 * @author TienP
 */
public class ProductDAO extends DBContext {

    public List<Product> listTop8Cate(int category) {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql = """
                 SELECT TOP 8 * 
                 FROM product
                 WHERE product.total_quantity > 0
                 """;

        // Nếu category không phải là 0, thêm điều kiện lọc theo cateID
        if (category == 1 || category == 2) {
            sql += " AND product.cateID = ?";
        } else if (category == 0) {
            sql += " AND (product.cateID = 1 OR product.cateID = 2)";
        }

        // Thêm điều kiện sắp xếp
        sql += " ORDER BY createDate DESC";

        try {
            statement = connection.prepareStatement(sql);
            if (category == 1 || category == 2) {
                statement.setInt(1, category);
            }
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
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
                listFound.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }

    public List<Product> listHotTrend() {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql = "SELECT TOP 3 p.ProductID, COUNT(od.orderid) AS order_count\n"
                + "FROM product p\n"
                + "JOIN ProductSizeColor pcs ON p.ProductID = pcs.productID\n"
                + "JOIN orderDetail od ON pcs.ID = od.ProductSizeColor\n"
                + "JOIN dbo.[Order] o ON od.orderid = o.orderid\n"
                + "WHERE o.orderDate >= DATEADD(DAY, -7, GETDATE())\n"
                + "GROUP BY p.ProductID\n"
                + "ORDER BY order_count DESC;";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
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
                listFound.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }

    public List<Product> listFeature() {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql = "SELECT TOP 3 * \n"
                + "FROM product\n"
                + "ORDER BY StarRating DESC;";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
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
                listFound.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }

    public List<Product> listSale() {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql = "SELECT TOP 3 * \n"
                + "FROM product\n"
                + "WHERE saleStatus = 1 \n"
                + "ORDER BY updateDate DESC;";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
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
                listFound.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
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

    public Product get(int id) {

        String sql = "SELECT p.ProductID, p.ProductName, p.Price, p.ThumbNail,p.CampainID, p.Description, p.BriefInformation ,p.CreateDate, p.UpdateDate, c.CateID, c.Name AS c_name "
                + "FROM Product p "
                + "INNER JOIN Category c ON p.CateID = c.CateID "
                + "WHERE p.ProductID = ?";
        //  Connection con = super.getJDBCConnection();

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                // Tạo một đối tượng Product
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getDouble("Price"));
                product.setThumbnail(rs.getString("ThumbNail"));
                product.setDescription(rs.getString("Description"));
                product.setBriefInfomation(rs.getString("BriefInformation"));
                product.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rs.getTimestamp("UpdateDate").toLocalDateTime());
                product.setCampainID(rs.getInt("CampainID"));
                // Tạo một đối tượng Category
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("c_name"));

                // Thiết lập Category cho Product
                product.setCateID(category);

                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "select * from Product \n"
                + "join Category on Product.CateID = Category.CateID";
        try {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSaleID(rs.getInt("SaleID"));
                product.setBrandID(rs.getInt("BrandID"));
                //     product.setColorID(rs.getInt("ColorID"));
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("c_name"));
                product.setCateID(category);
                product.setThumbnail(rs.getString("ThumbNail"));
                product.setPrice(rs.getDouble("Price"));
                product.setTotal_quantity(rs.getInt("Total_Quantity"));
                product.setStatus(rs.getInt("Status"));
                product.setDescription(rs.getString("Description"));
                product.setBriefInfomation(rs.getString("BriefInformation"));
                product.setStarRating(rs.getInt("StarRating"));
                product.setSaleStatus(rs.getInt("SaleStatus"));
                product.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rs.getTimestamp("UpdateDate").toLocalDateTime());
                product.setCampainID(rs.getInt("CampainID"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getProductByCategory(int categoryID) {
        List<Product> productList = new ArrayList<>();

        String sql = "  SELECT p.ProductID, p.ProductName, p.Price, p.ThumbNail, p.Description, p.BriefInformation,p.CreateDate, p.UpdateDate ,p.CateID, p.CampainID, c.Name AS c_name \n"
                + "               FROM Product p \n"
                + "                 JOIN Category c ON p.CateID = c.CateID \n"
                + "                WHERE c.CateID =?";

        //Connection conn = super.getJDBCConnection();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getDouble("Price"));
                product.setThumbnail(rs.getString("ThumbNail"));
                product.setDescription(rs.getString("Description"));
                product.setBriefInfomation(rs.getString("BriefInformation"));
                product.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rs.getTimestamp("UpdateDate").toLocalDateTime());
                product.setCampainID(rs.getInt("CampainID"));
                // Tạo một đối tượng Category
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("c_name"));

                // Thiết lập Category cho Product
                product.setCateID(category);// Thiết lập cateID cho product

                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return productList;
    }

    public List<Product> findByName(String keyword) {
        List<Product> productList = new ArrayList<>();

        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  WHERE [ProductName] LIKE ?";

        //Connection conn = super.getJDBCConnection();
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getDouble("Price"));
                product.setThumbnail(rs.getString("ThumbNail"));
                product.setDescription(rs.getString("Description"));
                product.setBriefInfomation(rs.getString("BriefInformation"));
                product.setBrandID(rs.getInt("brandID"));
                product.setCampainID(rs.getInt("CampainID"));
                //     product.setColorID(rs.getInt("colorID"));
                product.setStarRating(rs.getInt("starRating"));
                product.setSaleID(rs.getInt("saleID"));
                product.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rs.getTimestamp("UpdateDate").toLocalDateTime());
                // Tạo một đối tượng Category
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("name"));

                // Thiết lập Category cho Product
                product.setCateID(category);// Thiết lập cateID cho product

                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return productList;

    }

//    public List<Product> findProduct(String keyword) {
//        ProductDAO productDAO = new ProductDAO();
//        List<Product> listProduct;
//        if (keyword != null && !keyword.isEmpty()) {
//            listProduct = productDAO.findByName(keyword);
//        } else {
//            listProduct = productDAO.getAll();
//        }
//        return listProduct;
//    }
    // Các phương thức khác đã có trong ProductDAO
    public List<Product> findProductByCategory(int categoryId) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Product "
                + "join Category "
                + "on Product.CateID = Category.CateID "
                + "WHERE cateID = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getDouble("Price"));
                product.setThumbnail(rs.getString("ThumbNail"));
                product.setDescription(rs.getString("Description"));
                product.setBriefInfomation(rs.getString("BriefInformation"));
                product.setBrandID(rs.getInt("brandID"));
                product.setCampainID(rs.getInt("CampainID"));
                //     product.setColorID(rs.getInt("colorID"));
                product.setStarRating(rs.getInt("starRating"));
                product.setSaleID(rs.getInt("saleID"));
                product.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rs.getTimestamp("UpdateDate").toLocalDateTime());
                // Tạo một đối tượng Category
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("name"));

                // Thiết lập Category cho Product
                product.setCateID(category);// Thiết lập cateID cho product

                productList.add(product);

                //  productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public List<Product> searchProductByPrice(double minPrice, double maxPrice) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE price BETWEEN ? AND ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setDouble(1, minPrice);
            statement.setDouble(2, maxPrice);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getDouble("Price"));
                product.setThumbnail(rs.getString("ThumbNail"));
                product.setDescription(rs.getString("Description"));
                product.setBriefInfomation(rs.getString("BriefInformation"));
                product.setBrandID(rs.getInt("brandID"));
                product.setCampainID(rs.getInt("CampainID"));
                //     product.setColorID(rs.getInt("colorID"));
                product.setStarRating(rs.getInt("starRating"));
                product.setSaleID(rs.getInt("saleID"));
                product.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rs.getTimestamp("UpdateDate").toLocalDateTime());
                // Tạo một đối tượng Category
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("name"));

                // Thiết lập Category cho Product
                product.setCateID(category);// Thiết lập cateID cho product

                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public List<ProductSaleInfo> getProductsByCampain(int campainId) {
        List<ProductSaleInfo> productSaleInfos = new ArrayList<>();
        String sql = "SELECT P.ProductID, P.ProductName, P.Price AS OriginalPrice, "
                + "C.DiscountPercent AS CampainDiscountPercent, "
                + "P.Price - (P.Price * (C.DiscountPercent / 100.0)) AS SalePrice "
                + "FROM Product P JOIN Campain C ON P.CampainID = C.CampainID "
                + "WHERE P.CampainID = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, campainId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getDouble("OriginalPrice"));

                Campain campain = new Campain();
                campain.setDiscount(rs.getInt("DiscountPercent")); // Chỉnh sửa tên cột

                double salePrice = rs.getDouble("SalePrice");

                ProductSaleInfo productSaleInfo = new ProductSaleInfo(product, salePrice);
                productSaleInfos.add(productSaleInfo);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return productSaleInfos;
    }

    public static class ProductSaleInfo {

        private Product product; // Đối tượng Product
        private double salePrice; // Giá bán sau chiết khấu

        // Constructor
        public ProductSaleInfo(Product product, double salePrice) {
            this.product = product;
            this.salePrice = salePrice;
        }

        // Getters và setters
        public Product getProduct() {
            return product;
        }

        public void setProduct(Product product) {
            this.product = product;
        }

        public double getSalePrice() {
            return salePrice;
        }

        public void setSalePrice(double salePrice) {
            this.salePrice = salePrice;
        }
    }

    public List<Product> getLatestProductsFromDatabase(int categoryId) {
        List<Product> lasterproducts = new ArrayList<>();
        String sql = "SELECT p.*\n"
                + "FROM Product p\n"
                + "JOIN Category c ON p.cateID = c.cateID\n"
                + "WHERE c.cateID = ?\n"
                + "  AND p.status = 1\n"
                + "ORDER BY p.createDate DESC  ";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setSaleID(rs.getInt("SaleID"));
                product.setBrandID(rs.getInt("BrandID"));
                //     product.setColorID(rs.getInt("ColorID"));
                product.setThumbnail(rs.getString("ThumbNail"));
                product.setPrice(rs.getDouble("Price"));
                product.setTotal_quantity(rs.getInt("Total_Quantity"));
                product.setStatus(rs.getInt("Status"));
                product.setDescription(rs.getString("Description"));
                product.setBriefInfomation(rs.getString("BriefInformation"));
                product.setStarRating(rs.getInt("StarRating"));
                product.setSaleStatus(rs.getInt("SaleStatus"));
                product.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rs.getTimestamp("UpdateDate").toLocalDateTime());
                product.setCampainID(rs.getInt("CampainID"));
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                 category.setName(rs.getString("name"));
                product.setCateID(category);// 
                lasterproducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lasterproducts;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        // Product  p1 = p.get(1);
        List<Product> p1 = p.getLatestProductsFromDatabase(1);
        for (Product product : p1) {
            System.out.println(product.toString());
        }
    }

}
