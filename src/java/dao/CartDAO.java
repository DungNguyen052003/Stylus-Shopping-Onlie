/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.math.BigDecimal;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import model.Cart;
import model.Color;
import model.Product;
import model.ProductDetails;
import model.Size;

/**
 *
 * @author acer
 */
public class CartDAO extends DBContext {

    public List<Cart> getCartProductDetails(int customerId) {
        List<Cart> detailsList = new ArrayList<>();

        String sql = "select c.CartID,pd.Product_Detail_id, p.ProductID, p.ProductName, cl.ColorID,cl.Name as ColorName,s.SizeID,s.Name  as SizeName,p.Price,c.Quantity,pd.Quantity as RemainAmount from Cart c	\n"
                + "join ProductDetails pd on c.Product_Detail_ID = pd.Product_Detail_id\n"
                + "join Product p on p.ProductID = pd.ProductID\n"
                + "join Size s on s.SizeID = pd.SizeID\n"
                + "join Color cl on pd.ColorID = cl.ColorID where c.CustomerID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, customerId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setCartID(rs.getInt("CartID"));
                    ProductDetails pd = new ProductDetails();
                    pd.setProductDetailID(rs.getInt("Product_Detail_id"));
                    Size size = new Size();
                    size.setId(rs.getInt("SizeID"));
                    size.setName(rs.getString("SizeName"));
                    pd.setSize(size);
                    Color cl = new Color();
                    cl.setId(rs.getInt("ColorID"));
                    cl.setName(rs.getString("ColorName"));
                    pd.setColor(cl);
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setPrice(rs.getDouble("Price"));
                    pd.setProduct(p);
                    pd.setQuantity(rs.getInt("RemainAmount"));
                    cart.setQuantity(rs.getInt("Quantity"));
                    cart.setProductDetails(pd);
                    detailsList.add(cart);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

    public Cart getCartProductDetailsByCartID(int id) {

        String sql = "select c.CartID,pd.Product_Detail_id, p.ProductID, p.ProductName, cl.ColorID,cl.Name as ColorName,s.SizeID,s.Name  as SizeName,p.Price,c.Quantity,pd.Quantity as RemainAmount from Cart c	\n"
                + "join ProductDetails pd on c.Product_Detail_ID = pd.Product_Detail_id\n"
                + "join Product p on p.ProductID = pd.ProductID\n"
                + "join Size s on s.SizeID = pd.SizeID\n"
                + "join Color cl on pd.ColorID = cl.ColorID where c.CartID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setCartID(rs.getInt("CartID"));
                    ProductDetails pd = new ProductDetails();
                    pd.setProductDetailID(rs.getInt("Product_Detail_id"));
                    Size size = new Size();
                    size.setId(rs.getInt("SizeID"));
                    size.setName(rs.getString("SizeName"));
                    pd.setSize(size);
                    Color cl = new Color();
                    cl.setId(rs.getInt("ColorID"));
                    cl.setName(rs.getString("ColorName"));
                    pd.setColor(cl);
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setPrice(rs.getDouble("Price"));
                    pd.setProduct(p);
                    pd.setQuantity(rs.getInt("RemainAmount"));
                    cart.setQuantity(rs.getInt("Quantity"));
                    cart.setProductDetails(pd);
                    return cart;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
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
        int i = new CartDAO().insertOrder(1, "t", "t", "t", 1, BigDecimal.ONE);
    }

    public int insertOrder(int customerid, String fullname, String phone, String address, int status, BigDecimal totalAmount) {

        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([CustomerID]\n"
                + "           ,[FullName]\n"
                + "           ,[Phone]\n"
                + "           ,[Address]\n"
                + "           ,[OrderDate]\n"
                + "           ,[Status]\n"
                + "           ,[TotalAmount])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,CURRENT_TIMESTAMP,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, customerid);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setString(4, address);

            st.setInt(5, status);
            st.setBigDecimal(6, totalAmount);
            st.executeUpdate();

            // Lấy ra orderID được tạo tự động
            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Trả về orderID
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public void insertOrderDetails(int orderID, int productDetailID, int quantity, BigDecimal price, BigDecimal totalPrice, String saleNote, LocalDate deliveredDate) {
        String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([OrderID]\n"
                + "           ,[Product_Detail_Id]\n"
                + "           ,[Quantity]\n"
                + "           ,[Price]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[SaleNote]\n"
                + "           ,[DeliveredDate])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setLong(1, orderID);
            st.setInt(2, productDetailID);
            st.setInt(3, quantity);
            st.setBigDecimal(4, price);
            st.setBigDecimal(5, totalPrice);
            st.setString(6, saleNote);
            st.setDate(7, Date.valueOf(deliveredDate));

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCartAfterOrder(int customerID, int productDetailID) {
        String sql = "DELETE FROM [dbo].[Cart]\n"
                + "      WHERE CustomerID = ?  and Product_Detail_ID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, customerID);
            st.setInt(2, productDetailID);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateQuantityAfterOrder(int productDetailID, int quantitySold) {
        String sql = "update ProductDetails set Quantity = Quantity - ? where Product_Detail_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, quantitySold);
            st.setInt(2, productDetailID);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertToCart(int customerId, String productDetailId, int quantity) {
        String sql = "insert into Cart\n"
                + "values (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            st.setString(2, productDetailId);
            st.setInt(3, quantity);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
