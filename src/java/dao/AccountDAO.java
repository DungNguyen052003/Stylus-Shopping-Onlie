package dao;

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
                account.setUsername(resultSet.getString("Username"));
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
}
