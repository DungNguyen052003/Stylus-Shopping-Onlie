/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.PaymentMethod;

/**
 *
 * @author ASUS
 */
public class PaymentMethodDAO extends DBContext{
    public List<PaymentMethod> listAllPaymentMethod(){
        List<PaymentMethod> listPayment = new ArrayList<>();
        String sql = "SELECT * FROM PaymentMethod";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                PaymentMethod payment = new PaymentMethod();
                payment.setId(resultSet.getInt("ID"));
                payment.setMethod(resultSet.getString("Method"));
                listPayment.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPayment;
    }

    public boolean isPaymentDuplicate(String paymentMethod) {
        String sql = "SELECT COUNT(*) FROM PaymentMethod WHERE Method = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, paymentMethod);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addNewPayment(PaymentMethod payment) {
        String sql = "INSERT INTO [dbo].[PaymentMethod] ([Method])\n"
                + "VALUES (?)";
        try {
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, payment.getMethod());
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
