/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CartList;

/**
 *
 * @author acer
 */
public class CartDAO extends DBContext {

    public List<CartList> getCartProductDetails(int customerId) {
        List<CartList> detailsList = new ArrayList<>();

        String sql = "select c.CartID, p.ProductName,s.Name as Size, cl.Name as Color, p.Price, c.Quantity, pd.Quantity as RemainAmount from Cart c\n" +
"                 join ProductDetails pd on c.Product_Detail_ID = pd.Product_Detail_id\n" +
"                join Product p on p.ProductID = pd.ProductID\n" +
"                join Size s on pd.SizeID = s.SizeID\n" +
"                join Color cl on pd.ColorID = cl.ColorID\n" +
"                where c.CustomerID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, customerId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int cartID = rs.getInt("CartID");
                    String productName = rs.getString("ProductName");
                    String colorName = rs.getString("Color");
                    String sizeName = rs.getString("Size");
                    int quantity = rs.getInt("Quantity");
                    double price = rs.getDouble("Price");
                    int remainAmout = rs.getInt("RemainAmount");
                    detailsList.add(new CartList(cartID, productName, colorName, sizeName, quantity, price,remainAmout));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }
    public List<CartList> getCartProductDetailsByCartID(int id) {
        List<CartList> detailsList = new ArrayList<>();

        String sql = "select c.CartID, p.ProductName,s.Name as Size, cl.Name as Color, p.Price, c.Quantity, pd.Quantity as RemainAmount from Cart c\n" +
"                 join ProductDetails pd on c.Product_Detail_ID = pd.Product_Detail_id\n" +
"                 join Product p on p.ProductID = pd.ProductID\n" +
"                 join Size s on pd.SizeID = s.SizeID\n" +
"                 join Color cl on pd.ColorID = cl.ColorID\n" +
"                 where c.cartID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int cartID = rs.getInt("CartID");
                    String productName = rs.getString("ProductName");
                    String colorName = rs.getString("Color");
                    String sizeName = rs.getString("Size");
                    int quantity = rs.getInt("Quantity");
                    double price = rs.getDouble("Price");
                    int remainAmount = rs.getInt("RemainAmount");
                    detailsList.add(new CartList(cartID, productName, colorName, sizeName, quantity, price, remainAmount));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }
    public void deleteCartDetail(int id) {
        String sql = "delete from Cart where CartID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateCartQuantity(int cartID, int quantity) {
        String sql = "UPDATE Cart SET quantity = ? WHERE CartID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, cartID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        CartDAO c = new CartDAO();
        List<CartList> detailsList = new ArrayList<>();
        detailsList = c.getCartProductDetails(1);
        for (CartList detail : detailsList) {
            System.out.println(detail.getCartID());
        }
        c.updateCartQuantity(2, 5);


    }

}
