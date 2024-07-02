
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.OrderStatus;
/**
 *
 * @author ASUS
 */
public class OrderStatusDAO extends DBContext{
    public List<OrderStatus> listAllOrderStatus(){
        List<OrderStatus> listOrder = new ArrayList<>();
        String sql = "SELECT * FROM OrderStatus";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                OrderStatus order = new OrderStatus();
                order.setId(resultSet.getInt("OrderStatusID"));
                order.setName(resultSet.getString("StatusDetail"));
                listOrder.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listOrder;
    }

    public boolean isOrderStatusDuplicate(String statusDetail) {
        String sql = "SELECT COUNT(*) FROM OrderStatus WHERE StatusDetail = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, statusDetail);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addNewOrderStatus(OrderStatus statusOrder) {
        String sql = "INSERT INTO [dbo].[OrderStatus] ([StatusDetail])\n"
                + "VALUES (?)";
        try {
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, statusOrder.getName());
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
