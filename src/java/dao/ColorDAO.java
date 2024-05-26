/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Color;

/**
 *
 * @author 84976
 */
public class ColorDAO extends DBContext {

//    public List<Color> get(int id) {
//         List<Color> colors = new ArrayList<>();
//        String sql = "SELECT c.* FROM ProductSizeColor ps  JOIN Product p ON ps.productID = p.ProductID \n"
//                + "  Join Color c On c.id = ps.colorid\n"
//                + "  WHERE p.ProductID = ?";
//        
//
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                Color color = new Color();
//                color.setId(rs.getInt("id"));
//                color.setName(rs.getString("Name"));
//                colors.add(color);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return colors;
//    }
    public List<Color> getColorsByProductID(int productID) {
        List<Color> colors = new ArrayList<>();
        String sql = "SELECT c.* FROM ProductSizeColor ps  JOIN Product p ON ps.productID = p.ProductID \n"
                + "Join Color c On c.ID = ps.sizeID\n"
                + "WHERE p.ProductID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Color color = new Color();
                color.setId(rs.getInt("ID"));
                color.setName(rs.getString("Name"));
                colors.add(color);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return colors;
    }

    public List<Color> getAll() {
        List<Color> colors = new ArrayList<>();
        String sql = "SELECT * FROM Color";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Color color = new Color();
                color.setId(rs.getInt("ID"));
                color.setName(rs.getString("Name"));
                colors.add(color);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return colors;
    }
}
