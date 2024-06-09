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
import model.Order;
import model.OrderDetail;

/**
 *
 * @author ngock
 */
public class orderDAO extends DBContext {

    PreparedStatement stm; //thực hiện câu lệnh sql
    ResultSet rs; //lưu trữ dữ liệu lấy về từ câu lệnh select

    public List<Order> getOrders(int customerId) {
        List<Order> orders = new ArrayList<>();

        try {
            String sql = "SELECT \n"
                    + "                        o.OrderID, \n"
                    + "                     o.OrderDate, \n"
                    + "                        MIN(p.ProductName) AS ProductNames, COUNT(od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, \n"
                    + "                       o.TotalAmount, \n"
                    + "                        o.Status \n"
                    + "                     FROM \n"
                    + "                        [dbo].[Order] o\n"
                    + "                     JOIN \n"
                    + "                         [dbo].[OrderDetail] od ON o.OrderID = od.OrderID\n"
                    + "                     JOIN \n"
                    + "                         [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id \n"
                    + "                     JOIN \n"
                    + "                         [dbo].[Product] p ON pd.ProductID = p.ProductID \n"
                    + "                     WHERE \n"
                    + "                         o.CustomerID = ?\n"
                    + "                     GROUP BY\n"
                    + "                         o.OrderID, \n"
                    + "                         o.OrderDate,\n"
                    + "                        o.TotalAmount,\n"
                    + "                         o.Status;";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            rs = stm.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("OrderID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setProductName(rs.getString("ProductNames")); // Lấy giá trị từ cột "ProductNames"
                o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                o.setStatus(rs.getString("Status"));
                o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));

                orders.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    public static void main(String[] args) {
        orderDAO o = new orderDAO();
        List<Order> orders = o.getOrders(2);
        for (Order or : orders) {
            System.out.println(or.getCountOtherproduct());
        }
    }
  
    public List<OrderDetail> getOrderDetails(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql = "SELECT od.ID,o.OrderID, "
                    + "o.OrderDate, "
                    + "o.TotalAmount, "
                    + "o.Status, "
                    + "c.Name AS FullName, "
                    + "c.gender, "
                    + "c.Email, "
                    + "c.Phone, "
                    + "od.Quantity, "
                    + "od.Price, "
                    + "od.TotalPrice, "
                    + "p.ProductID, "
                    + "pd.SizeID, "
                    + "pd.ColorID, "
                    + "pd.Quantity AS ProductQuantity, "
                    + "p.ProductName AS ProductName, "
                    + "p.CateID, "
                    + "cat.Name AS ProductCategory, "
                    + "p.Thumbnail AS ProductThumbnail "
                    + "FROM [Order] o "
                    + "JOIN OrderDetail od ON o.OrderID = od.OrderID "
                    + "JOIN ProductDetails pd ON od.Product_Detail_Id = pd.Product_Detail_id "
                    + "JOIN Product p ON pd.ProductID = p.ProductID "
                    + "JOIN Category cat ON p.CateID = cat.CateID "
                    + "JOIN Customer c ON o.CustomerID = c.CustomerID "
                    + "WHERE o.OrderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                Date orderDate = rs.getDate("OrderDate");
                BigDecimal totalAmount = rs.getBigDecimal("TotalAmount");
                String status = rs.getString("Status");
                String fullName = rs.getString("FullName");
                String gender = rs.getString("gender");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                int quantity = rs.getInt("Quantity");
                BigDecimal price = rs.getBigDecimal("Price");
                BigDecimal totalPrice = rs.getBigDecimal("TotalPrice");
                int productID = rs.getInt("ProductID");
                int sizeID = rs.getInt("SizeID");
                int colorID = rs.getInt("ColorID");
                int productQuantity = rs.getInt("ProductQuantity");
                String productName = rs.getString("ProductName");
                int cateID = rs.getInt("CateID");
                String productCategory = rs.getString("ProductCategory");
                String productThumbnail = rs.getString("ProductThumbnail");

                OrderDetail od = new OrderDetail();
                od.setId(rs.getInt("ID"));
                od.setOrderID(orderID);
                od.setOrderDate(orderDate);
                od.setTotalAmount(totalAmount);
                od.setStatus(status);
                od.setFullName(fullName);
                od.setGender(gender);
                od.setEmail(email);
                od.setPhone(phone);
                od.setQuantity(quantity);
                od.setPrice(price);
                od.setTotalPrice(totalPrice);
                od.setProductID(productID);
                od.setSizeID(sizeID);
                od.setColorID(colorID);
                od.setProductQuantity(productQuantity);
                od.setProductName(productName);
                od.setCateID(cateID);
                od.setProductCategory(productCategory);
                od.setProductThumbnail(productThumbnail);

                orderDetails.add(od);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public void cancelOrder(int orderId) {
        try {
            String sql = "UPDATE [Order] SET Status = 'Cancelled' WHERE OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

