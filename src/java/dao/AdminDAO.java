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
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ngock
 */
public class AdminDAO extends DBContext {

    PreparedStatement stm; //thực hiện câu lệnh sql
    ResultSet rs; //lưu trữ dữ liệu lấy về từ câu lệnh select{

    // cho admin dashboard
    public int getTotalOrderCount() {
        int totalOrders = 0;
        try {
            String query = "SELECT COUNT(*) AS TotalOrders FROM [Order]";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("TotalOrders");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalOrders;
    }

    public int getNewOrderCountByStatus(int status) {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS Count FROM [Order] WHERE Status = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, status);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("Count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getSubmittedOrderCount() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS Count FROM [Order] WHERE Status IN (1, 2, 3, 4)";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("Count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public BigDecimal getTotalRevenue() {
        BigDecimal totalRevenue = BigDecimal.ZERO;
        try {
            String query = "SELECT SUM(TotalAmount) AS TotalRevenue FROM [Order]";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                totalRevenue = rs.getBigDecimal("TotalRevenue");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }

    public Map<String, BigDecimal> getRevenueByCategory() {
        Map<String, BigDecimal> revenueByCategory = new HashMap<>();
        try {
            String query = "SELECT c.Name, SUM(od.TotalPrice) AS Revenue "
                    + "FROM [Order] o "
                    + "JOIN OrderDetail od ON o.OrderID = od.OrderID "
                    + "JOIN Product p ON od.Product_Detail_Id = p.ProductID "
                    + "JOIN Category c ON p.CateID = c.CateID "
                    + "GROUP BY c.Name";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                String category = rs.getString("Name");
                BigDecimal revenue = rs.getBigDecimal("Revenue");
                revenueByCategory.put(category, revenue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueByCategory;
    }

    public int getTotalCustomerCount() {
        int totalCustomers = 0;
        try {
            String query = "SELECT COUNT(*) AS TotalCustomers FROM Customer";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalCustomers = rs.getInt("TotalCustomers");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalCustomers;
    }

    public Map<String, Integer> getNewlyRegisteredCustomersCountByDay() {
        Map<String, Integer> customersCountByDay = new HashMap<>();
        String query = "SELECT CONVERT(VARCHAR, CreatedDate, 23) as Day, COUNT(*) as Count "
                + "FROM Customer WHERE CreatedDate >= DATEADD(day, -7, GETDATE()) "
                + "GROUP BY CONVERT(VARCHAR, CreatedDate, 23)";
        try (PreparedStatement stm = connection.prepareStatement(query); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                String day = rs.getString("Day");
                int count = rs.getInt("Count");
                customersCountByDay.put(day, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customersCountByDay;
    }

    public Map<String, Integer> getNewlyBoughtCustomersCountByDay() {
        Map<String, Integer> customersCountByDay = new HashMap<>();
        String query = "SELECT CONVERT(VARCHAR, o.OrderDate, 23) as Day, COUNT(DISTINCT c.CustomerID) as Count "
                + "FROM [Order] o "
                + "JOIN Customer c ON o.CustomerID = c.CustomerID "
                + "WHERE o.OrderDate >= DATEADD(day, -7, GETDATE()) "
                + "GROUP BY CONVERT(VARCHAR, o.OrderDate, 23)";
        try (PreparedStatement stm = connection.prepareStatement(query); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                String day = rs.getString("Day");
                int count = rs.getInt("Count");
                customersCountByDay.put(day, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customersCountByDay;
    }

    public int getTotalFeedbackCount() {
        int totalFeedbacks = 0;
        try {
            String query = "SELECT COUNT(*) AS TotalFeedbacks FROM Feedback";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalFeedbacks = rs.getInt("TotalFeedbacks");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalFeedbacks;
    }

    public double getAverageFeedbackStars() {
        double averageStars = 0.0;
        try {
            String query = "SELECT AVG(RateStar) AS AverageStars FROM Feedback";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                averageStars = rs.getDouble("AverageStars");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return averageStars;
    }

    public Map<String, Double> getAverageFeedbackStarsByCategory() {
        Map<String, Double> avgStarsByCategory = new HashMap<>();
        try {
            String query = "SELECT c.Name, AVG(f.RateStar) AS AverageStars "
                    + "FROM Feedback f "
                    + "JOIN Product p ON f.ProductID = p.ProductID "
                    + "JOIN Category c ON p.CateID = c.CateID "
                    + "GROUP BY c.Name";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String category = rs.getString("Name");
                double avgStars = rs.getDouble("AverageStars");
                avgStarsByCategory.put(category, avgStars);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return avgStarsByCategory;
    }

    public Map<String, Map<String, Integer>> getOrderTrend(String startDate, String endDate) throws SQLException {
        Map<String, Map<String, Integer>> orderTrend = new HashMap<>();

        String query = "SELECT CONVERT(VARCHAR, CAST(o.OrderDate AS DATE), 23) as Day, "
                + "COUNT(*) AS TotalOrders, "
                + "COUNT(CASE WHEN o.Status = 5 THEN 1 END) AS SuccessfulOrders "
                + "FROM [Order] o "
                + "JOIN Customer c ON o.CustomerID = c.CustomerID "
                + "WHERE CAST(o.OrderDate AS DATE) BETWEEN ? AND ? "
                + "GROUP BY CONVERT(VARCHAR, CAST(o.OrderDate AS DATE), 23)";

        try (PreparedStatement stm = connection.prepareStatement(query)) {
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String orderDay = rs.getString("Day");
                int totalOrders = rs.getInt("TotalOrders");
                int successfulOrders = rs.getInt("SuccessfulOrders");

                Map<String, Integer> dayTrend = new HashMap<>();
                dayTrend.put("TotalOrders", totalOrders);
                dayTrend.put("SuccessfulOrders", successfulOrders);

                orderTrend.put(orderDay, dayTrend);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderTrend;
    }

}
