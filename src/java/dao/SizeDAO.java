/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Size;
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
public class SizeDAO extends DBContext{
    public List<Size> get(int id) {
        List<Size> sizes = new ArrayList<>();
        String sql = "SELECT s.* FROM ProductDetails ps  JOIN Product p ON ps.productID = p.ProductID \n" +
"  Join Size s On s.sizeID = ps.sizeID\n" +
"  WHERE p.ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Size size = new Size();
                size.setId(rs.getInt("SizeID"));
                size.setName(rs.getString("Name"));
                sizes.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sizes;
    }

    public List<Size> getAll() {
        List<Size> sizes = new ArrayList<>();
        String sql = "SELECT * FROM Size";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Size size = new Size();
                size.setId(rs.getInt("SizeID"));
                size.setName(rs.getString("Name"));
                sizes.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sizes;
    }
    public static void main(String[] args) {
         List<Size> size = new SizeDAO().get(1);
         for (Size size1 : size) {
             System.out.println(size1.getName());
        }
    }
}
