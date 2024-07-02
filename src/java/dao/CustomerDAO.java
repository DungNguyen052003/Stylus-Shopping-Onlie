package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.ChangeHistory;
import model.Customer;

public class CustomerDAO extends DBContext {

    public Customer findCustomer(Customer customer) {
        String sql = """
                     SELECT *
                       FROM [dbo].[Customer]
                       WHERE Email = ? AND Password = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, customer.getEmail());
            statement.setString(2, customer.getPassword());
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                customer.setGender(resultSet.getInt("Gender"));
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                customer.setAddress(resultSet.getString("Address"));
                customer.setPhone(resultSet.getString("Phone"));
                customer.setRoleID(resultSet.getInt("RoleID"));
                customer.setPassword(resultSet.getString("Password"));
                customer.setName(resultSet.getString("Name"));
                customer.setImage(resultSet.getString("Image"));
                return customer;
            }
        } catch (SQLException e) {
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

        String sql = """
                     SELECT email FROM Account WHERE email = ? 
                     UNION
                     SELECT email FROM Customer WHERE email = ? and verify_status != 0""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
        return false;
    }

    public boolean checkEmailRegister(String email) {

        String sql = """
                     SELECT email FROM Account WHERE email = ?
                     UNION
                     SELECT email FROM Customer WHERE email = ? and verify_status = 0""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
        return false;
    }

    public void changeVerifyStatus(String email, int status) {
        String sql = """
                     UPDATE Customer
                     SET verify_Status = ? , createdDate = CURRENT_TIMESTAMP
                     WHERE email = ?;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setString(2, email);
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
    }

    public int getVerifyStatus(String email) {
        String sql = """
                     select * from Customer
                     where email = ?;""";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, email);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = rs.getInt("verify_Status");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
        return a;
    }

    public void insert(Customer a) {
        String sql = """
                     INSERT INTO [dbo].[Customer]
                                ([Password]
                                ,[RoleID]
                                ,[Phone]
                                ,[CreatedDate]
                                ,[Gender]
                                ,[Email]
                                ,[Image]
                                ,[Name]
                                ,[Address])
                          VALUES (?,?,?, CURRENT_TIMESTAMP, ?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setInt(2, a.getRoleID());
            st.setString(3, a.getPhone());
            st.setInt(4, a.getGender());
            st.setString(5, a.getEmail());
            st.setString(6, a.getImage());
            st.setString(7, a.getName());
            st.setString(8, a.getAddress());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     public void insertNew(Customer a) {
        String sql = """
                     INSERT INTO [dbo].[Customer]
                                ([Password]
                                ,[RoleID]
                                ,[Phone]
                                ,[CreatedDate]
                                ,[Gender]
                                ,[Email]
                                ,[Image]
                                ,[Name]
                                ,[Address]
                     ,[verify_Status])
                          VALUES (?,?,?, CURRENT_TIMESTAMP, ?,?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setInt(2, a.getRoleID());
            st.setString(3, a.getPhone());
            st.setInt(4, a.getGender());
            st.setString(5, a.getEmail());
            st.setString(6, a.getImage());
            st.setString(7, a.getName());
            st.setString(8, a.getAddress());
            st.setInt(9, a.getVerifiedStatus()
            );
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String phone, String gender, String image, String name, String address, String email) {
        String sql = """
                     UPDATE Customer
                     SET Phone = ?, Gender = ?,Image= ?, Name = ?, Address = ?
                     WHERE email = ?;""";
        try {
            System.out.println("Executing update with email: " + email);
            System.out.println("SQL: " + sql);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, gender);
            st.setString(3, image);
            st.setString(4, name);
            st.setString(5, address);
            st.setString(6, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCustomerPass(String email, String newPass) {
        String sql = "UPDATE Customer SET password = ? WHERE email = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public boolean checkPassword(String email, String password){
//        String sql = "UPDATE Customer SET password = ? WHERE email = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, newPass);
//            st.setString(2, email);
//            st.executeUpdate();
//        } catch (Exception e) {
//            
//        }
//    }

    public Customer CustomerbyEmail(String email) {
        String sql = """
                     SELECT *
                       FROM [dbo].[Customer]
                       WHERE Email = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Customer c = new Customer();
                c.setGender(resultSet.getInt("Gender"));
                c.setCustomerID(resultSet.getInt("CustomerID"));
                c.setAddress(resultSet.getString("Address"));
                c.setPhone(resultSet.getString("Phone"));
                c.setRoleID(resultSet.getInt("RoleID"));
                c.setPassword(resultSet.getString("Password"));
                c.setName(resultSet.getString("Name"));
                c.setImage(resultSet.getString("Image"));
                c.setEmail(resultSet.getString("Email"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Customer getByCustomerID(int customerID) {
        String sql = "SELECT * FROM Customer WHERE CustomerID = ?";
        Customer customer = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, customerID);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                customer = new Customer();
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setAddress(rs.getString("Address"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhone(rs.getString("Phone"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setPassword(rs.getString("Password"));
                customer.setName(rs.getString("Name"));
                customer.setImage(rs.getString("Image"));
                customer.setGender(rs.getInt("gender"));
                customer.setVerifiedStatus(rs.getInt("verify_Status"));
                // customer.setCreatedDate(rs.getDate("CreatedDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer; // Trả về đối tượng customer, không phải null
    }

    public List<Customer> getAll() {
        List<Customer> customers = new ArrayList<>();
        String sql = "select * from Customer where verify_Status != 0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setAddress(rs.getString("Address"));
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setEmail(rs.getString("Email"));
                customer.setGender(rs.getInt("Gender"));
                customer.setImage(rs.getString("Image"));
                customer.setPhone(rs.getString("Phone"));
                customer.setName(rs.getString("Name"));
                customer.setPassword(rs.getString("Password"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setStatus(rs.getInt("status"));
                //    customer.setVerifiedStatus(rs.getInt("Status"));

                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    public List<Customer> getListByPage(List<Customer> list, int start, int end) {
        ArrayList<Customer> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Customer> getSortedCustomer(String sortBy) {
        List<Customer> customers = new ArrayList<>();
        String sql = """
                     select * from Customer where verify_Status != 0""";
        switch (sortBy) {
            case "fullName":
                sql += " ORDER BY Name";
                break;
            case "email":
                sql += " ORDER BY Email";
                break;
            case "mobile":
                sql += " ORDER BY Phone";
                break;
            case "status":
                sql += " ORDER BY status";
                break;
            default:
                sql += " ORDER BY CustomerID";
                break;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setAddress(rs.getString("Address"));
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setEmail(rs.getString("Email"));
                customer.setGender(rs.getInt("Gender"));
                customer.setImage(rs.getString("Image"));
                customer.setPhone(rs.getString("Phone"));
                customer.setName(rs.getString("Name"));
                customer.setPassword(rs.getString("Password"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setStatus(rs.getInt("status"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;

    }

    public List<Customer> filterCustomer(String fullName, String email, String mobile, int status) {
        List<Customer> customers = new ArrayList<>();
        String sql1 = """
                       select * from Customer where verify_Status != 0""";
        String sql2 = "";

        if (fullName != null && !fullName.isEmpty()) {
            sql2 += "AND Name LIKE ?  ";
        }
        if (email != null && !email.isEmpty()) {
            sql2 += "AND Email LIKE  ? ";
        }
        if (mobile != null && !mobile.isEmpty()) {
            sql2 += "AND Phone LIKE ?  ";
        }
        if (status == 1 || status == 0) {
            sql2 += "AND Status = ? ";
        }

        String sql = sql1 + sql2;

        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (fullName != null && !fullName.isEmpty()) {
                statement.setString(parameterIndex++, "%" + fullName + "%");
            }
            if (email != null && !email.isEmpty()) {
                statement.setString(parameterIndex++, "%" + email + "%");
            }
            if (mobile != null && !mobile.isEmpty()) {
                statement.setString(parameterIndex++, "%" + mobile + "%");
            }
            if (status == 1 || status == 0) {
                statement.setInt(parameterIndex++, status);
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setAddress(rs.getString("Address"));
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setEmail(rs.getString("Email"));
                customer.setGender(rs.getInt("Gender"));
                customer.setImage(rs.getString("Image"));
                customer.setPhone(rs.getString("Phone"));
                customer.setName(rs.getString("Name"));
                customer.setPassword(rs.getString("Password"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setStatus(rs.getInt("status"));

                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    PreparedStatement stm; //thực hiện câu lệnh sql
    ResultSet rs; //lưu trữ dữ liệu l

    public List<ChangeHistory> getChangeHistory(int customerID) {
        List<ChangeHistory> historyList = new ArrayList<>();
        try {
            String sql
                    = "SELECT * FROM ChangeHistory WHERE CustomerID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            rs = stm.executeQuery();
            while (rs.next()) {
                ChangeHistory history = new ChangeHistory(
                        rs.getInt("ChangeID"),
                        rs.getInt("CustomerID"),
                        rs.getString("Email"),
                        rs.getString("Name"),
                        rs.getString("Gender"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getString("UpdatedBy"),
                        rs.getTimestamp("UpdatedDate").toLocalDateTime()
                );
                historyList.add(history);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historyList;
    }

    public void updateCustomer(Customer customer) {
        try {
            String sql = "UPDATE Customer SET Name =?, Gender =?, Email =?, Phone =?, Address =? WHERE CustomerID =?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, customer.getName());
            stm.setInt(2, Integer.valueOf(customer.getGender()));
            stm.setString(3, customer.getEmail());
            stm.setString(4, customer.getPhone());
            stm.setString(5, customer.getAddress());
            stm.setInt(6, customer.getCustomerID());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertChangeHistory(Customer customer, Account acc) {
        try {
            String sql = "INSERT INTO ChangeHistory (CustomerID, Email, Name, Gender, Phone, Address, UpdatedBy, UpdatedDate) VALUES (?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customer.getCustomerID());
            stm.setString(2, customer.getEmail());
            stm.setString(3, customer.getName());
            stm.setString(4, String.valueOf(customer.getGender()));
            stm.setString(5, customer.getPhone());
            stm.setString(6, customer.getAddress());
            stm.setString(7, acc.getName()); // Assuming "Admin" is the updater
            stm.setString(8, "CURRENT_TIMESTAMP");
            stm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editCustomer(int customerID, String phone, String gender, String image, String name, String address, String email) {
        String sql = "UPDATE [dbo].[Customer]\n"
                + "   SET [Name] = ?,\n"
                + "       [Phone] = ?,\n"
                + "       [gender] = ?,\n"
                + "       [Image] = ?,\n"
                + "       [Address] = ?,\n"
                + "       [Email] = ?\n"
                + " WHERE [CustomerID] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, phone);
            st.setString(3, gender);
            st.setString(4, image);
            st.setString(5, address);
            st.setString(6, email);
            st.setInt(7, customerID);
            // assuming you have the customer ID somewhere in your code
            //  st.setInt(7, id);

            st.executeUpdate();
        } catch (Exception e) {
            // handle exception
        }
    }

    public void insert(String address, String email, String phone, int roleID, int gender,
            String name, String image, int verifiedStatus, Date createdDate) {
        String sql = "INSERT INTO [dbo].[Customer] ([Address], [Email], [Phone], [RoleID],  [Name], [Image], [gender], [verify_Status], [CreatedDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, address);
            st.setString(2, email);
            st.setString(3, phone);
            st.setInt(4, 5);
            // st.setString(5, password);
            st.setString(5, name); // Đây là vị trí của trường 'name' trong câu lệnh SQL
            st.setString(6, image);
            st.setInt(7, gender);
            st.setInt(8, verifiedStatus);
            st.setDate(9, new java.sql.Date(createdDate.getTime()));

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateCustomerStatus(int CustomerID, int status) {
        String sql = "UPDATE [dbo].[Customer]\n"
                + "   SET [Status] = ?\n"
                + "   WHERE CustomerID =?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, CustomerID);
            int updateStatus = statement.executeUpdate();
            return updateStatus > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getTotalRecord() {
        String sql = "SELECT COUNT(*) AS total FROM Customer";
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

    public List<Customer> getAllCustomer(int page, int pageSize) {
        List<Customer> customers = new ArrayList<>();
        String sql = "select * \n"
                + "  From Customer where verify_Status != 0\n"
                + "  ORDER BY CustomerID ASC\n"
                + "  OFFSET ? ROWS\n"
                + "  FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setAddress(rs.getString("Address"));
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setEmail(rs.getString("Email"));
                customer.setGender(rs.getInt("Gender"));
                customer.setImage(rs.getString("Image"));
                customer.setPhone(rs.getString("Phone"));
                customer.setName(rs.getString("Name"));
                customer.setPassword(rs.getString("Password"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setStatus(rs.getInt("status"));
                //    customer.setVerifiedStatus(rs.getInt("Status"));

                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    public List<Customer> searchUser(int page, int pageSize, String search) {
        List<Customer> listCustomer = new ArrayList<>();
        String sql = "SELECT * FROM Customer WHERE (Name LIKE ? OR Email LIKE ? OR Phone LIKE ?) AND verify_Status != 0\n"
                + "ORDER BY CustomerID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setAddress(resultSet.getString("Address"));
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                customer.setEmail(resultSet.getString("Email"));
                customer.setGender(resultSet.getInt("Gender"));
                customer.setImage(resultSet.getString("Image"));
                customer.setPhone(resultSet.getString("Phone"));
                customer.setName(resultSet.getString("Name"));
                customer.setPassword(resultSet.getString("Password"));
                customer.setRoleID(resultSet.getInt("RoleID"));
                customer.setStatus(resultSet.getInt("status"));
                listCustomer.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCustomer;
    }

    public int getTotalRecordBySearchUser(String search) {
        String sql = "SELECT COUNT(*) FROM Customer WHERE Name LIKE ? OR Email LIKE ? OR Phone LIKE ?";
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

    public List<Customer> getSortedCustomer(String sortBy, int page, int pageSize) {
        List<Customer> listFound = new ArrayList<>();
        String baseSql = "SELECT [CustomerID]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[Image]\n"
                + "      ,[Name]\n"
                + "      ,[Gender]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Customer]";
        String orderBySql;

        switch (sortBy) {
            case "id":
                orderBySql = " ORDER BY CustomerID";
                break;
            case "name":
                orderBySql = " ORDER BY Name";
                break;
            case "gender":
                orderBySql = " ORDER BY Gender";
                break;
            case "email":
                orderBySql = " ORDER BY Email";
                break;
            case "status":
                orderBySql = " ORDER BY Status";
                break;
            default:
                orderBySql = " ORDER BY CustomerID";
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
                Customer customer = new Customer();
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                customer.setRoleID(resultSet.getInt("RoleID"));
                customer.setPhone(resultSet.getString("Phone"));
                customer.setEmail(resultSet.getString("Email"));
                customer.setImage(resultSet.getString("Image"));
                customer.setName(resultSet.getString("Name"));
                customer.setGender(resultSet.getInt("Gender"));
                customer.setStatus(resultSet.getInt("Status"));
                customer.setAddress(resultSet.getString("address"));
                listFound.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Customer> filterCustomer(int page, int pageSize, int gender, int status) {
        List<Customer> listCustomer = new ArrayList<>();
        String sql1 = "SELECT * FROM Customer WHERE 1=1 ";
        String sql2 = "";
        if (gender == 1 || gender == 0 || gender == 2) {
            sql2 += "AND Gender = ? ";
        }
        if (status == 1 || status == 0) {
            sql2 += "AND Status = ? ";
        }

        String sql3 = "ORDER BY CustomerID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        String sql = sql1 + sql2 + sql3;

        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (gender == 1 || gender == 0) {
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
                Customer customer = new Customer();
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                customer.setRoleID(resultSet.getInt("RoleID"));
                customer.setPhone(resultSet.getString("Phone"));
                customer.setEmail(resultSet.getString("Email"));
                customer.setImage(resultSet.getString("Image"));
                customer.setName(resultSet.getString("Name"));
                customer.setGender(resultSet.getInt("Gender"));
                customer.setStatus(resultSet.getInt("Status"));
                customer.setAddress(resultSet.getString("address"));
                listCustomer.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCustomer;
    }

    public int getTotalFilteredRecord(int gender, int status) {
        String sql = "SELECT COUNT(*) FROM Customer WHERE 1=1";
        List<Object> params = new ArrayList<>();
        if (gender == 1 || gender == 0) {
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

}
