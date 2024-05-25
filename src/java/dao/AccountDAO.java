package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import context.DBContext;
public class AccountDAO extends DBContext  {

    public Account findAccount(Account account) {
       
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE [Account].Email = ? AND [Account].Password = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, account.getEmail());
            statement.setString(2, account.getPassword());
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                account.setAccountID(resultSet.getInt("ID"));               
                account.setPassword(resultSet.getString("Password"));
                account.setEmail(resultSet.getString("Email"));
                account.setRole(resultSet.getInt("RoleID"));
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

    public static void main(String[] args) {
        // Tạo một tài khoản mới để tìm kiếm
        Account accountToFind = new Account();
        accountToFind.setEmail("trang@gmail.com");
        accountToFind.setPassword("123");

        // Tạo một đối tượng AccountDAO để thực hiện tìm kiếm
        AccountDAO accountDAO = new AccountDAO();

        // Gọi phương thức findAccount từ đối tượng DAO để tìm kiếm tài khoản
        Account foundAccount = accountDAO.findAccount(accountToFind);

        // Kiểm tra xem tài khoản đã tìm thấy hay không
        if (foundAccount != null) {
            System.out.println("Account found:");
            System.out.println("ID: " + foundAccount.getAccountID());
            System.out.println("Name: " + foundAccount.getName());
            System.out.println("Email: " + foundAccount.getEmail());
            System.out.println("Role: " + foundAccount.getRole());
        } else {
            System.out.println("Account not found.");
        }

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
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
        return false;
    }

    public void insert(Account a) {        
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([UserName]\n"
                + "           ,[Password]\n"
                + "           ,[RoleID]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[Image]\n"
                + "           ,[Name])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            st.setString(2, a.getPassword());
            st.setInt(3, a.getRole());
            st.setInt(4, a.getPhone());
            st.setString(5, a.getEmail());
            st.setString(6, a.getImage());
            st.setString(7, a.getName());
            
            st.executeUpdate();

            // Lấy ID của bản ghi vừa chèn vào
//            ResultSet rs = st.getGeneratedKeys();
//            if (rs.next()) {
//                int generatedId = rs.getInt(1);
//                // Sử dụng ID nếu cần thiết
//            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
