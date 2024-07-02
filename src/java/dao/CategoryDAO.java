/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import context.DBContext;
import model.Category;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author TienP
 */
public class CategoryDAO extends DBContext {

    public Category getCategory(int id) {
        String sql = """
                     SELECT *
                       FROM [dbo].[Category]
                       WHERE CateID = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rsCate = statement.executeQuery();
            while (rsCate.next()) {
                int cateID = rsCate.getInt("CateID");
                String name = rsCate.getString("Name");
                int status = rsCate.getInt("Status");
                int parentID = rsCate.getInt("ParentID");
                Category category = new Category(cateID, name, status, parentID);
                return category;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Category get(int id) {
        String sql = "SELECT * FROM Category WHERE CateID = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Category category = new Category();

                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("Name"));
                category.setStatus(rs.getInt("Status"));
                category.setParentID(rs.getInt("ParentID"));

                return category;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDAO p = new CategoryDAO();
        Category c = p.get(1);
        System.out.println(c.toString());
        // Product  p1 = p.get(1);
//       List<Product> p1 = p.getProductByCategory(1);
//        for (Product product : p1) {
//            System.out.println(product.toString());
//        }
    }

    public List<Category> getAll() {
        List<Category> categories = new ArrayList<Category>();
        String sql = "SELECT * FROM Category";
        try {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("Name"));
                category.setStatus(rs.getInt("Status"));
                category.setParentID(rs.getInt("ParentID"));

                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    public List<Category> getCategoriesByParentID(int parentID) {
        List<Category> categories = new ArrayList<Category>();
        String sql = "SELECT * FROM Category WHERE ParentID = ? ";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, parentID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("Name"));
                category.setStatus(rs.getInt("Status"));
                category.setParentID(rs.getInt("ParentID"));

                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

}
