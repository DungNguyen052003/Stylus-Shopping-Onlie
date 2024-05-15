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
