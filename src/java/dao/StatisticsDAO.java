/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ngock
 */
import context.DBContext;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

public class StatisticsDAO extends DBContext{
   PreparedStatement stm; //thực hiện câu lệnh sql
    ResultSet rs; //lưu trữ dữ liệu lấy về từ câu lệnh select
    
       public int getNumberOfBlogs() throws SQLException {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM Blog";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch(SQLException e) {
           e.printStackTrace();
        }
        return count;
    }

    public int getNumberOfProducts() throws SQLException {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM Product";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        
        }catch(SQLException e){
             e.printStackTrace();
        }
        return count;
    }

    public int getNumberOfCustomers() throws SQLException {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM Customer";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getNumberOfFeedbacks() throws SQLException {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM Feedback";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch(SQLException e) {
             e.printStackTrace();
        }
        return count;
    }

   public Map<String, Integer> getNewCustomersTrend(String startDate, String endDate) throws SQLException  {
    Map<String, Integer> trend = new HashMap<>();
   
       try {
           String sql = "SELECT CONVERT(VARCHAR, CreatedDate, 23) AS date, COUNT(*) AS count \n"
                   + "FROM Customer \n"
                   + "WHERE CONVERT(VARCHAR, CreatedDate, 23) BETWEEN ? AND ?\n"
                   + "GROUP BY CONVERT(VARCHAR, CreatedDate, 23) \n"
                   + "ORDER BY date;";
         stm = connection.prepareStatement(sql); 
        stm.setString(1, startDate);
        stm.setString(2, endDate);
         rs = stm.executeQuery() ;
            while (rs.next()) {
                trend.put(rs.getString("date"), rs.getInt("count"));
            }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return trend;
}

}
//     public static void main(String[] args) {
//        StatisticsDAO dao = new StatisticsDAO();
//
//        try {
//            int numberOfBlogs = dao.getNumberOfBlogs();
//            int numberOfProducts = dao.getNumberOfProducts();
//            int numberOfCustomers = dao.getNumberOfCustomers();
//            int numberOfFeedbacks = dao.getNumberOfFeedbacks();
//            Map<String, Integer> newCustomersTrend = dao.getNewCustomersTrend(7);
//
//            System.out.println("Number of blogs: " + numberOfBlogs);
//            System.out.println("Number of products: " + numberOfProducts);
//            System.out.println("Number of customers: " + numberOfCustomers);
//            System.out.println("Number of feedbacks: " + numberOfFeedbacks);
//            System.out.println("New customers trend (last 7 days):");
//            for (Map.Entry<String, Integer> entry : newCustomersTrend.entrySet()) {
//                System.out.println(entry.getKey() + ": " + entry.getValue());
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }

//public List<CustomerTrend> getNewCustomersTrend(String startDate, String endDate) {
//    List<CustomerTrend> trend = new ArrayList<>();
//    try {
//        String sql = "SELECT CAST(CreatedDate AS DATE) AS date, COUNT(*) AS count "
//                + "FROM Customer "
//                + "WHERE CreatedDate BETWEEN ? AND ? "
//                + "GROUP BY CAST(CreatedDate AS DATE) "
//                + "ORDER BY date";
//        stm = connection.prepareStatement(sql);
//        stm.setString(1, startDate);
//        stm.setString(2, endDate);
//        rs = stm.executeQuery();
//        while (rs.next()) {
//            trend.add(new CustomerTrend(rs.getString("date"), rs.getInt("count")));
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//    return trend;
//}