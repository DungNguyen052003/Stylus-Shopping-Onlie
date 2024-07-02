/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Category;
import model.Color;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Size;

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
            String sql = """
                         SELECT 
                                                 o.OrderID, 
                                              o.OrderDate, 
                                                 MIN(p.ProductName) AS ProductNames, COUNT(od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                                                o.TotalAmount, 
                                                 o.Status 
                                              FROM 
                                                 [dbo].[Order] o
                                              JOIN 
                                                  [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                                              JOIN 
                                                  [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id 
                                              JOIN 
                                                  [dbo].[Product] p ON pd.ProductID = p.ProductID 
                                              WHERE 
                                                  o.CustomerID = ?
                                              GROUP BY
                                                  o.OrderID, 
                                                  o.OrderDate,
                                                 o.TotalAmount,
                                                  o.Status;""";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            rs = stm.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("OrderID"));
                LocalDateTime OrderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                o.setOrderDate(OrderDate);
                o.setProductName(rs.getString("ProductNames")); // Lấy giá trị từ cột "ProductNames"
                o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                o.setStatus(rs.getInt("Status"));
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
            String sql = """
       SELECT   od.ID,
                o.OrderID,
                o.OrderDate,
                o.TotalAmount,
                o.Status,
                c.Name AS FullName,
                c.gender,
                c.Email,
                c.Phone,
                od.Quantity,
                od.Price,
                od.TotalPrice,
                p.ProductID,
                pd.SizeID,
                pd.ColorID,
                pd.Quantity AS ProductQuantity,
                p.ProductName AS ProductName,
                p.CateID,
                os.StatusDetail,
                cat.Name AS ProductCategory,
                p.Thumbnail AS ProductThumbnail
            FROM
                [Order] o
                JOIN OrderDetail od ON o.OrderID = od.OrderID
                JOIN ProductDetails pd ON od.Product_Detail_Id = pd.Product_Detail_id
                JOIN Product p ON pd.ProductID = p.ProductID
                JOIN Category cat ON p.CateID = cat.CateID
                JOIN Customer c ON o.CustomerID = c.CustomerID
        		join OrderStatus os on o.Status = os.OrderStatusID
            WHERE
                o.OrderID = ?
    """;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                LocalDateTime orderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                BigDecimal totalAmount = rs.getBigDecimal("TotalAmount");
                int status = rs.getInt("Status");
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
    public String getOrderStatus(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql = """
       SELECT   od.ID,
                o.OrderID,
                o.OrderDate,
                o.TotalAmount,
                o.Status,
                c.Name AS FullName,
                c.gender,
                c.Email,
                c.Phone,
                od.Quantity,
                od.Price,
                od.TotalPrice,
                p.ProductID,
                pd.SizeID,
                pd.ColorID,
                pd.Quantity AS ProductQuantity,
                p.ProductName AS ProductName,
                p.CateID,
                os.StatusDetail,
                cat.Name AS ProductCategory,
                p.Thumbnail AS ProductThumbnail
            FROM
                [Order] o
                JOIN OrderDetail od ON o.OrderID = od.OrderID
                JOIN ProductDetails pd ON od.Product_Detail_Id = pd.Product_Detail_id
                JOIN Product p ON pd.ProductID = p.ProductID
                JOIN Category cat ON p.CateID = cat.CateID
                JOIN Customer c ON o.CustomerID = c.CustomerID
        		join OrderStatus os on o.Status = os.OrderStatusID
            WHERE
                o.OrderID = ?
    """;
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();

            while (rs.next()) {
                return rs.getString("StatusDetail");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Pending";
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

    public int countOrders() {
        int totalOrders = 0;
        try {
            String sql = "SELECT COUNT(OrderID) AS TotalOrders FROM [dbo].[Order]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            if (rs.next()) {
                totalOrders = rs.getInt("TotalOrders");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalOrders;
    }

    public int countCancelOrder() {
        int totalOrders = 0;
        try {
            String sql = "SELECT COUNT(OrderID) AS TotalOrders FROM [dbo].[Order] WHERE [Status] = 'Cancelled'";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            if (rs.next()) {
                totalOrders = rs.getInt("TotalOrders");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalOrders;
    }

    public double sumAllMoneyOrder() {
        String sql = "SELECT \n"
                + "    SUM(o.TotalAmount) AS TotalAmountSum\n"
                + "FROM \n"
                + "    [dbo].[Order] o\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.Status = os.OrderStatusID\n"
                + "WHERE \n"
                + "    os.StatusDetail IN ('Delivered');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int totalCustomersOrdered() {
        int totalCustomersOrdered = 0;
        String sql = "SELECT \n"
                + "    COUNT(DISTINCT o.CustomerID) AS TotalCustomersOrdered\n"
                + "FROM \n"
                + "    [dbo].[Order] o\n"
                + "JOIN \n"
                + "    [dbo].[Customer] c ON o.CustomerID = c.CustomerID\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.Status = os.OrderStatusID\n"
                + "WHERE \n"
                + "    os.StatusDetail = 'Delivered';";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            if (rs.next()) {
                totalCustomersOrdered = rs.getInt("TotalCustomersOrdered");
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }

        return totalCustomersOrdered;
    }

    public List<Order> getTotalOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT "
                    + "o.OrderID, c.Name AS CustomerName, p.ProductName, cat.Name AS CategoryName, "
                    + "p.Price AS ProductPrice, p.Thumbnail, o.FullName, "
                    + "o.Phone AS CustomerPhone, o.Address AS CustomerAddress, o.OrderDate, "
                    + "o.Status AS OrderStatus, o.TotalAmount, od.Quantity AS OrderQuantity, "
                    + "od.Price AS OrderPrice, (od.Quantity * od.Price) AS TotalPrice, "
                    + "sz.Name AS SizeName, clr.Name AS ColorName "
                    + "FROM [Order] o "
                    + "INNER JOIN [Customer] c ON o.CustomerID = c.CustomerID "
                    + "INNER JOIN [OrderDetail] od ON o.OrderID = od.OrderID "
                    + "INNER JOIN [ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id "
                    + "INNER JOIN [Product] p ON pd.ProductID = p.ProductID "
                    + "INNER JOIN [Size] sz ON pd.SizeID = sz.SizeID "
                    + "INNER JOIN [Color] clr ON pd.ColorID = clr.ColorID "
                    + "INNER JOIN [Category] cat ON p.CateID = cat.CateID";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Map<Integer, Order> orderMap = new HashMap<>();

            while (rs.next()) {
                int orderId = rs.getInt("OrderID");
                Order order = orderMap.get(orderId);

                if (order == null) {
                    order = new Order();
                    order.setOrderId(orderId);
                    order.setFullName(rs.getString("FullName"));
                    order.setPhone(rs.getString("CustomerPhone"));
                    order.setAddress(rs.getString("CustomerAddress"));
                    order.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
                    order.setStatus(rs.getInt("OrderStatus"));
                    order.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    order.setOrderDetails(new ArrayList<>()); // Initialize the orderDetails list
                    orderMap.put(orderId, order);
                    orders.add(order);
                }

                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setQuantity(rs.getInt("OrderQuantity"));
                orderDetail.setPrice(rs.getBigDecimal("OrderPrice"));
                orderDetail.setTotalPrice(rs.getBigDecimal("TotalPrice"));

                Size size = new Size();
                size.setName(rs.getString("SizeName"));

                Color color = new Color();
                color.setName(rs.getString("ColorName"));

                Product product = new Product();
                product.setProductName(rs.getString("ProductName"));
                BigDecimal price = resultSet.getBigDecimal("ProductPrice").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setThumbnail(rs.getString("Thumbnail"));

                Category category = new Category();
                category.setName(rs.getString("CategoryName"));

                orderDetail.setSizeID(rs.getInt("SizeID"));
                orderDetail.setColorID(rs.getInt("ColorID"));
                orderDetail.setProductID(rs.getInt("ColorID"));
//                orderDetail.setCategory(category);

                order.addOrderDetail(orderDetail); // Add OrderDetail to Order
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return orders;
    }

    public List<Order> getCanceledOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT "
                    + "o.OrderID, c.Name AS CustomerName, p.ProductName, cat.Name AS CategoryName, "
                    + "p.Price AS ProductPrice, p.Thumbnail, o.FullName, "
                    + "o.Phone AS CustomerPhone, o.Address AS CustomerAddress, o.OrderDate, "
                    + "o.Status AS OrderStatus, o.TotalAmount, od.Quantity AS OrderQuantity, "
                    + "od.Price AS OrderPrice, (od.Quantity * od.Price) AS TotalPrice, "
                    + "sz.Name AS SizeName, clr.Name AS ColorName "
                    + "FROM [Order] o "
                    + "INNER JOIN [Customer] c ON o.CustomerID = c.CustomerID "
                    + "INNER JOIN [OrderDetail] od ON o.OrderID = od.OrderID "
                    + "INNER JOIN [ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id "
                    + "INNER JOIN [Product] p ON pd.ProductID = p.ProductID "
                    + "INNER JOIN [Size] sz ON pd.SizeID = sz.SizeID "
                    + "INNER JOIN [Color] clr ON pd.ColorID = clr.ColorID "
                    + "INNER JOIN [Category] cat ON p.CateID = cat.CateID WHERE o.Status = 'Cancelled' ";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Map<Integer, Order> orderMap = new HashMap<>();

            while (rs.next()) {
                int orderId = rs.getInt("OrderID");
                Order order = orderMap.get(orderId);

                if (order == null) {
                    order = new Order();
                    order.setOrderId(orderId);
                    order.setFullName(rs.getString("FullName"));
                    order.setPhone(rs.getString("CustomerPhone"));
                    order.setAddress(rs.getString("CustomerAddress"));
                    order.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
                    order.setStatus(rs.getInt("OrderStatus"));
                    order.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    order.setOrderDetails(new ArrayList<>()); // Initialize the orderDetails list
                    orderMap.put(orderId, order);
                    orders.add(order);
                }

                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setQuantity(rs.getInt("OrderQuantity"));
                orderDetail.setPrice(rs.getBigDecimal("OrderPrice"));
                orderDetail.setTotalPrice(rs.getBigDecimal("TotalPrice"));

                Size size = new Size();
                size.setName(rs.getString("SizeName"));

                Color color = new Color();
                color.setName(rs.getString("ColorName"));

                Product product = new Product();
                product.setProductName(rs.getString("ProductName"));
                BigDecimal price = resultSet.getBigDecimal("ProductPrice").setScale(2, RoundingMode.HALF_UP);
                product.setPrice(price);
                product.setThumbnail(rs.getString("Thumbnail"));

                Category category = new Category();
                category.setName(rs.getString("CategoryName"));
//
                orderDetail.setSizeID(rs.getInt("SizeID"));
                orderDetail.setColorID(rs.getInt("ColorID"));
                orderDetail.setProductID(rs.getInt("ColorID"));
//                orderDetail.setCategory(category);

                order.addOrderDetail(orderDetail); // Add OrderDetail to Order
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return orders;
    }

    public Map<String, Object[]> totalMoneyWeek(int from, int to, int year, int month) {
        String sql = "SELECT \n"
                + "    o.OrderDate, \n"
                + "    DATENAME(dw, o.OrderDate) AS DayOfWeek, \n"
                + "    SUM(o.TotalAmount) AS TotalAmount\n"
                + "FROM \n"
                + "    [Order] o\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.Status = os.OrderStatusID\n"
                + "WHERE \n"
                + "    DAY(o.OrderDate) BETWEEN ? AND ?\n"
                + "    AND MONTH(o.OrderDate) = ?\n"
                + "    AND YEAR(o.OrderDate) = ?\n"
                + "    AND os.StatusDetail = 'Delivered'\n"
                + "GROUP BY \n"
                + "    o.OrderDate, \n"
                + "    DATENAME(dw, o.OrderDate);";

        Map<String, Object[]> results = new LinkedHashMap<>(); // Use LinkedHashMap to maintain insertion order

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, from);
            st.setInt(2, to);
            st.setInt(3, month);
            st.setInt(4, year);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    String dayOfWeek = rs.getString("DayOfWeek");
                    Date orderDate = rs.getDate("OrderDate");
                    Double totalAmount = rs.getDouble("TotalAmount");

                    // Store the values in an Object array
                    Object[] result = new Object[]{orderDate, totalAmount};
                    results.put(dayOfWeek, result);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the error if necessary
        }

        return results;
    }

    public Map<String, Object[]> getCancelledAndTotalOrdersLast7Days(int from, int to, int year, int month) {
        String sql = "SELECT \n"
                + "    CAST(o.OrderDate AS DATE) AS OrderDate, \n"
                + "    DATENAME(WEEKDAY, o.OrderDate) AS DayOfWeek,\n"
                + "    SUM(CASE WHEN os.StatusDetail = 'Delivered' THEN 1 ELSE 0 END) AS SuccessfulOrders,\n"
                + "    SUM(CASE WHEN os.StatusDetail = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledOrders,\n"
                + "    SUM(CASE WHEN os.StatusDetail = 'Pending' THEN 1 ELSE 0 END) AS PendingOrders,\n"
                + "    SUM(CASE WHEN os.StatusDetail = 'Processing' THEN 1 ELSE 0 END) AS ProcessingOrders\n"
                + "FROM \n"
                + "    [Order] o\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.Status = os.OrderStatusID\n"
                + "WHERE \n"
                + "    DAY(o.OrderDate) BETWEEN ? AND ?\n"
                + "    AND MONTH(o.OrderDate) = ?\n"
                + "    AND YEAR(o.OrderDate) = ?\n"
                + "GROUP BY \n"
                + "    CAST(o.OrderDate AS DATE), \n"
                + "    DATENAME(WEEKDAY, o.OrderDate);";

        Map<String, Object[]> results = new HashMap<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, from);
            st.setInt(2, to);
            st.setInt(3, month);
            st.setInt(4, year);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    String dayOfWeek = rs.getString("DayOfWeek");
                    Date orderDate = rs.getDate("OrderDate");
                    double[] orderCounts = new double[]{
                        rs.getDouble("SuccessfulOrders"),
                        rs.getDouble("CancelledOrders"),
                        rs.getDouble("PendingOrders"),
                        rs.getDouble("ProcessingOrders")
                    };
                    results.put(dayOfWeek, new Object[]{orderDate, orderCounts});
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Integer> getSuccessAndTotalOrdersLast7Days() {
        List<Integer> ordersCount = new ArrayList<>();
        LocalDate today = LocalDate.now();
        LocalDate weekAgo = today.minusDays(6);

        String sqlTotalOrders = "SELECT COUNT(*) FROM [Order] WHERE CONVERT(date, OrderDate) = ?";
        String sqlDelivered = "SELECT COUNT(*) FROM [Order] WHERE CONVERT(date, OrderDate) = ? AND Status = 'Delivered'";

        try {
            for (LocalDate date = weekAgo; date.isBefore(today.plusDays(1)); date = date.plusDays(1)) {
                int totalOrders = 0;
                int totalDelivered = 0;

                try (PreparedStatement stmTotalOrders = connection.prepareStatement(sqlTotalOrders); PreparedStatement stmDelivered = connection.prepareStatement(sqlDelivered)) {

                    stmTotalOrders.setDate(1, java.sql.Date.valueOf(date));
                    try (ResultSet rsTotalOrders = stmTotalOrders.executeQuery()) {
                        if (rsTotalOrders.next()) {
                            totalOrders = rsTotalOrders.getInt(1);
                        }
                    }

                    stmDelivered.setDate(1, java.sql.Date.valueOf(date));
                    try (ResultSet rsDelivered = stmDelivered.executeQuery()) {
                        if (rsDelivered.next()) {
                            totalDelivered = rsDelivered.getInt(1);
                        }
                    }
                }

                // Add both counts to the list
                ordersCount.add(totalDelivered);
                ordersCount.add(totalOrders); // Adding total orders as well
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ordersCount;
    }

    public List<Order> getOrdersStatus() {
        List<Order> orders = new ArrayList<>();

        try {
            String sql = "SELECT \n"
                    + "    OrderID,\n"
                    + "    FullName AS CustomerName,\n"
                    + "    TotalAmount,\n"
                    + "    OrderDate,\n"
                    + "    Status\n"
                    + "FROM \n"
                    + "    [dbo].[Order];";

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("OrderID"));
                o.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
                o.setFullName(rs.getString("CustomerName")); // Sử dụng CustomerName thay vì FullName
                o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                o.setStatus(rs.getInt("Status"));

                orders.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    public void updateOrderStatus(int id) {
        String sql = "UPDATE [dbo].[Order] SET [Status] = 'Delivered' WHERE [OrderID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

}
