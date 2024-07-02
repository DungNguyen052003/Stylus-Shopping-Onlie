
package dao;

import java.sql.SQLException;
import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Role;

public class RoleDAO extends DBContext {

    public Role getRoleByID(int roleID) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Role]\n"
                + "  WHERE RoleID = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, roleID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int roleId = resultSet.getInt("RoleID");
                String name = resultSet.getString("Name");
                Role role = new Role(roleId, name);
                return role;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Role> listRole() {
        List<Role> list = new ArrayList<>();
        String sql = "SELECT [RoleID]\n"
                + "      ,[Name]\n"
                + "  FROM [dbo].[Role]";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {                
                int roleId = resultSet.getInt("RoleID");
                String name = resultSet.getString("Name");
                Role role = new Role(roleId, name);
                list.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
