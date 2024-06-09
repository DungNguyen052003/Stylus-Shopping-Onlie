/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.FeedBack;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

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

    public List<FeedBack> getAll(int page, int pageSize) {
        List<FeedBack> feedbacks = new ArrayList<>();
        String sql = """
                      select * from Feedback f join Customer c on f.CustomerID  = c.CustomerID
                                          join Product p on p.ProductID = f.ProductID  OFFSET ? ROWS
                       FETCH NEXT ? ROWS ONLY""";

        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                FeedBack feedback = new FeedBack();
                feedback.setId(rs.getInt("ID"));
                feedback.setCustomerID(rs.getInt("CustomerID"));
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setCreateDate(rs.getTimestamp("CreateDate"));
                feedback.setRateStar(rs.getInt("RateStar"));
                feedback.setComment(rs.getString("Comment"));
                feedback.setStatus(rs.getBoolean("Status"));
                feedback.setCustomerName(rs.getString("Name"));
                feedbacks.add(feedback);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbacks;
    }

    public List<FeedBack> getSortedFeedback(String sortBy, int page, int pageSize) {
        List<FeedBack> feedbacks = new ArrayList<>();
        String baseSql = """
                     select * from Feedback f join Customer c on f.CustomerID  = c.CustomerID
                     join Product p on p.ProductID = f.ProductID""";

        String orderBySql;

        switch (sortBy) {
            case "fullName":
                orderBySql = " ORDER BY c.Name";
                break;
            case "productName":
                orderBySql = " ORDER BY p.ProductName";
                break;
            case "ratedStar":
                orderBySql = " ORDER BY f.RateStar";
                break;
            case "status":
                orderBySql = " ORDER BY f.status";
                break;
            default:
                orderBySql = " ORDER BY f.ID";
                break;
        }

        String paginationSql = " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String sql = baseSql + orderBySql + paginationSql;
        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                FeedBack feedback = new FeedBack();
                feedback.setId(rs.getInt("ID"));
                feedback.setCustomerID(rs.getInt("CustomerID"));
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setCreateDate(rs.getTimestamp("CreateDate"));
                feedback.setRateStar(rs.getInt("RateStar"));
                feedback.setComment(rs.getString("Comment"));
                feedback.setStatus(rs.getBoolean("Status"));
                feedback.setCustomerName(rs.getString("Name"));
                feedbacks.add(feedback);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbacks;
    }

    public void changeFeedbackStatus(String feedbackID, String status) {
        String sql = """
                    update Feedback
                    set Status = ?
                    where ID = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, feedbackID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<FeedBack> getFeedbacksByProductId(int productId) {
        List<FeedBack> feedbacks = new ArrayList<>();
        String sql = "SELECT f.ID AS FeedbackID, "
                + "c.Name AS CustomerName, "
                + "p.ProductName, "
                + "f.RateStar, "
                + "f.Comment, "
                + "f.CreateDate, "
                + "f.Status, "
                + "f.CustomerID, "
                + "f.ProductID "
                + "FROM Feedback f "
                + "INNER JOIN Customer c ON f.CustomerID = c.CustomerID "
                + "INNER JOIN Product p ON f.ProductID = p.ProductID "
                + "WHERE f.ProductID = ?";

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

    public void insertFeedback(int customerID, String productID, String RateStar, String comment, String orderDetailID, String feedbackImage) {

        String sql = """
                     insert into Feedback(CustomerID,ProductID,RateStar
                     ,Comment,CreateDate,OrderDetailID,FeedbackImage, Status)
                     value(?,?,?,?,?,?,?,?);""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerID);
            ps.setString(2, productID);
            ps.setString(3, RateStar);
            ps.setString(4, comment);
            ps.setString(5, "CURRENT_TIMESTAMP");
            ps.setString(6, orderDetailID);
            ps.setString(7, feedbackImage);
            ps.setString(8, "1");
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<FeedBack> filterFeedback(int page, int pageSize, String productName, String fullName, String content, int rate, int status) {
        List<FeedBack> feedbacks = new ArrayList<>();

        String sql1 = """
                       select * from Feedback f join Customer c on f.CustomerID  = c.CustomerID
                                           join Product p on p.ProductID = f.ProductID WHERE 1=1""";
        String sql2 = "";

        if (productName != null && !productName.isEmpty()) {
            sql2 += "AND p.ProductName LIKE ?  ";
        }
        if (fullName != null && !fullName.isEmpty()) {
            sql2 += "AND c.Name LIKE  ? ";
        }
        if (content != null && !content.isEmpty()) {
            sql2 += "AND f.Comment LIKE ?  ";
        }
        if (rate != -1) {
            sql2 += "AND f.RateStar = ? ";
        }
        if (status == 1 || status == 0) {
            sql2 += "AND Status = ? ";
        }

        String sql3 = "ORDER BY f.id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String sql = sql1 + sql2 + sql3;

        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (productName != null && !productName.isEmpty()) {
                statement.setString(parameterIndex++, "%" + productName + "%");
            }
            if (fullName != null && !fullName.isEmpty()) {
                statement.setString(parameterIndex++, "%" + fullName + "%");
            }
            if (content != null && !content.isEmpty()) {
                statement.setString(parameterIndex++, "%" + content + "%");
            }
            if (rate != -1) {
                statement.setInt(parameterIndex++, rate);
            }
            if (status == 1 || status == 0) {
                statement.setInt(parameterIndex++, status);
            }
            int offset = (page - 1) * pageSize;
            statement.setInt(parameterIndex++, offset);
            statement.setInt(parameterIndex++, pageSize);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                FeedBack feedback = new FeedBack();
                feedback.setId(resultSet.getInt("ID"));
                feedback.setCustomerID(resultSet.getInt("CustomerID"));
                feedback.setProductID(resultSet.getInt("ProductID"));
                feedback.setCreateDate(resultSet.getTimestamp("CreateDate"));
                feedback.setRateStar(resultSet.getInt("RateStar"));
                feedback.setComment(resultSet.getString("Comment"));
                feedback.setStatus(resultSet.getBoolean("Status"));
                feedback.setCustomerName(resultSet.getString("Name"));
                feedbacks.add(feedback);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbacks;
    }

    public int getTotalFilteredFeedbackRecord(String productName, String fullName, String content, int rate, int status) {
        String sql = "SELECT COUNT(*) FROM Product WHERE 1=1";
        List<Object> params = new ArrayList<>();

        if (productName != null && !productName.isEmpty()) {
            sql += "AND p.ProductName LIKE ?  ";
            params.add(productName);
        }
        if (fullName != null && !fullName.isEmpty()) {
            sql += "AND c.Name LIKE  ? ";
            params.add(fullName);
        }
        if (content != null && !content.isEmpty()) {
            sql += "AND f.Comment LIKE ?  ";
            params.add(content);
        }
        if (rate != -1) {
            sql += "AND f.RateStar = ? ";
            params.add(rate);
        }
        if (status == 1 || status == 0) {
            sql += "AND Status = ? ";
            params.add(status);
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

    public int getTotalFeedbackRecord() {
        String sql = "SELECT COUNT(*) AS total FROM Feedback";
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

    public FeedBack getFeedbackByID(String id) {
        String sql = """
                     select * from Feedback f join Customer c on f.CustomerID  = c.CustomerID
                     join Product p on p.ProductID = f.ProductID
                     where f.ID = ?""";
        FeedBack feedback = new FeedBack();
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                feedback.setId(resultSet.getInt("ID"));
                feedback.setCustomerID(resultSet.getInt("CustomerID"));
                feedback.setProductID(resultSet.getInt("ProductID"));
                feedback.setCreateDate(resultSet.getTimestamp("CreateDate"));
                feedback.setRateStar(resultSet.getInt("RateStar"));
                feedback.setComment(resultSet.getString("Comment"));
                feedback.setStatus(resultSet.getBoolean("Status"));
                feedback.setFeedbackImage(resultSet.getString("FeedbackImage"));
                feedback.setCustomerName(resultSet.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedback;
    }
}
