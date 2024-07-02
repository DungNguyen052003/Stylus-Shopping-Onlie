/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Size;
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
    public List<Size> listAllSize() {
        List<Size> sizes = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM [dbo].[Size]";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                Size size = new Size();
                size.setId(resultSet.getInt("SizeID"));
                size.setName(resultSet.getString("Name"));
                sizes.add(size);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sizes;
    }
  
    public boolean isSizeDuplicate(String sizeName) {
        String sql = "SELECT COUNT(*) FROM Size WHERE Name = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, sizeName);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addNewSize(Size size) {
        String sql = "INSERT INTO [dbo].[Size] ([Name])\n"
                + "VALUES (?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, size.getName());
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
