/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.FeedBack;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84976
 */
public class FeedBackDAO extends DBContext {

    public List<FeedBack> get(int id) {
         List<FeedBack> feedbacks = new ArrayList<>();
        String sql = "SELECT f.* FROM Feedback f INNER JOIN Product p ON f.ProductID = p.ProductID WHERE p.ProductID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FeedBack feedback = new FeedBack();

                feedback.setId(rs.getInt("ID"));
                feedback.setCustomerID(rs.getInt("CustomerID"));
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setCreateDate(rs.getTimestamp("CreateDate"));
                feedback.setRateStar(rs.getInt("RateStar"));
                feedback.setComment(rs.getString("Comment"));
                feedback.setStatus(rs.getBoolean("Status"));

                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close(); // Close the connection (if needed)
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return feedbacks;
    }

    public List<FeedBack> getAll() {
        List<FeedBack> feedbacks = new ArrayList<>();
        String sql = "SELECT * FROM Feedback";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FeedBack feedback = new FeedBack();

                feedback.setId(rs.getInt("ID"));
                feedback.setCustomerID(rs.getInt("CustomerID"));
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setCreateDate(rs.getTimestamp("CreateDate"));
                feedback.setRateStar(rs.getInt("RateStar"));
                feedback.setComment(rs.getString("Comment"));
                feedback.setStatus(rs.getBoolean("Status"));

                feedbacks.add(feedback);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbacks;
    }
    
    
  public List<FeedBack> getFeedbacksByProductId(int productId) {
    List<FeedBack> feedbacks = new ArrayList<>();
    String sql = "SELECT f.ID AS FeedbackID, " +
                 "c.Name AS CustomerName, " +
                 "p.ProductName, " +
                 "f.RateStar, " +
                 "f.Comment, " +
                 "f.CreateDate, " +
                 "f.Status, " +
                 "f.CustomerID, " +
                 "f.ProductID " +
                 "FROM Feedback f " +
                 "INNER JOIN Customer c ON f.CustomerID = c.CustomerID " +
                 "INNER JOIN Product p ON f.ProductID = p.ProductID " +
                 "WHERE f.ProductID = ?";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, productId);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                FeedBack feedback = new FeedBack();
                feedback.setId(rs.getInt("FeedbackID"));
                feedback.setCustomerID(rs.getInt("CustomerID"));
                feedback.setCustomerName(rs.getString("CustomerName")); // Thiết lập tên khách hàng
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setCreateDate(rs.getTimestamp("CreateDate"));
                feedback.setRateStar(rs.getInt("RateStar"));
                feedback.setComment(rs.getString("Comment"));
                feedback.setStatus(rs.getBoolean("Status"));
                feedbacks.add(feedback);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return feedbacks;
}




//    public static void main(String[] args) {
//        FeedBackDAO feedbackDAO = new FeedBackDAO();
//
//        // Test get(int id) method
//        int testId = 1; // Change this to a valid ID in your database
//        FeedBack feedback = feedbackDAO.get(testId);
//        if (feedback != null) {
//            System.out.println("Feedback ID: " + feedback.getId());
//            System.out.println("Customer ID: " + feedback.getCustomerID());
//            System.out.println("Product ID: " + feedback.getProductID());
//            System.out.println("Create Date: " + feedback.getCreateDate());
//            System.out.println("Rate Star: " + feedback.getRateStar());
//            System.out.println("Comment: " + feedback.getComment());
//            System.out.println("Status: " + feedback.isStatus());
//        } else {
//            System.out.println("No feedback found with ID: " + testId);
//        }
//
//        // Test getAll() method
//        List<FeedBack> feedbacks = feedbackDAO.getAll();
//        for (FeedBack fb : feedbacks) {
//            System.out.println("Feedback ID: " + fb.getId());
//            System.out.println("Customer ID: " + fb.getCustomerID());
//            System.out.println("Product ID: " + fb.getProductID());
//            System.out.println("Create Date: " + fb.getCreateDate());
//            System.out.println("Rate Star: " + fb.getRateStar());
//            System.out.println("Comment: " + fb.getComment());
//            System.out.println("Status: " + fb.isStatus());
//            System.out.println("----------");
//        }
    
}
    


