package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Role;
public class AccountDAO extends DBContext  {

    public Account findAccount(Account account) {
       
        String sql = """
                     SELECT acc.*,r.Name as roleName
                     FROM account acc  join role r on r.roleid = acc.roleid
                      WHERE acc.Email = ? AND acc.Password = ?""";

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, account.getEmail());
            statement.setString(2, account.getPassword());
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                account.setAccountID(resultSet.getInt("AccountID"));               
                account.setPassword(resultSet.getString("Password"));
                account.setEmail(resultSet.getString("Email"));
                Role role = new Role();
                role.setName(resultSet.getString("roleName"));
                role.setRoleID(resultSet.getInt("RoleID"));
                account.setRole(role);
                account.setPhone(resultSet.getInt("Phone"));
                account.setImage(resultSet.getString("Image"));
                account.setName(resultSet.getString("Name"));
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public int getNumberAccounts() {
        try {
            String sql = "SELECT COUNT(*) FROM Customer";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int number = rs.getInt(1);
                return number;
            }
        } catch (Exception e) {
        }
        return 1;
    }

    public boolean checkEmailDuplicate(String email) {
        
        String sql = "SELECT * FROM Account WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return false;
    }

    
    public List<Account> listAllAccount(int page, int pageSize) {
        RoleDAO dao = new RoleDAO();
        List<Account> listAccount = new ArrayList<>();
        String sql = """
                     SELECT *
                       FROM [dbo].Account
                       ORDER BY AccountID ASC
                       OFFSET ? ROWS
                       FETCH NEXT ? ROWS ONLY""";
        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int accountID = resultSet.getInt("AccountID");
                String password = resultSet.getString("Password");
                int roleID = resultSet.getInt("RoleID");
                Role role = dao.getRoleByID(roleID);
                int phone = resultSet.getInt("Phone");
                String email = resultSet.getString("Email");
                String image = resultSet.getString("Image");
                String name = resultSet.getString("Name");
                int gender = resultSet.getInt("Gender");
                int status = resultSet.getInt("Status");
                Account account = new Account(accountID, password, role, phone, gender, email, image, name, status);
                listAccount.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listAccount;
    }

    public int getTotalRecord() {
        String sql = "SELECT COUNT(*) AS total FROM Account";
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public boolean updateAccountStatus(int accountID, int status) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [Status] = ?\n"
                + "   WHERE AccountID =?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, accountID);
            int updateStatus = statement.executeUpdate();
            return updateStatus > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateRoleAccount(int accountID, int roleID) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [RoleID] = ?\n"
                + " WHERE AccountID = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, roleID);
            statement.setInt(2, accountID);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Account> getSortedAccount(String sortBy, int page, int pageSize) {
        List<Account> listFound = new ArrayList<>();
        RoleDAO dao = new RoleDAO();
        String baseSql = "SELECT [AccountID]\n"
                + "      ,[RoleID]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[Image]\n"
                + "      ,[Name]\n"
                + "      ,[Gender]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Account]";
        String orderBySql;

        switch (sortBy) {
            case "id":
                orderBySql = " ORDER BY AccountID";
                break;
            case "name":
                orderBySql = " ORDER BY Name";
                break;
            case "gender":
                orderBySql = " ORDER BY Gender";
                break;
            case "role":
                orderBySql = " ORDER BY RoleID";
                break;
            case "email":
                orderBySql = " ORDER BY Email";
                break;
            case "status":
                orderBySql = " ORDER BY Status";
                break;
            default:
                orderBySql = " ORDER BY AccountID";
                break;
        }

        String paginationSql = " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String sql = baseSql + orderBySql + paginationSql;

        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int accountID = resultSet.getInt("AccountID");
                int roleID = resultSet.getInt("RoleID");
                Role role = dao.getRoleByID(roleID);
                int phone = resultSet.getInt("Phone");
                String email = resultSet.getString("Email");
                String image = resultSet.getString("Image");
                String name = resultSet.getString("Name");
                int gender = resultSet.getInt("Gender");
                int status = resultSet.getInt("Status");
                Account account = new Account(accountID, role, phone, gender, email, image, name, status);
                listFound.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Account> filterAccount(int page, int pageSize, int role, int gender, int status) {
        List<Account> listAccount = new ArrayList<>();
        RoleDAO dao = new RoleDAO();
        String sql1 = "SELECT * FROM Account WHERE 1=1 ";
        String sql2 = "";
        if (role != 0) {
            sql2 += "AND RoleID = ? ";
        }
        if (gender == 1 || gender == 0  || gender == 2) {
            sql2 += "AND Gender = ? ";
        }
        if (status == 1 || status == 0) {
            sql2 += "AND Status = ? ";
        }

        String sql3 = "ORDER BY AccountID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String sql = sql1 + sql2 + sql3;

        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (role != 0) {
                statement.setInt(parameterIndex++, role);
            }
            if (gender == 1 || gender == 0 || gender == 2) {
                statement.setInt(parameterIndex++, gender);
            }
            if (status == 1 || status == 0) {
                statement.setInt(parameterIndex++, status);
            }
            int offset = (page - 1) * pageSize;
            statement.setInt(parameterIndex++, offset);
            statement.setInt(parameterIndex++, pageSize);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int accountID = resultSet.getInt("AccountID");
                int roleID = resultSet.getInt("RoleID");
                Role r = dao.getRoleByID(roleID);
                int phone = resultSet.getInt("Phone");
                String email = resultSet.getString("Email");
                String image = resultSet.getString("Image");
                String name = resultSet.getString("Name");
                int gd = resultSet.getInt("Gender");
                int st = resultSet.getInt("Status");
                Account account = new Account(accountID, r, phone, gd, email, image, name, st);
                listAccount.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listAccount;
    }

    public int getTotalFilteredRecord(int role, int gender, int status) {
        String sql = "SELECT COUNT(*) FROM Account WHERE 1=1";
        List<Object> params = new ArrayList<>();

        if (role != 0) {
            sql += "AND RoleID = ? ";
            params.add(role);
        }
        if (gender == 1 || gender == 0 || gender == 2) {
            sql += "AND Gender = ? ";
            params.add(gender);
        }
        if (status == 1 || status == 0) {
            sql += "AND Status = ? ";
            params.add(status);
        }
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            for (int i = 0; i < params.size(); i++) {
                statement.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getInt(1);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public List<Account> searchUser(int page, int pageSize, String search) {
        RoleDAO dao = new RoleDAO();
        List<Account> listAccount = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE Name LIKE ? OR Email LIKE ? OR Phone LIKE ?\n"
                + "ORDER BY AccountID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            statement = connection.prepareStatement(sql);
            String searchPattern = "%" + search + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);
            int offset = (page - 1) * pageSize;
            statement.setInt(4, offset);
            statement.setInt(5, pageSize);
            resultSet = statement.executeQuery();
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int accountID = resultSet.getInt("AccountID");
                String password = resultSet.getString("Password");
                int roleID = resultSet.getInt("RoleID");
                Role role = dao.getRoleByID(roleID);
                int phone = resultSet.getInt("Phone");
                String email = resultSet.getString("Email");
                String image = resultSet.getString("Image");
                String name = resultSet.getString("Name");
                int gender = resultSet.getInt("Gender");
                int status = resultSet.getInt("Status");
                Account account = new Account(accountID, password, role, phone, gender, email, image, name, status);
                listAccount.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listAccount;
    }

    public int getTotalRecordBySearchUser(String search) {
        String sql = "SELECT COUNT(*) FROM Account WHERE Name LIKE ? OR Email LIKE ? OR Phone LIKE ?";
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            String searchPattern = "%" + search + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public Account getAccountByID(int accountID) {
        RoleDAO dao = new RoleDAO();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE AccountID =?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {                
                int accountId = resultSet.getInt("AccountID");
                String password = resultSet.getString("Password");
                int roleID = resultSet.getInt("RoleID");
                Role role = dao.getRoleByID(roleID);
                int phone = resultSet.getInt("Phone");
                String email = resultSet.getString("Email");
                String image = resultSet.getString("Image");
                String name = resultSet.getString("Name");
                int gender = resultSet.getInt("Gender");
                int status = resultSet.getInt("Status");
                Account account = new Account(accountId, password, role, phone, gender, email, image, name, status);
                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertAccount(String email, String password, String role, String phone, String image, String name, String gender, String status) {
         String sql = """
                     INSERT INTO [dbo].[Account]
                                ([Password]
                                ,[RoleID]
                                ,[Phone]
                                ,[Gender]
                                ,[Email]
                                ,[Image]
                                ,[Name]
                                ,[Status]
                                )
                          VALUES (?,?,?,?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, role);
            st.setString(3, phone);
            st.setString(4, gender);
            st.setString(5, email);
            st.setString(6, image);
            st.setString(7, name);
            st.setString(8, status);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
