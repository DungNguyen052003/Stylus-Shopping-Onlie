/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import context.DBContext;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import java.sql.ResultSet;
import model.Brand;

/**
 *
 * @author TienP
 */
public class ProductDAO extends DBContext {

    CategoryDAO dao = new CategoryDAO();

    public List<Product> listAllProduct(int page, int pageSize) {
        List<Product> listFound = new ArrayList<>();
        String sql = """
                     SELECT *
                       FROM [dbo].[Product] p join Brand b on p.brandId = b.brandId
                       ORDER BY ProductID ASC
                       OFFSET ? ROWS
                       FETCH NEXT ? ROWS ONLY""";

        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category category = dao.getCategory(cateID);
                product.setCateID(category);
                Brand brand = new Brand();
                brand.setBrandId(resultSet.getInt("BrandID"));
                brand.setBrandName(resultSet.getString("BrandName"));
                product.setBrandID(brand);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");  
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }
    
    public List<Product> listTop6Cate(int category) {
        List<Product> listFound = new ArrayList<>();
        String sql = """
                 SELECT TOP 6 * 
                 FROM product p join Brand b on p.brandId = b.brandId
                 WHERE p.total_quantity > 0 and p.status = 1 and p.Featured = 1
                 """;
        if (category == 1 || category == 2) {
            sql += " AND p.cateID = ?";
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
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                Brand brand = new Brand();
                brand.setBrandId(resultSet.getInt("BrandID"));
                brand.setBrandName(resultSet.getString("BrandName"));
                product.setBrandID(brand);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }

    public List<Product> listHotTrend() {
        List<Product> listFound = new ArrayList<>();

        String sql = """
                     SELECT TOP 3 p.ProductID, COUNT(od.orderid) AS order_count
                     FROM product p
                     join Brand b on p.brandId = b.brandId
                     JOIN ProductDetails pcs ON p.ProductID = pcs.productID
                     JOIN orderDetail od ON pcs.productID = od.Product_Detail_Id
                     JOIN dbo.[Order] o ON od.orderid = o.orderid
                     WHERE o.orderDate >= DATEADD(DAY, -7, GETDATE()) and p.status = 1
                     GROUP BY p.ProductID
                     ORDER BY p.Featured DESC, order_count DESC;;""";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                Brand brand = new Brand();
                brand.setBrandId(resultSet.getInt("BrandID"));
                brand.setBrandName(resultSet.getString("BrandName"));
                product.setBrandID(brand);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }

    public List<Product> listFeature() {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql = """
                     SELECT TOP 3 * 
                     FROM product p join Brand b on p.brandId = b.brandId
                     where p.status = 1
                     ORDER BY p.Featured DESC, p.StarRating DESC;""";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                Brand brand = new Brand();
                brand.setBrandId(resultSet.getInt("BrandID"));
                brand.setBrandName(resultSet.getString("BrandName"));
                product.setBrandID(brand);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }

    public List<Product> listSale() {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql = """
                     SELECT TOP 3 * 
                     FROM product p join Brand b on p.brandId = b.brandId
                     WHERE p.saleStatus = 1 and p.status = 1
                     ORDER BY p.Featured DESC, p.updateDate DESC;""";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                Brand brand = new Brand();
                brand.setBrandId(resultSet.getInt("BrandID"));
                brand.setBrandName(resultSet.getString("BrandName"));
                product.setBrandID(brand);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
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

    public List<Product> findByCategory(int categoryID, int page) {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql = """
                     SELECT *
                       FROM Product
                       WHERE CateID = ? and status = 1
                       Order by ProductID
                       Offset ? rows
                       fetch next ? rows only""" //page-1 *  y:9
                ;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryID);
            int offset = (page - 1) * 3;
            statement.setInt(2, offset);
            statement.setInt(3, 3);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
            }
        } catch (SQLException e) {
        }
        return listFound;
    }

    public List<Product> findByName(String keyword, int page) {
        CategoryDAO dao = new CategoryDAO();
        List<Product> listProduct = new ArrayList<>();
        String sql = """
                     SELECT *
                       FROM [dbo].[Product]
                       WHERE ProductName LIKE  ? and status = 1
                       Order by ProductName
                       Offset ? rows
                       fetch next ? rows only""" //page-1 *  y:9
                ;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            int offset = (page - 1) * 3;
            statement.setInt(2, offset);
            statement.setInt(3, 3);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

    public int findTotalRecordByCategory(int categoryId) {
        String sql = """
                     SELECT COUNT(*) AS total 
                     FROM [dbo].[Product] 
                     WHERE CateID = ? and status = 1""";
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;

    }

    public Product getProductById(int id) {
        String sql = "SELECT * "
                + "FROM Product p join Brand b on p.brandId = b.brandId "
                + "INNER JOIN Category c ON p.CateID = c.CateID "
                + "WHERE p.ProductID = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                Brand brand = new Brand();
                brand.setBrandId(resultSet.getInt("BrandID"));
                brand.setBrandName(resultSet.getString("BrandName"));
                product.setBrandID(brand);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int findTotalRecordByName(String keyword) {
        String sql = "SELECT COUNT(*) AS total FROM Product WHERE ProductName LIKE ? and status = 1";
        int totalRecords = 0;

        try {
            statement = connection.prepareStatement(sql);
            // Sử dụng "%" để tìm kiếm các từ khóa chứa trong tên sản phẩm
            statement.setString(1, "%" + keyword + "%");
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalRecords;
    }

    public int getTotalRecord() {
        String sql = "SELECT COUNT(*) AS total FROM Product where status = 1 ";
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public List<Product> findProductsByPriceRange(double minPrice, double maxPrice, int page, int pageSize) {
        CategoryDAO dao = new CategoryDAO();
        List<Product> listProduct = new ArrayList<>();
        String sql = """
                       SELECT *
                       FROM Product
                       WHERE status = 1 and Price  BETWEEN ? AND ? 
                       ORDER BY UpdateDate DESC
                       OFFSET ? ROWS
                       FETCH NEXT ? ROWS ONLY
                        """;
        try {
            statement = connection.prepareStatement(sql);
            statement.setDouble(1, minPrice);
            statement.setDouble(2, maxPrice);
            int offset = (page - 1) * pageSize;
            statement.setInt(3, offset);
            statement.setInt(4, pageSize);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

    public List<Product> listNewest(int page, int pageSize) {
        List<Product> newestProducts = new ArrayList<>();
        String sql = "SELECT * FROM Product where status = 1 "
                + "ORDER BY CreateDate DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                newestProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newestProducts;

    }

    public List<Product> getLatestProductsFromDatabase(int categoryId) {
        List<Product> lastestProducts = new ArrayList<>();
        String sql = """
                     SELECT p.*,c.name 
                     FROM Product p
                     JOIN Category c ON p.cateID = c.cateID
                     WHERE c.cateID = ?
                       AND p.status = 1
                     ORDER BY p.createDate DESC  """;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                lastestProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lastestProducts;
    }

    public boolean updateProductStatus(int productID, int status) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [Status] = ?\n"
                + "   WHERE ProductID =?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, productID);
            int updateStatus = statement.executeUpdate();
            return updateStatus > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateProduct(Product product) {
        String sql = """
                     UPDATE [dbo].[Product]
                        SET [ProductName] = ?
                           ,[CateID] = ?
                           ,[Thumbnail] = ?
                           ,[Price] = ?
                           ,[Description] = ?
                           ,[BriefInformation] = ?
                      WHERE ProductID = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setInt(2, product.getCateID().getCateID());
            statement.setString(3, product.getThumbnail());
            statement.setBigDecimal(4, product.getPrice());
            statement.setString(5, product.getDescription());
            statement.setString(6, product.getBriefInfomation());
            statement.setInt(7, product.getProductID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getSortedProducts(String sortBy, int page, int pageSize) {
        List<Product> listFound = new ArrayList<>();
        String baseSql = "SELECT p.*"
                + "FROM [dbo].[Product] p "
                + "LEFT JOIN Campain c ON c.CampainID = p.CampainId";
        String orderBySql;

        switch (sortBy) {
            case "title":
                orderBySql = " ORDER BY p.ProductName";
                break;
            case "category":
                orderBySql = " ORDER BY p.CateID";
                break;
            case "price":
                orderBySql = " ORDER BY p.Price";
                break;
            case "sale":
                orderBySql = " ORDER BY SalePrice";
                break;
            case "feature":
                orderBySql = " ORDER BY p.Featured";
                break;
            case "status":
                orderBySql = " ORDER BY p.Status"; 
                break;
            default:
                orderBySql = " ORDER BY p.ProductID";
                break;
        }

        String paginationSql = " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String sql = baseSql + orderBySql + paginationSql;

        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Product> filterProduct(int page, int pageSize, int minPrice, int maxPrice, String search, int status, int subCategory) {
        List<Product> listFound = new ArrayList<>();
        CategoryDAO dao = new CategoryDAO();
        String sql1 = "SELECT * FROM Product WHERE 1=1 ";
        String sql2 = "";

        if (minPrice != 0) {
            sql2 += "AND Price >= ? ";
        }
        if (maxPrice != 0) {
            sql2 += "AND Price <= ? ";
        }
        if (search != null && !search.isEmpty()) {
            sql2 += "AND (ProductName LIKE ? OR BriefInformation LIKE ?) ";
        }
        if (subCategory != -1) {
            sql2 += "AND CateID = ? ";
        }
        if (status == 1 || status == 0) {
            sql2 += "AND Status = ? ";
        }

        String sql3 = "ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String sql = sql1 + sql2 + sql3;

        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (minPrice != 0) {
                statement.setDouble(parameterIndex++, minPrice);
            }
            if (maxPrice != 0) {
                statement.setDouble(parameterIndex++, maxPrice);
            }
            if (search != null && !search.isEmpty()) {
                statement.setString(parameterIndex++, "%" + search + "%");
                statement.setString(parameterIndex++, "%" + search + "%");
            }
            if (subCategory != -1) {
                statement.setInt(parameterIndex++, subCategory);
            }
            if (status == 1 || status == 0) {
                statement.setInt(parameterIndex++, status);
            }
            int offset = (page - 1) * pageSize;
            statement.setInt(parameterIndex++, offset);
            statement.setInt(parameterIndex++, pageSize);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("ProductName"));
                product.setMarketerID(resultSet.getInt("MarketerID"));
                int cateID = resultSet.getInt("CateID");
                Category ct = dao.getCategory(cateID);
                product.setCateID(ct);
                product.setThumbnail(resultSet.getString("ThumbNail"));
                BigDecimal price = resultSet.getBigDecimal("Price").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setTotal_quantity(resultSet.getInt("Total_Quantity"));
                product.setStatus(resultSet.getInt("Status"));
                product.setDescription(resultSet.getString("Description"));
                product.setBriefInfomation(resultSet.getString("BriefInformation"));
                product.setStarRating(resultSet.getInt("StarRating"));
                int sale = resultSet.getInt("SaleStatus");
                product.setSaleStatus(sale);
                int campainID = resultSet.getInt("CampainID");
                product.setCreateDate(resultSet.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(resultSet.getTimestamp("UpdateDate").toLocalDateTime());
                if (campainID != 0 && sale == 1) {
                    int discount = this.getDiscount(campainID);
                    product.setSalePrice(price, discount);
                }
                listFound.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalFilteredRecord(int minPrice, int maxPrice, String search, int status, int subCategory) {
        String sql = "SELECT COUNT(*) FROM Product WHERE 1=1";
        List<Object> params = new ArrayList<>();

        if (minPrice > 0) {
            sql += " AND Price >= ?";
            params.add(minPrice);
        }
        if (maxPrice < Integer.MAX_VALUE && maxPrice > 0) {
            sql += " AND Price <= ?";
            params.add(maxPrice);
        }
        if (search != null && !search.isEmpty()) {
            sql += " AND ProductName LIKE ?";
            params.add("%" + search + "%");
        }
        if (status != -1) {
            sql += " AND Status = ?";
            params.add(status);
        }
        if (subCategory != -1) {
            sql += " AND CateID = ?";
            params.add(subCategory);
        }

        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            for (int i = 0; i < params.size(); i++) {
                statement.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getInt(1);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public boolean updateProductFeature(int feature, int productID) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "SET Featured = ?\n"
                + " WHERE ProductID = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, feature);
            statement.setInt(2, productID);
            int updateFeature = statement.executeUpdate();
            return updateFeature > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int addNewProduct(Product product) {
        List<Product> list = new ArrayList<>();
        String sql = " INSERT INTO Product (ProductName, Price, CateID, Thumbnail, BriefInformation, Description, Status, Featured)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ? ,?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setBigDecimal(2, product.getPrice());
            statement.setInt(3, product.getCateID().getCateID());
            statement.setString(4, product.getThumbnail());
            statement.setString(5, product.getBriefInfomation());
            statement.setString(6, product.getDescription());
            statement.setInt(7, product.getStatus());
            statement.setInt(8, product.getFeatured());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public void updateProductDetails() {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[BriefInformation] = ?\n"
                + " WHERE ProductID = ?";

    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductName]\n"
                + "           ,[CateID]\n"
                + "           ,[Thumbnail]\n"
                + "           ,[Price]\n"
                + "           ,[Status]\n"
                + "           ,[Description]\n"
                + "           ,[BriefInformation]\n"
                + "           ,[Featured]\n"
                + "           ,[CreateDate]\n"
                + "           ,[UpdateDate])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setInt(2, product.getCateID().getCateID());
            statement.setString(3, product.getThumbnail());
            statement.setBigDecimal(4, product.getPrice());
            statement.setInt(5, product.getStatus());
            statement.setString(6, product.getDescription());
            statement.setString(7, product.getBriefInfomation());
            statement.setInt(8, product.getFeatured());
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getLastInsertedProductID() {
        int productID = 0;
        String sql = "SELECT MAX(ProductID) AS ProductID FROM [dbo].[Product]";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                productID = resultSet.getInt("ProductID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productID;
    }

    public int findTotalRecordByPriceRange(double minPrice, double maxPrice) {
        String sql = """
                   SELECT COUNT(*) AS total 
                   FROM Product
                   WHERE status = 1 and Price  BETWEEN ? AND ?""";
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            statement.setDouble(1, minPrice);
            statement.setDouble(2, maxPrice);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

}
