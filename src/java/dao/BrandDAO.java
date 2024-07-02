
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import java.util.ArrayList;
import java.util.List;
import model.Brand;

public class BrandDAO extends DBContext{
    public List<Brand> listAllBrand(){
        List<Brand> listBrand = new ArrayList<>();
        String sql = "SELECT * FROM Brand";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Brand brand = new Brand();
                brand.setBrandId(resultSet.getInt("BrandID"));
                brand.setBrandName(resultSet.getString("BrandName"));
                listBrand.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listBrand;

    }

    public boolean isBrandDuplicate(String brandName) {
        String sql = "SELECT COUNT(*) FROM Brand WHERE BrandName = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, brandName);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addNewBrand(Brand brand) {
        String sql = "INSERT INTO [dbo].[Brand] ([Name])\n"
                + "VALUES (?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, brand.getBrandName());
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
