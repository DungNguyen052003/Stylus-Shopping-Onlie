package dao;
import context.DBContext;
import java.sql.SQLException;
import model.Customer;

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package dao;
//
//import context.DBContext;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import model.Fashion;
//
///**
// *
// * @author TienP
// */
//public class CustomerDAO {
//
//    public static CustomerDAO INSTANCE = new CustomerDAO();
//
//    private String status = "OK";
//
//    public CustomerDAO() {
//        if (INSTANCE == null) {
//            con = new DBContext().connection;
//        } else {
//            INSTANCE = this;
//        }
//    }
//    Connection con = new DBContext().connection;
//    PreparedStatement ps = null;
//    ResultSet rs = null;
//
//    public ArrayList<Fashion> getAllBooks() {
//        ArrayList<Fashion> books = new ArrayList<>();
//        try {
//            String sql = """
//                         select * from Product;  """;
//
//            
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
////                 h = new Book();
////                hBook.setId(rs.getInt("id"));
////                h.setName(rs.getString("name"));
////                h.setImage(rs.getString("image"));
////                h.setPrice(rs.getDouble("price"));
////                h.setAuthor(rs.getString("author"));
////                h.setPublisher(rs.getString("publisher"));
////                h.setPage(rs.getInt("page"));
////                h.setLanguage(rs.getString("language"));
////                h.setSize(rs.getString("size"));
////                h.setDescrip(rs.getString("description"));
////                h.setQuantity(rs.getInt("quantity"));
////                BookCate bc = new BookCate();
////                bc.setCateID(rs.getInt("categoryId"));
////                bc.setNameCate(rs.getString("cateName"));
////                h.setCategory(bc);
////                books.add(h);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//
//        }
//        return books;
//    }
//
//}
public class CustomerDAO extends DBContext {

    public Customer findCustomer(Customer customer) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Customer]\n"
                + "  WHERE Email = ? AND Password = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, customer.getEmail());
            statement.setString(2, customer.getPassword());
            resultSet = statement.executeQuery();
            if(resultSet.next()){
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                customer.setUsername(resultSet.getString("Username"));
                customer.setAddress(resultSet.getString("Address"));
                customer.setPhone(resultSet.getString("Phone"));
                customer.setRoleID(resultSet.getInt("RoleID"));
                customer.setPassword(resultSet.getString("Password"));
                customer.setName(resultSet.getString("Name"));
                customer.setImage(resultSet.getString("Image"));
                return customer;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        // Tạo một tài khoản mới để tìm kiếm
        Customer accountToFind = new Customer();
        accountToFind.setEmail("john.doe@example.com");
        accountToFind.setPassword("Password@1");

        // Tạo một đối tượng AccountDAO để thực hiện tìm kiếm
        CustomerDAO cusDAO = new CustomerDAO();

        // Gọi phương thức findAccount từ đối tượng DAO để tìm kiếm tài khoản
        Customer found = cusDAO.findCustomer(accountToFind);

        // Kiểm tra xem tài khoản đã tìm thấy hay không
        if (found != null) {
            System.out.println("Account found:");
            System.out.println("ID: " + found.getCustomerID());
            System.out.println("Name: " + found.getName());
            System.out.println("Email: " + found.getEmail());
            System.out.println("Role: " + found.getRoleID());
        } else {
            System.out.println("Account not found.");
        }
    }
}
