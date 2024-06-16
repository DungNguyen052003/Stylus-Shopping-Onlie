/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Color;
import model.Product;
import model.ProductDetails;
import model.Size;
import dao.ProductDAO;

/**
 *
 * @author ASUS
 */
public class ProductDetailsDAO extends DBContext {

    public static void main(String[] args) {
        ProductDetailsDAO productDAO = new ProductDetailsDAO();

        // Thông tin chi tiết sản phẩm cần thêm
        int productID = 61; // Thay thế bằng ProductID thực tế
        int sizeId = 2; // Thay thế bằng SizeID thực tế
        int colorId = 3; // Thay thế bằng ColorID thực tế
        int quantity = 10; // Số lượng

        // Gọi phương thức để thêm chi tiết sản phẩm
        productDAO.addProductDetails(productID, sizeId, colorId, quantity);

        System.out.println("Product details added successfully.");

    }

    public List<ProductDetails> getQuantityByProduct(int productID) {
        List<ProductDetails> listFound = new ArrayList<>();

        String sql = """
                     SELECT ps.*FROM ProductDetails ps
                     JOIN Product p ON ps.ProductID = p.ProductID
                     JOIN Color c ON c.ColorID = ps.ColorID
                     WHERE p.ProductID = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, productID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ProductDetails pd = new ProductDetails();
                pd.setProductDetailID(resultSet.getInt("Product_Detail_id"));
                Color cl = new Color();
                Size sz = new Size();
                Product p = new ProductDAO().getProductById(resultSet.getInt("ProductID"));
                cl.setId(resultSet.getInt("ColorID"));
                cl.setName(resultSet.getString("colorName"));
                sz.setId(resultSet.getInt("SizeID"));
                sz.setName(resultSet.getString("sizeName"));
                pd.setColor(cl);
                pd.setProductDetailID(resultSet.getInt("Product_Detail_id"));
                pd.setSize(sz);

                pd.setProduct(p);
                pd.setQuantity(resultSet.getInt("Quantity"));
                listFound.add(pd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<ProductDetails> getDetailByProductID(int productID) {
        List<ProductDetails> list = new ArrayList<>();
        String sql = """
                     select pd.*,cl.Name as colorName,sz.Name as sizeName
                     from ProductDetails pd
                     join Product p on p.ProductID = pd.ProductID
                     join Color cl on cl.ColorID = pd.ColorID
                     join Size sz on sz.SizeID = pd.SizeID
                     where p.ProductID = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, productID);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ProductDetails pd = new ProductDetails();
                pd.setProductDetailID(resultSet.getInt("Product_Detail_id"));
                Color cl = new Color();
                Size sz = new Size();
                cl.setId(resultSet.getInt("ColorID"));
                cl.setName(resultSet.getString("colorName"));
                sz.setId(resultSet.getInt("SizeID"));
                sz.setName(resultSet.getString("sizeName"));
                pd.setColor(cl);
                pd.setProductDetailID(resultSet.getInt("Product_Detail_id"));
                pd.setSize(sz);
                Product p = new ProductDAO().getProductById(resultSet.getInt("ProductID"));
                pd.setProduct(p);
                pd.setQuantity(resultSet.getInt("Quantity"));
                list.add(pd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addProductDetails(int productID, int sizeId, int colorId, int quantity) {
        String sql = "INSERT INTO ProductDetails (ProductID, SizeID, ColorID, Quantity) VALUES (?, ?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, productID);
            statement.setInt(2, sizeId);
            statement.setInt(3, colorId);
            statement.setInt(4, quantity);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateQuantity(int productId, int sizeId, int colorId, int quantity) {
        String sql = "UPDATE ProductDetails SET Quantity = ? WHERE ProductID = ? AND SizeID = ? AND ColorID = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setInt(2, productId);
            statement.setInt(3, sizeId);
            statement.setInt(4, colorId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateQuantitybyID(String id, String quantity) {
        String sql = "update ProductDetails\n"
                + "set Quantity = ?\n"
                + "where Product_Detail_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, quantity);
            statement.setString(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getProductIdbyProductDetailId(String productDetailId) {
        String sql = "select * from ProductDetails\n"
                + "where Product_Detail_id = ? ";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, productDetailId);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                return resultSet.getInt("ProductID");
            }
        } catch (Exception e) {
        }
        return 0;
    }
}
