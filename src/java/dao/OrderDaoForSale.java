/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Color;
import model.Order;
import model.OrderDetailsForSale;
import model.OrderStatus;
import model.PaymentMethod;
import model.Product;
import model.ProductDetails;
import model.Size;

/**
 *
 * @author acer
 */
public class OrderDaoForSale extends DBContext {

    public List<Order> getAllOrders() {
        List<Order> detailsList = new ArrayList<>();

        String sql = """
                     SELECT 
                                                  o.OrderID, 
                                                  o.OrderDate, 
                                                  o.CustomerID,
                                                  o.FullName,
                                                  MIN(p.ProductName) AS ProductNames, 
                                                  COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                                                  o.TotalAmount, 
                                                  o.Status,
                                                  os.StatusDetail,
                                                  acc.AccountID,
                         						 o.MethodID,
                         						 pm.Method,
                                                  acc.Name
                                              FROM 
                                                  [dbo].[Order] o
                                              JOIN 
                                                  [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                                              JOIN 
                                                  [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id
                                              JOIN
                                                  [dbo].[Product] p ON pd.ProductID = p.ProductID
                                              JOIN 
                                                  [dbo].[Account] acc ON acc.AccountID = o.SaleID
                                              JOIN 
                                                  Customer c ON c.CustomerID = o.CustomerID
                                              JOIN 
                                                  OrderStatus os ON os.OrderStatusID = o.Status
                         					JOIN PaymentMethod pm on pm.ID = o.MethodID
                                              GROUP BY
                                                  o.OrderID, 
                                                  o.OrderDate, 
                                                  o.CustomerID,
                                                  o.FullName,
                                                  o.TotalAmount, 
                                                  o.Status, 
                                                  acc.AccountID,
                                                  os.StatusDetail,
                                                  acc.Name,
                         						 o.MethodID,
                         						 pm.Method""";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("OrderID"));
                LocalDateTime orderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                o.setOrderDate(orderDate);
                o.setCustomerId(rs.getInt("CustomerID"));
                o.setFullName(rs.getString("FullName"));
                o.setProductName(rs.getString("ProductNames"));
                o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));

                Account acc = new Account();
                acc.setAccountID(rs.getInt("AccountID"));
                acc.setName(rs.getString("Name"));
                o.setAccount(acc);

                OrderStatus os = new OrderStatus();
                os.setId(rs.getInt("Status"));
                os.setName(rs.getString("StatusDetail"));
                PaymentMethod pm = new PaymentMethod();
                pm.setId(rs.getInt("MethodID"));
                pm.setMethod(rs.getString("Method"));
                o.setMethod(pm);
                o.setOrderStatus(os);

                detailsList.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public List<Order> getAllOrdersByStatus(String status) {
        List<Order> detailsList = new ArrayList<>();

        String sql = """
                     SELECT 
                         o.OrderID, 
                         o.OrderDate, 
                         o.CustomerID,
                         o.FullName,
                         MIN(p.ProductName) AS ProductNames, 
                         COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                         o.TotalAmount, 
                         o.Status,
                         os.StatusDetail,
                         acc.AccountID,
                         acc.Name
                     FROM 
                         [dbo].[Order] o
                     JOIN 
                         [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                     JOIN 
                         [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id
                     JOIN
                         [dbo].[Product] p ON pd.ProductID = p.ProductID
                     JOIN 
                         [dbo].[Account] acc ON acc.AccountID = o.SaleID
                     JOIN 
                         Customer c ON c.CustomerID = o.CustomerID
                     JOIN 
                         OrderStatus os ON os.OrderStatusID = o.Status
                     WHERE 
                         os.OrderStatusID = ?
                     GROUP BY
                         o.OrderID, 
                         o.OrderDate, 
                         o.CustomerID,
                         o.FullName,
                         o.TotalAmount, 
                         o.Status, 
                         acc.AccountID,
                         os.StatusDetail,
                         acc.Name;""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, status);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime orderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    o.setOrderDate(orderDate);
                    o.setCustomerId(rs.getInt("CustomerID"));
                    o.setFullName(rs.getString("FullName"));
                    o.setProductName(rs.getString("ProductNames"));
                    o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));

                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setName(rs.getString("Name"));
                    o.setAccount(acc);

                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    o.setOrderStatus(os);

                    detailsList.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public List<Order> getAllOrdersBySale(String saleID) {
        List<Order> detailsList = new ArrayList<>();

        String sql = """
                     SELECT 
                         o.OrderID, 
                         o.OrderDate, 
                         o.CustomerID,
                         o.FullName,
                         MIN(p.ProductName) AS ProductNames, 
                         COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                         o.TotalAmount, 
                         o.Status,
                         os.StatusDetail,
                         acc.AccountID,
                         acc.Name
                     FROM 
                         [dbo].[Order] o
                     JOIN 
                         [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                     JOIN 
                         [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id
                     JOIN
                         [dbo].[Product] p ON pd.ProductID = p.ProductID
                     JOIN 
                         [dbo].[Account] acc ON acc.AccountID = o.SaleID
                     JOIN 
                         Customer c ON c.CustomerID = o.CustomerID
                     JOIN 
                         OrderStatus os ON os.OrderStatusID = o.Status
                     WHERE 
                         acc.AccountID = ?
                     GROUP BY
                         o.OrderID, 
                         o.OrderDate, 
                         o.CustomerID,
                         o.FullName,
                         o.TotalAmount, 
                         o.Status, 
                         acc.AccountID,
                         os.StatusDetail,
                         acc.Name;""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, saleID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime orderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    o.setOrderDate(orderDate);
                    o.setCustomerId(rs.getInt("CustomerID"));
                    o.setFullName(rs.getString("FullName"));
                    o.setProductName(rs.getString("ProductNames"));
                    o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));

                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setName(rs.getString("Name"));
                    o.setAccount(acc);

                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    o.setOrderStatus(os);

                    detailsList.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public List<OrderDetailsForSale> getOrderDetails(int orderID) {
        List<OrderDetailsForSale> detailsList = new ArrayList<>();

        String sql = "SELECT o.OrderID, o.OrderDate, p.Thumbnail, p.ProductName, s.Name as SizeName, c.Name as ColorName, "
                + "od.Quantity, od.Price, od.TotalPrice, o.TotalAmount, o.FullName, o.Phone, o.Address, od.SaleNote, "
                + "o.Status, os.StatusDetail, o.SaleID, acc.Name as SaleName, o.MethodID, pm.Method "
                + "FROM OrderDetail od "
                + "JOIN [Order] o ON o.OrderID = od.OrderID "
                + "JOIN ProductDetails pd ON pd.Product_Detail_id = od.Product_Detail_Id "
                + "JOIN Product p ON p.ProductID = pd.ProductID "
                + "JOIN Size s ON s.SizeID = pd.SizeID "
                + "JOIN Color c ON c.ColorID = pd.ColorID "
                + "JOIN OrderStatus os ON os.OrderStatusID = o.Status "
                + "JOIN Account acc ON acc.AccountID = o.SaleID join PaymentMethod pm on pm.ID = o.MethodID "
                + "WHERE o.OrderID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetailsForSale od = new OrderDetailsForSale();

                    Order order = new Order();
                    order.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime orderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    order.setOrderDate(orderDate);

                    ProductDetails pd = new ProductDetails();
                    Product p = new Product();
                    p.setThumbnail(rs.getString("Thumbnail"));
                    p.setProductName(rs.getString("ProductName"));

                    Size size = new Size();
                    size.setName(rs.getString("SizeName"));

                    Color color = new Color();
                    color.setName(rs.getString("ColorName"));

                    pd.setProduct(p);
                    pd.setSize(size);
                    pd.setColor(color);

                    od.setPrice(rs.getDouble("Price"));
                    od.setQuantity(rs.getInt("Quantity"));
                    od.setTotal(rs.getDouble("TotalPrice"));

                    order.setFullName(rs.getString("FullName"));
                    order.setPhone(rs.getString("Phone"));
                    order.setAddress(rs.getString("Address"));
                    order.setTotalAmount(rs.getBigDecimal("TotalAmount"));

                    od.setSaleNote(rs.getString("SaleNote"));

                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    PaymentMethod pm = new PaymentMethod();
                    pm.setId(rs.getInt("MethodID"));
                    pm.setMethod(rs.getString("Method"));
                    order.setMethod(pm);

                    order.setOrderStatus(os);

                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("SaleID"));
                    acc.setName(rs.getString("SaleName"));

                    order.setAccount(acc);

                    od.setOrder(order);
                    od.setProductDetails(pd);

                    detailsList.add(od);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public List<OrderStatus> getOrderStatus() {
        List<OrderStatus> detailsList = new ArrayList<>();

        String sql = "select * from OrderStatus";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("OrderStatusID"));
                    os.setName(rs.getString("StatusDetail"));
                    detailsList.add(os);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public void updateSale(int orderID, int saleID) {
        String sql = "UPDATE [dbo].[Order] SET SaleID = ? WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, saleID);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateStatus(int orderID, int status) {
        if (status == 7 || status == 8) {
            try {
                String sql2 = """
                              select * from dbo.[Order] o join OrderDetail od on
                              o.OrderID=od.OrderID
                              where o.OrderID = ?""";
                PreparedStatement pre = connection.prepareStatement(sql2);
                pre.setInt(1, orderID);
                ResultSet rst = pre.executeQuery();
                   CartDAO cd = new CartDAO();
                while(rst.next()){
                    cd.updateQuantityAfterOrder(rst.getInt("Product_Detail_id"), -rst.getInt("Quantity"));
                }
            } catch (SQLException e) {
            }
        }
        String sql = "UPDATE [dbo].[Order] SET Status = ? WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getAllOrdersOfSale(int saleID) {
        List<Order> detailsList = new ArrayList<>();

        String sql = """
                     SELECT 
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              MIN(p.ProductName) AS ProductNames, 
                                              COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                                              o.TotalAmount, 
                                              o.Status,
                                              os.StatusDetail,
                                              acc.AccountID,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method
                                          FROM 
                                              [dbo].[Order] o
                                          JOIN 
                                              [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                                          JOIN 
                                              [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id
                                          JOIN
                                              [dbo].[Product] p ON pd.ProductID = p.ProductID
                                          JOIN 
                                              [dbo].[Account] acc ON acc.AccountID = o.SaleID
                                          JOIN 
                                              Customer c ON c.CustomerID = o.CustomerID
                                          JOIN 
                                              OrderStatus os ON os.OrderStatusID = o.Status
                     \t\t\t\t\t\t JOIN PaymentMethod pm on pm.ID = o.MethodID
                                          WHERE 
                                              o.SaleID = ? and (os.OrderStatusID between 1 and 5 or os.OrderStatusID = 8)
                                          GROUP BY
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              o.TotalAmount, 
                                              o.Status, 
                                              acc.AccountID,
                                              os.StatusDetail,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, saleID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime OrderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    o.setOrderDate(OrderDate);
                    o.setCustomerId(rs.getInt("CustomerID"));
                    o.setFullName(rs.getString("FullName"));
                    o.setProductName(rs.getString("ProductNames"));
                    o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));
                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setName(rs.getString("Name"));
                    o.setAccount(acc);
                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    o.setOrderStatus(os);
                    PaymentMethod pm = new PaymentMethod();
                    pm.setId(rs.getInt("MethodID"));
                    pm.setMethod(rs.getString("Method"));
                    o.setMethod(pm);
                    detailsList.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public void updateSaleNote(String saleNote, int orderID) {
        String sql = "UPDATE [dbo].[OrderDetail] SET SaleNote = ? WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, saleNote);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Account> getSales() {
        List<Account> salesAccounts = new ArrayList<>();
        String sql = "SELECT s.AccountID, s.Name, COUNT(o.OrderID) AS TotalOrders\n"
                + "FROM Account s\n"
                + "LEFT JOIN [Order] o ON s.AccountID = o.SaleID\n"
                + "where s.RoleID = 4\n"
                + "GROUP BY s.AccountID, s.Name\n"
                + "ORDER BY s.AccountID;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt("AccountID"));
                account.setName(rs.getString("Name"));
                account.setTotalOrder(rs.getInt("TotalOrders"));
                salesAccounts.add(account);
            }
        } catch (Exception e) {
        }
        return salesAccounts;
    }

    public List<Order> getAllOrdersOfSaleByString(int saleID, String key) {
        List<Order> detailsList = new ArrayList<>();

        String sql = "SELECT \n"
                + "    o.OrderID, \n"
                + "    o.OrderDate, \n"
                + "    o.CustomerID,\n"
                + "    o.FullName,\n"
                + "    MIN(p.ProductName) AS ProductNames, \n"
                + "    COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, \n"
                + "    o.TotalAmount, \n"
                + "    o.Status,\n"
                + "    os.StatusDetail,\n"
                + "    acc.AccountID,\n"
                + "    acc.Name\n"
                + "FROM \n"
                + "    [dbo].[Order] o\n"
                + "JOIN \n"
                + "    [dbo].[OrderDetail] od ON o.OrderID = od.OrderID\n"
                + "JOIN \n"
                + "    [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id\n"
                + "JOIN\n"
                + "    [dbo].[Product] p ON pd.ProductID = p.ProductID\n"
                + "JOIN \n"
                + "    [dbo].[Account] acc ON acc.AccountID = o.SaleID\n"
                + "JOIN \n"
                + "    Customer c ON c.CustomerID = o.CustomerID\n"
                + "JOIN \n"
                + "    OrderStatus os ON os.OrderStatusID = o.Status\n"
                + "WHERE \n"
                + "    o.SaleID = ? \n"
                + "    AND os.StatusDetail = 'Pending'  \n"
                + "    AND (p.ProductName LIKE ? OR c.Name LIKE ?)\n"
                + "GROUP BY\n"
                + "    o.OrderID, \n"
                + "    o.OrderDate, \n"
                + "    o.CustomerID,\n"
                + "    o.FullName,\n"
                + "    o.TotalAmount, \n"
                + "    o.Status, \n"
                + "    acc.AccountID,\n"
                + "    os.StatusDetail,\n"
                + "    acc.Name;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, saleID);
            st.setString(2, "%" + key + "%");
            st.setString(3, "%" + key + "%");

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime OrderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    o.setOrderDate(OrderDate);
                    o.setCustomerId(rs.getInt("CustomerID"));
                    o.setFullName(rs.getString("FullName"));
                    o.setProductName(rs.getString("ProductNames"));
                    o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));
                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setName(rs.getString("Name"));
                    o.setAccount(acc);
                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    o.setOrderStatus(os);
                    detailsList.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public int getSaleOrderLeast() {
        String sql = "SELECT top 1 a.AccountID, a.Name ,COUNT(o.OrderID) AS NumberOfOrders\n"
                + "FROM Account a\n"
                + "LEFT JOIN [Order] o ON a.AccountID = o.SaleID\n"
                + "WHERE a.RoleID = 4\n"
                + "GROUP BY a.AccountID, a.Name\n"
                + "ORDER BY NumberOfOrders ASC";
        int accountID = 0;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    accountID = rs.getInt("AccountID");
                }
            }

        } catch (Exception e) {
        }
        return accountID;
    }

    public static void main(String[] args) {
        OrderDaoForSale os = new OrderDaoForSale();

        List<Order> detailsList3 = os.getAllOrdersForStaff();
        for (Order order : detailsList3) {
            System.out.println(order.getFullName());
        }
        int a = os.getSaleOrderLeast();
        System.out.println(a);

    }

    public List<Order> getAllOrdersForStaff() {
        List<Order> detailsList = new ArrayList<>();

        String sql = "SELECT \n"
                + "    o.OrderID, \n"
                + "    o.OrderDate, \n"
                + "    o.CustomerID,\n"
                + "    o.FullName,\n"
                + "    MIN(p.ProductName) AS ProductNames, \n"
                + "    COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, \n"
                + "    o.TotalAmount, \n"
                + "    o.Status,\n"
                + "    os.StatusDetail,\n"
                + "    acc.AccountID,\n"
                + "    acc.Name,\n"
                + "	o.MethodID,\n"
                + "	pm.Method\n"
                + "FROM \n"
                + "    [dbo].[Order] o\n"
                + "JOIN \n"
                + "    [dbo].[OrderDetail] od ON o.OrderID = od.OrderID\n"
                + "JOIN \n"
                + "    [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id\n"
                + "JOIN\n"
                + "    [dbo].[Product] p ON pd.ProductID = p.ProductID\n"
                + "JOIN \n"
                + "    [dbo].[Account] acc ON acc.AccountID = o.SaleID\n"
                + "JOIN \n"
                + "    Customer c ON c.CustomerID = o.CustomerID\n"
                + "JOIN \n"
                + "    OrderStatus os ON os.OrderStatusID = o.Status\n"
                + "JOIN PaymentMethod pm on pm.ID = o.MethodID\n"
                + "WHERE \n"
                + "     os.StatusDetail = 'Confirm' or os.StatusDetail = 'Packing'  \n"
                + "GROUP BY\n"
                + "    o.OrderID, \n"
                + "    o.OrderDate, \n"
                + "    o.CustomerID,\n"
                + "    o.FullName,\n"
                + "    o.TotalAmount, \n"
                + "    o.Status, \n"
                + "    acc.AccountID,\n"
                + "    os.StatusDetail,\n"
                + "    acc.Name,\n"
                + "	o.MethodID,\n"
                + "	pm.Method";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("OrderID"));
                LocalDateTime orderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                o.setOrderDate(orderDate);
                o.setCustomerId(rs.getInt("CustomerID"));
                o.setFullName(rs.getString("FullName"));
                o.setProductName(rs.getString("ProductNames"));
                o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));

                Account acc = new Account();
                acc.setAccountID(rs.getInt("AccountID"));
                acc.setName(rs.getString("Name"));
                o.setAccount(acc);

                OrderStatus os = new OrderStatus();
                os.setId(rs.getInt("Status"));
                os.setName(rs.getString("StatusDetail"));
                o.setOrderStatus(os);

                PaymentMethod pm = new PaymentMethod();
                pm.setId(rs.getInt("MethodID"));
                pm.setMethod(rs.getString("Method"));
                o.setMethod(pm);
                detailsList.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public List<Order> getOrderListByPage(List<Order> orders, int start, int end) {
        ArrayList<Order> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(orders.get(i));
        }
        return arr;
    }

    public List<Order> getOrdersOfSaleByStatus(int accID, String statusId) {
        List<Order> detailsList = new ArrayList<>();

        String sql = """
                     SELECT 
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              MIN(p.ProductName) AS ProductNames, 
                                              COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                                              o.TotalAmount, 
                                              o.Status,
                                              os.StatusDetail,
                                              acc.AccountID,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method
                                          FROM 
                                              [dbo].[Order] o
                                          JOIN 
                                              [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                                          JOIN 
                                              [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id
                                          JOIN
                                              [dbo].[Product] p ON pd.ProductID = p.ProductID
                                          JOIN 
                                              [dbo].[Account] acc ON acc.AccountID = o.SaleID
                                          JOIN 
                                              Customer c ON c.CustomerID = o.CustomerID
                                          JOIN 
                                              OrderStatus os ON os.OrderStatusID = o.Status
                     \t\t\t\t\t\t JOIN PaymentMethod pm on pm.ID = o.MethodID
                                          WHERE 
                                              o.SaleID = ? and os.OrderStatusID = ?
                                          GROUP BY
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              o.TotalAmount, 
                                              o.Status, 
                                              acc.AccountID,
                                              os.StatusDetail,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accID);
            st.setString(2, statusId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime OrderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    o.setOrderDate(OrderDate);
                    o.setCustomerId(rs.getInt("CustomerID"));
                    o.setFullName(rs.getString("FullName"));
                    o.setProductName(rs.getString("ProductNames"));
                    o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));
                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setName(rs.getString("Name"));
                    o.setAccount(acc);
                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    o.setOrderStatus(os);
                    PaymentMethod pm = new PaymentMethod();
                    pm.setId(rs.getInt("MethodID"));
                    pm.setMethod(rs.getString("Method"));
                    o.setMethod(pm);
                    detailsList.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public List<Order> getOrdersOfSaleByOrderId(int accID, String orderId) {
        List<Order> detailsList = new ArrayList<>();

        String sql = """
                     SELECT 
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              MIN(p.ProductName) AS ProductNames, 
                                              COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                                              o.TotalAmount, 
                                              o.Status,
                                              os.StatusDetail,
                                              acc.AccountID,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method
                                          FROM 
                                              [dbo].[Order] o
                                          JOIN 
                                              [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                                          JOIN 
                                              [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id
                                          JOIN
                                              [dbo].[Product] p ON pd.ProductID = p.ProductID
                                          JOIN 
                                              [dbo].[Account] acc ON acc.AccountID = o.SaleID
                                          JOIN 
                                              Customer c ON c.CustomerID = o.CustomerID
                                          JOIN 
                                              OrderStatus os ON os.OrderStatusID = o.Status
                     \t\t\t\t\t\t JOIN PaymentMethod pm on pm.ID = o.MethodID
                                          WHERE 
                                          o.SaleID = ?
                                          and o.OrderID like ?
                                          and (os.OrderStatusID between 1 and 5 or os.OrderStatusID = 8)
                                          GROUP BY
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              o.TotalAmount, 
                                              o.Status, 
                                              acc.AccountID,
                                              os.StatusDetail,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accID);
            st.setString(2, "%" + orderId + "%");
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime OrderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    o.setOrderDate(OrderDate);
                    o.setCustomerId(rs.getInt("CustomerID"));
                    o.setFullName(rs.getString("FullName"));
                    o.setProductName(rs.getString("ProductNames"));
                    o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));
                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setName(rs.getString("Name"));
                    o.setAccount(acc);
                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    o.setOrderStatus(os);
                    PaymentMethod pm = new PaymentMethod();
                    pm.setId(rs.getInt("MethodID"));
                    pm.setMethod(rs.getString("Method"));
                    o.setMethod(pm);
                    detailsList.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public List<OrderStatus> getListStatusOfSale() {
        List<OrderStatus> list = new ArrayList<>();
        String sql = "select * from OrderStatus\n"
                + "where (OrderStatusID between 1 and 5) or OrderStatusID = 8";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                OrderStatus os = new OrderStatus();
                os.setId(resultSet.getInt("OrderStatusID"));
                os.setName(resultSet.getString("StatusDetail"));
                list.add(os);
            }

        } catch (Exception e) {
        }

        return list;
    }

    public List<Order> getOrdersByOrderId(String orderId) {
        List<Order> detailsList = new ArrayList<>();

        String sql = """
                     SELECT 
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              MIN(p.ProductName) AS ProductNames, 
                                              COUNT(DISTINCT od.Product_Detail_Id) - 1 AS NumberOfOtherProducts, 
                                              o.TotalAmount, 
                                              o.Status,
                                              os.StatusDetail,
                                              acc.AccountID,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method
                                          FROM 
                                              [dbo].[Order] o
                                          JOIN 
                                              [dbo].[OrderDetail] od ON o.OrderID = od.OrderID
                                          JOIN 
                                              [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id
                                          JOIN
                                              [dbo].[Product] p ON pd.ProductID = p.ProductID
                                          JOIN 
                                              [dbo].[Account] acc ON acc.AccountID = o.SaleID
                                          JOIN 
                                              Customer c ON c.CustomerID = o.CustomerID
                                          JOIN 
                                              OrderStatus os ON os.OrderStatusID = o.Status
                     \t\t\t\t\t\t JOIN PaymentMethod pm on pm.ID = o.MethodID
                                          WHERE 
                                             o.OrderID like ?
                                          and (os.OrderStatusID between 1 and 5 or os.OrderStatusID = 8)
                                          GROUP BY
                                              o.OrderID, 
                                              o.OrderDate, 
                                              o.CustomerID,
                                              o.FullName,
                                              o.TotalAmount, 
                                              o.Status, 
                                              acc.AccountID,
                                              os.StatusDetail,
                                              acc.Name,
                     \t\t\t\t\t\t o.MethodID,
                     \t\t\t\t\t\t pm.Method""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {

            st.setString(1, "%" + orderId + "%");
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setOrderId(rs.getInt("OrderID"));
                    LocalDateTime OrderDate = rs.getTimestamp("OrderDate").toLocalDateTime();
                    o.setOrderDate(OrderDate);
                    o.setCustomerId(rs.getInt("CustomerID"));
                    o.setFullName(rs.getString("FullName"));
                    o.setProductName(rs.getString("ProductNames"));
                    o.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                    o.setCountOtherproduct(rs.getInt("NumberOfOtherProducts"));
                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setName(rs.getString("Name"));
                    o.setAccount(acc);
                    OrderStatus os = new OrderStatus();
                    os.setId(rs.getInt("Status"));
                    os.setName(rs.getString("StatusDetail"));
                    o.setOrderStatus(os);
                    PaymentMethod pm = new PaymentMethod();
                    pm.setId(rs.getInt("MethodID"));
                    pm.setMethod(rs.getString("Method"));
                    o.setMethod(pm);
                    detailsList.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

}
