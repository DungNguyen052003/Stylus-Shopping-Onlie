/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;

/**
 *
 * @author TienP
 */
public class OrderDetailDAO extends DBContext {

    public String getProduct(String id) {
        String sql = """
                    select * from OrderDetail od 
                    join ProductDetails pd on pd.Product_Detail_id = od.Product_Detail_Id
                    where od.ID = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("ProductID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkFeedback(int orderDetailID) {
        String sql = "select * from OrderDetail od join Feedback f on od.ID = f.OrderDetailID where od.ID = ? ";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, orderDetailID);
            resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int totalProductsOrdered() {
        int totalProductsOrdered = 0;

        try {
            String sql = "SELECT SUM(od.Quantity) AS TotalProductsOrdered "
                    + "FROM [dbo].[OrderDetail] od "
                    + "JOIN [dbo].[ProductDetails] pd ON od.Product_Detail_Id = pd.Product_Detail_id "
                    + "JOIN [dbo].[Product] p ON pd.ProductID = p.ProductID";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalProductsOrdered = resultSet.getInt("TotalProductsOrdered");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalProductsOrdered;
    }

}
